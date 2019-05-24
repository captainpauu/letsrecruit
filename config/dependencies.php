<?php

use App\Controllers\CandidateController;
use App\Controllers\UserController;
use App\Dao\CandidateDao;
use App\Dao\UserDao;

$container['CandidateController'] = function($c) {
    return new CandidateController(
        $c->get('smarty'),
        $c->get('CandidateDao')
    );
};

$container['CandidateDao'] = function($c) {
    return new CandidateDao(
        $c->get('db')
    );
};

$container['UserController'] = function($c) {
    return new UserController(
        $c->get('smarty'),
        $c->get('UserDao')
    );
};

$container['UserDao'] = function($c) {
    return new UserDao(
        $c->get('db')
    );
};