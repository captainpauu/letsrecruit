<?php


namespace App\Controllers;


use App\Dao\JobsDao;
use App\Dao\TechnologyDao;
use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;
use Slim\Container;
use Interop\Container\Exception\ContainerException;

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
     * @param Container $container
     * @param JobsDao $dao
     * @param TechnologyDao $techDao
     * @throws ContainerException
     */
    public function __construct(Container $container, JobsDao $dao, TechnologyDao $techDao)
    {
        parent::__construct($container);
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