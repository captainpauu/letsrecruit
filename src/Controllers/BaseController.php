<?php


namespace App\Controllers;

use Slim\Views\Smarty;

class BaseController
{
    protected $smarty;

    public function __construct(Smarty $smarty) {
        $this->smarty = $smarty;
    }
}