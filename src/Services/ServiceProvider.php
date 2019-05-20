<?php


namespace App\Services;

use App\Controllers\BaseController;
use App\Controllers\CandidateController;
use Slim\App;
use Slim\Container;

class ServiceProvider
{
    /**
     * @var App
     */
    protected $app;
    /**
     * @var Container
     */
    protected $container;

    public function __construct(App $app)
    {
        $this->app = $app;
        $this->container = $app->getContainer();
    }

    public function __invoke()
    {
        $this->container['BaseController'] = function($c) {
            return new BaseController(
                $c->get('smarty')
            );
        };

        /*$this->container['CandidateController'] = function($c) {
            return new CandidateController(
                $c->get('smarty')
            );
        };*/
    }
}