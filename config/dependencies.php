<?php

use App\Controllers\CandidateController;
use App\Controllers\UserController;
use App\Controllers\JobsController;
use App\Dao\CandidateDao;
use App\Dao\UserDao;
use App\Dao\JobsDao;
use App\Dao\TechnologyDao;

$container['CandidateController'] = function($c) {
    return new CandidateController(
        $c->get('smarty'),
        $c->get('CandidateDao'),
        $c->get('JobsDao')
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
        $c->get('UserDao'),
        $c->get('TechnologyDao')
    );
};

$container['UserDao'] = function($c) {
    return new UserDao(
        $c->get('db')
    );
};

$container['TechnologyDao'] = function($c) {
    return new TechnologyDao(
        $c->get('db')
    );
};

$container['JobsController'] = function($c) {
    return new JobsController(
        $c->get('smarty'),
        $c->get('JobsDao')
    );
};

$container['JobsDao'] = function($c) {
    return new JobsDao(
        $c->get('db')
    );
};