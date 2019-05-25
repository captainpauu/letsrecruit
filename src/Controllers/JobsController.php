<?php


namespace App\Controllers;


use App\Dao\JobsDao;
use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;
use Slim\Views\Smarty;

class JobsController extends BaseController
{
    private $dao;

    public function __construct(Smarty $smarty, JobsDao $dao)
    {
        parent::__construct($smarty);
        $this->dao = $dao;
    }

    public function getAllJobs(RequestInterface $request, ResponseInterface $response)
    {
        $allJobs = $this->dao->getAllJobs();
        return $this->smarty->render($response, 'jobOpening.tpl', ['jobs' => $allJobs]);
    }

    public function addJob(RequestInterface $request, ResponseInterface $response)
    {
        $error = '';

        $data = $request->getParsedBody();
        if (!$this->dao->insertJob($data)) {
            $error = 'Error occurred while adding Job';
        }
        $allJobs = $this->dao->getAllJobs();

        return $this->smarty->render($response, 'jobOpening.tpl', [
            'error' => $error,
            'jobs' => $allJobs
        ]);
    }
}