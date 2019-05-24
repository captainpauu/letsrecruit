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
            $uploadedFiles = $request->getUploadedFiles();
            $this->uploadResume($uploadedFiles, $data);
            exit;
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
                return $this->smarty->render($response, 'addCandidate.tpl', ['error' => $error]);
            }
        } else {
            return $this->smarty->render($response, 'addCandidate.tpl');
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
            $uploadFile->moveTo("../../public/assets/resumes/" . $newFileName);

            return $this->dao->insertResumeName($data['email'], $newFileName);
        }
        return false;
    }
}