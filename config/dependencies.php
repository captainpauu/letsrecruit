<?php

use App\Controllers\CandidateController;
use App\Dao\CandidateDao;

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