<?php

$app->get('/', function ($req, $res) {
    return $res->withRedirect('/login');
})->setName('index');

$app->map(['GET','POST'],'/login', 'UserController:loginUser')->setName('login');

$app->group('/candidate',
            function () use ($app) {
    $app->get('/dashboard', 'CandidateController:getAllCandidates')->setName('candidateDashboard');

    $app->map(['GET','POST'],'/add', 'CandidateController:addCandidate')->setName('addCandidate');

    $app->get('/profile/{id}', 'CandidateController:viewProfile')->setName('candidateProfile');
});

$app->get('/jobOpening', 'JobsController:getAllJobs')->setName('jobOpening');

$app->post('/jobOpening', 'JobsController:addJob')->setName('addJob');
