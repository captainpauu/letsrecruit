<?php


namespace App\Middleware;


use Slim\Container;
use Slim\Views\Smarty;

class Middleware
{
    protected $container;
    protected $smarty;

    public function __construct( Container $container)
    {
        $this->container = $container;
        $this->smarty = $container->get('smarty');
    }
}