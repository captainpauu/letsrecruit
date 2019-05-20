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
}