<?php


namespace App\Controllers;

use App\Dao\CandidateDao;
use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;

class CandidateController extends BaseController
{
    protected $dao;

    public function __construct($smarty, CandidateDao $dao)
    {
        parent::__construct($smarty);
        $this->dao = $dao;
    }

    public function getAllCandidates(RequestInterface $request, ResponseInterface $response)
    {
        $allCandidates = $this->dao->getAllCandidates();
        return $this->smarty->render(
            $response,
            'candidateDashboard.tpl',
            ['allCandidates' => $allCandidates]);
    }

    public function addCandidate(RequestInterface $request, ResponseInterface $response)
    {
        if ($request->isPost()) {
            $error = '';
            $status = false;

            $data = $request->getParsedBody();
            $check = $this->dao->isCandidateEmailExists($data['email']);
            if (count($check) > 1) {
                $error = "Email already Exists";
            } else {
                if ($this->dao->insertCandidate($data)) {
                    $uploadedFiles = $request->getUploadedFiles();
                    if ($this->uploadResume($uploadedFiles, $data)){
                        $status = true;
                    } else {
                        $error = "Resume upload failed";
                    }
                } else {
                    $error = "Candidate registration failed";
                }
            }

            if ($status)
                return $response->withRedirect('/candidate/dashboard');
            else
                return $this->smarty->render($response, 'addCandidate.tpl', ['error' => $error]);
        } else {
            return $this->smarty->render($response, 'addCandidate.tpl');
        }
    }

    public function uploadResume($uploadedFiles, $data)
    {
        $uploadFile = $uploadedFiles['resume'];
        if ($uploadFile->getError() === UPLOAD_ERR_OK) {
            $filename = $uploadFile->getClientFilename();
            $newFileName = $data['firstName'] . "_resume_" . $filename;
            $uploadFile->moveTo(__DIR__ . "/assets/resumes/$newFileName");

            return $this->dao->insertResumeName($data['email'], $newFileName);
        }
        return false;
    }
}