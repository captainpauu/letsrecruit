<?php

$app->get('/', function ($req, $res) {
    return $res->withRedirect('/login');
})->setName('index');

$app->map(['GET','POST'],'/login', 'UserController:loginUser')->setName('login');

$app->group('/candidate',
            function () use ($app) {
    $app->get('/dashboard', 'CandidateController:getAllCandidates');

    $app->map(['GET','POST'],'/add', 'CandidateController:addCandidate')->setName('addCandidate');

    $app->get('/profile', function ($req, $res){
        return $this->smarty->render($res, 'candidateProfile.tpl');
    });
});

$app->get('/jobOpening', function ($req, $res){
    return $this->smarty->render($res, 'jobOpening.tpl');
});
