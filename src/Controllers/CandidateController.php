<?php


namespace App\Controllers;

use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;

class CandidateController extends BaseController
{
    public function __construct($smarty)
    {
        parent::__construct($smarty);
    }

    public function getAllCandidates(RequestInterface $request, ResponseInterface $response, $args)
    {
        return $this->smarty->render($response, 'candidateProfile.tpl');
    }

    public function addCandidate(RequestInterface $request, ResponseInterface $response, $args)
    {
        return $this->smarty->render($response, 'addCandidate.tpl');
    }
}