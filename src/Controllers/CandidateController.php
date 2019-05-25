<?php


namespace App\Controllers;

use App\Dao\CandidateDao;
use App\Dao\JobsDao;
use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;

class CandidateController extends BaseController
{
    protected $dao;
    protected $jobsDao;

    public function __construct(
        $smarty,
        CandidateDao $dao,
        JobsDao $jobsDao
    ) {
        parent::__construct($smarty);
        $this->dao = $dao;
        $this->jobsDao = $jobsDao;
    }

    public function getAllCandidates(RequestInterface $request, ResponseInterface $response)
    {
        $allCandidates = $this->dao->getAllCandidates();
        return $this->smarty->render(
            $response,
            'candidateDashboard.tpl',
            ['allCandidates' => $allCandidates]);
    }

    public function viewProfile(RequestInterface $request, ResponseInterface $response, $args)
    {
        if (!empty($args['id'])) {
            $data = $this->dao->getCandidateById($args['id']);
            $data['gender'] = self::GENDER[$data['gender']];
            $data['marital_status'] = self::MARITAL_STATUS[$data['marital_status']];
            $data['offer_in_hand'] = self::OFFER_IN_HAND[$data['offer_in_hand']];
            $data['reference'] = self::REFERENCE_TYPE[$data['reference']];
            return $this->smarty->render($response, 'candidateProfile.tpl', ['candidate' => $data]);
        } else {
            return false;
        }
    }

    public function addCandidate(RequestInterface $request, ResponseInterface $response)
    {
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
            return $this->smarty->render($response, 'addCandidate.tpl',['jobs' => $allJobs]);
        }
    }

    public function insertCandidate($data)
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

    public function uploadResume($uploadedFiles, $data)
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
}