<?php


namespace App\Controllers;

use App\Dao\CandidateDao;
use App\Dao\InterviewDao;
use App\Dao\JobsDao;
use App\Dao\UserDao;
use MongoDB\Driver\ReadPreference;
use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;
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
     * CandidateController constructor.
     * @param Smarty $smarty
     * @param CandidateDao $dao
     * @param UserDao $userDao
     * @param JobsDao $jobsDao
     * @param InterviewDao $interviewDao
     */
    public function __construct(
        Smarty $smarty,
        CandidateDao $dao,
        UserDao $userDao,
        JobsDao $jobsDao,
        InterviewDao $interviewDao
    ) {
        parent::__construct($smarty);
        $this->dao = $dao;
        $this->userDao = $userDao;
        $this->jobsDao = $jobsDao;
        $this->interviewDao = $interviewDao;
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
        $allCandidates = $this->dao->getAllCandidates();
        return $this->smarty->render(
            $response,
            'candidateDashboard.tpl',
            ['allCandidates' => $allCandidates]);
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
        $data = [];
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
        if ($request->isPost()) {
            $error = '';
            $status = false;

            $data = $request->getParsedBody();

            $check = $this->dao->isCandidateEmailExists($data['email']);
            if (count($check) > 1) {
                $error = "Email already Exists";
            } else {
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
            }

            if ($status) {
                return $response->withRedirect('/candidate/dashboard');
            } else {
                return $this->smarty->render($response, 'addCandidate.tpl', [
                    'error' => $error,
                    'jobs' => $allJobs
                ]);
            }
        } else {
            return $this->smarty->render($response, 'addCandidate.tpl', ['jobs' => $allJobs]);
        }
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