<?php

use App\Controllers\CandidateController;

$container['CandidateController'] = function($c) {
    return new CandidateController(
        $c->get('smarty')
    );
};