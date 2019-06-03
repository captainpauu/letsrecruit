<?php


namespace App\Controllers;


use App\Dao\JobsDao;
use App\Dao\TechnologyDao;
use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;
use Slim\Views\Smarty;

class JobsController extends BaseController
{
    /**
     * @var JobsDao
     */
    private $dao;
    /**
     * @var TechnologyDao
     */
    private $techDao;

    /**
     * JobsController constructor.
     * @param Smarty $smarty
     * @param JobsDao $dao
     * @param TechnologyDao $techDao
     */
    public function __construct(Smarty $smarty, JobsDao $dao, TechnologyDao $techDao)
    {
        parent::__construct($smarty);
        $this->dao = $dao;
        $this->techDao = $techDao;
    }

    public function getAllJobs(RequestInterface $request, ResponseInterface $response)
    {
        $allJobs = $this->dao->getAllJobs();
        $allTechs = $this->techDao->getAllTechnologies();
        return $this->smarty->render($response, 'jobOpening.tpl', [
            'jobs' => $allJobs,
            'techs' => $allTechs
        ]);
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