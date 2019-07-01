<?php


namespace App\Controllers;

use App\Dao\CandidateDao;
use App\Dao\ConsultancyDao;
use App\Dao\InterviewDao;
use App\Dao\JobsDao;
use App\Dao\UserDao;
use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;
use Slim\Container;
use Slim\Views\Smarty;

class CandidateController extends BaseController
{
    /**
     * @var CandidateDao
     */
    protected $dao;
    /**
     * @var UserDao
     */
    protected $userDao;
    /**
     * @var JobsDao
     */
    protected $jobsDao;
    /**
     * @var InterviewDao
     */
    protected $interviewDao;
    /**
     * @var ConsultancyDao
     */
    protected $consultDao;

    /**
     * CandidateController constructor.
     * @param Container $container
     * @param CandidateDao $dao
     * @param UserDao $userDao
     * @param JobsDao $jobsDao
     * @param InterviewDao $interviewDao
     * @param ConsultancyDao $consultDao
     * @throws \Interop\Container\Exception\ContainerException
     */
    public function __construct(
        Container $container,
        CandidateDao $dao,
        UserDao $userDao,
        JobsDao $jobsDao,
        InterviewDao $interviewDao,
        ConsultancyDao $consultDao
    ) {
        parent::__construct($container);
        $this->dao = $dao;
        $this->userDao = $userDao;
        $this->jobsDao = $jobsDao;
        $this->interviewDao = $interviewDao;
        $this->consultDao = $consultDao;
    }

    /**
     * @param RequestInterface $request
     * @param ResponseInterface $response
     * @return ResponseInterface
     */
    public function getAllCandidates(RequestInterface $request, ResponseInterface $response)
    {
        if (self::ROLE[$this->user['role']] !== 'Admin') {
            return $this->notAuthorised();
        }
        $status = [];
        $allCandidates = $this->dao->getAllCandidates();
        foreach ($allCandidates as $candidate){
            $status[$candidate['id']] = $this->getCandidateStatus($candidate['id']);
        }
        return $this->smarty->render(
            $response,
            'candidateDashboard.tpl',
            ['allCandidates' => $allCandidates, 'status' => $status ]);
    }

    /**
     * @param $id
     * @return array
     */
    public function getCandidateStatus($id)
    {
        $status = [];
        $round = $this->interviewDao->getRoundStatus($id);

        if (empty($round)) {
            $shortlist = $this->dao->getShortlistStatus($id);
            $status['round'] = 'Shortlist - ';

            if ($shortlist) {
                $status['status'] = self::SHORTLIST_STATUS[$shortlist['is_shortlisted']];
                $status['badge_class'] = $this->getBadgeClass($shortlist['is_shortlisted']);
            } else {
                $status['status'] = self::SHORTLIST_STATUS[0];
                $status['badge_class'] = $this->getBadgeClass(0);
            }

        } else {
            $status['round'] = 'Round - ' . $round['round_number'];
            $status['status'] = self::ROUND_STATUS[$round['round_status']];
            $status['badge_class'] = $this->getBadgeClass($round['round_status']);
        }
        return $status;
    }

    /**
     * @param RequestInterface $request
     * @param ResponseInterface $response
     * @param $args
     * @return bool|ResponseInterface
     */
    public function viewProfile(RequestInterface $request, ResponseInterface $response, $args)
    {
        $id = $args['id'];
        if (!empty($id)) {
            $data = $this->getCandidateData($id);
            $allUsers = $this->userDao->getAllUsers();
            $scheduleStatus = $this->interviewDao->currentInterviewStatus($id);
            $scheduleStatus['scheduled_date'] = $this->convertDateFormat($scheduleStatus['scheduled_date']);

            $interviewRounds = $this->interviewDao->getAllRoundsOfCandidate($id);
            foreach ($interviewRounds as $key => $round) {
                $interviewRounds[$key]['scheduled_date'] = $this->convertDateFormat($round['scheduled_date']);
            }

            return $this->smarty->render($response, 'candidateProfile.tpl', [
                'candidate' => $data,
                'users' => $allUsers,
                'schedule' => $scheduleStatus,
                'rounds' => $interviewRounds
            ]);

        } else {
            return false;
        }
    }

    /**
     * @param $candidateId
     * @return mixed
     */
    public function getCandidateData($candidateId) : array
    {
        $data = $this->dao->getCandidateById($candidateId);
        if(!empty($data)) {
            $data['birth_date'] = $this->convertDateFormat($data['birth_date'], false);
            $data['shortlist_date'] = $this->convertDateFormat($data['shortlist_date'], false);
            $data['gender'] = self::GENDER[$data['gender']];
            $data['marital_status'] = self::MARITAL_STATUS[$data['marital_status']];
            $data['offer_in_hand'] = self::OFFER_IN_HAND[$data['offer_in_hand']];
            $data['reference'] = self::REFERENCE_TYPE[$data['reference']];
        }
        return $data;
    }

    /**
     * @param RequestInterface $request
     * @param ResponseInterface $response
     * @return mixed
     */
    public function addCandidate(RequestInterface $request, ResponseInterface $response)
    {
        if (self::ROLE[$this->user['role']] !== 'Admin') {
            return $this->notAuthorised($request, $response);
        }
        $allJobs = $this->jobsDao->getAllJobs();
        $allConsultancies = $this->consultDao->getAllConsultancies();
        if ($request->isPost()) {
            $error = '';
            $status = false;

            $data = $request->getParsedBody();

            if ($this->insertCandidate($data)) {

                $uploadedFiles = $request->getUploadedFiles();
                if ($this->uploadResume($uploadedFiles, $data)) {
                    $status = true;
                } else {
                    $error = "Resume upload failed";
                }
            } else {
                $error = "Candidate registration failed";
            }

            if ($status) {
                return $response->withRedirect('/candidate/dashboard');
            } else {
                return $this->smarty->render($response, 'addCandidate.tpl', [
                    'error' => $error,
                    'jobs' => $allJobs,
                    'consultancies' => $allConsultancies
                ]);
            }
        } else {
            return $this->smarty->render($response, 'addCandidate.tpl', [
                'jobs' => $allJobs,
                'consultancies' => $allConsultancies
            ]);
        }
    }

    /**
     * @param RequestInterface $request
     * @param ResponseInterface $response
     * @param $args
     * @return ResponseInterface
     */
    public function editCandidateForm(RequestInterface $request, ResponseInterface $response, $args)
    {
        if (self::ROLE[$this->user['role']] !== 'Admin') {
            return $this->notAuthorised($request, $response);
        }
        $data = $this->dao->getCandidateById($args['id']);
        $allJobs = $this->jobsDao->getAllJobs();
        $allConsultancies = $this->consultDao->getAllConsultancies();
        return $this->smarty->render($response, 'editCandidate.tpl', [
            'candidate' => $data,
            'jobs' => $allJobs,
            'consultancies' => $allConsultancies
        ]);
    }

    /**
     * @param RequestInterface $request
     * @param ResponseInterface $response
     * @param $args
     * @return mixed
     */
    public function updateCandidateData(RequestInterface $request, ResponseInterface $response, $args)
    {
        $id = $args['id'];
        $data = $request->getParsedBody();
        if ($this->dao->updateCandidate($id, $data)){
            return $response->withRedirect('/candidate/profile/' . $id);
        }
        return $response->withRedirect('/candidate/edit/' . $id);
    }

    /**
     * @param RequestInterface $request
     * @param ResponseInterface $response
     * @return mixed
     */
    public function isCandidateEmailExists(RequestInterface $request, ResponseInterface $response)
    {
        $status = true;
        $check = $this->dao->isCandidateEmailExists($_POST['email']);
        if (count($check) > 1) {
            $status = false;
        }
        return $response->withJson(['success' => $status]);
    }

    /**
     * @param $data
     * @return bool
     */
    public function insertCandidate($data) : bool
    {
        if ((int)$data['reference'] === 0) {
            $data['referredBy'] = '';
        } elseif ((int)$data['reference'] === 1) {
            $data['consultancyId'] = 0;
        } else {
            $data['referredBy'] = '';
            $data['consultancyId'] = 0;
        }
        return $this->dao->insertCandidate($data);
    }

    /**
     * @param $uploadedFiles
     * @param $data
     * @return bool
     */
    public function uploadResume($uploadedFiles, $data) : bool
    {
        $uploadFile = $uploadedFiles['resume'];
        if ($uploadFile->getError() === UPLOAD_ERR_OK) {
            $filename = $uploadFile->getClientFilename();
            $newFileName = $data['fname'] . "_resume_" . $filename;
            $uploadFile->moveTo("assets/resumes/$newFileName");

            return $this->dao->insertResumeName($data['email'], $newFileName);
        }
        return false;
    }

    /**
     * @param RequestInterface $request
     * @param ResponseInterface $response
     * @return mixed
     */
    public function deleteCandidate(RequestInterface $request, ResponseInterface $response)
    {
        $id = $_POST['candidateId'];
        $success = false;
        if ($this->dao->deleteCandidate($id)){
            $success = true;
        }
        return $response->withJson(['success' => $success]);
    }
}