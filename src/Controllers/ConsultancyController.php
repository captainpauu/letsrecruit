<?php


namespace App\Controllers;


use App\Dao\ConsultancyDao;
use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;
use Slim\Container;
use Interop\Container\Exception\ContainerException;

class ConsultancyController extends BaseController
{
    /**
     * @var ConsultancyDao
     */
    protected $dao;

    /**
     * ConsultancyController constructor.
     * @param Container $container
     * @param ConsultancyDao $dao
     * @throws ContainerException
     */
    public function __construct(Container $container, ConsultancyDao $dao)
    {
        parent::__construct($container);
        $this->dao =$dao;
    }

    public function getAllConsultData()
    {
        $consultancies = $this->dao->getAllConsultancies();
        $consults = $this->dao->getAllConsults();
    }

    public function getAllConsultancies(RequestInterface $request, ResponseInterface $response)
    {
        $all = $this->dao->getAllConsultancies();
        return $this->smarty->render($response, '', [
            'consultancies' => $all,
        ]);
    }

    public function getAllConsults(RequestInterface $request, ResponseInterface $response)
    {
        $allConsults = $this->dao->getAllConsults();
        return $this->smarty->render($response, '', [
            'consults' => $allConsults,
        ]);
    }
}