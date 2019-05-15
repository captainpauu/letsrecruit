<?php

use Slim\Http\Request;
use Slim\Http\Response;
use App\Services\ServiceProvider;
use App\Controllers\CandidateController;

$app->get('/', function (Request $request, Response $response) {
    $response->getBody()->write("It works! This is the default welcome page.");
    return $response;
})->setName('root');

$app->get('/candidateDashboard', function (Request $request, Response $response, $args) {

    return $this->smarty->render($response, 'candidateDashboard.tpl');
})->setName('header');

$app->get('/login', function (Request $request, Response $response, $args) {

    return $this->smarty->render($response, 'login.tpl');
})->setName('login');

$app->get('/addCandidate', function (Request $request, Response $response, $args) {

    return $this->smarty->render($response, 'addCandidate.tpl');
})->setName('addCandidate');

$app->get('/candidateProfile', function (Request $request, Response $response, $args) {

    return $this->smarty->render($response, 'candidateProfile.tpl');
})->setName('candidateProfile');

$app->group('/candidate',
            function () use ($app) {
    $app->get('/profile', 'CandidateController:getAllCandidates');

    $app->get('/add', 'CandidateController:addCandidate');
});

