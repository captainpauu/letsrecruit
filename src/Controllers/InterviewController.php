<?php


namespace App\Controllers;


use App\Dao\InterviewDao;
use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;
use Slim\Views\Smarty;

class InterviewController extends BaseController
{
    protected $dao;

    public function __construct(Smarty $smarty, InterviewDao $dao)
    {
        parent::__construct($smarty);
        $this->dao = $dao;
    }

    public function scheduleInterview(RequestInterface $request, ResponseInterface $response, $args)
    {
        $data = $request->getParsedBody();
        $candidateId = $args['candidateId'];
        $userId = $_SESSION['loggedinUser']['id'];
        $this->dao->scheduleInterview($candidateId, $userId, $data);
        return $response->withRedirect('/candidate/profile/' . $candidateId);

    }
}