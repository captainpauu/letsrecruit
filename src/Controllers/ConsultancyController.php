<?php


namespace App\Controllers;


use App\Dao\ConsultancyDao;
use Slim\Views\Smarty;

class ConsultancyController extends BaseController
{
    /**
     * @var ConsultancyDao
     */
    protected $dao;

    /**
     * ConsultancyController constructor.
     * @param Smarty $smarty
     * @param ConsultancyDao $dao
     */
    public function __construct(Smarty $smarty, ConsultancyDao $dao)
    {
        parent::__construct($smarty);
        $this->dao =$dao;
    }
}