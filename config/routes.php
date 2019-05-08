<?php

use Slim\Http\Request;
use Slim\Http\Response;

$app->get('/', function(Request $request, Response $response) {
    $response->getBody()->write("It works! This is the default welcome page.");
    return $response;
})->setName('root');

$app->get('/hello/{name}', function (Request $request, Response $response, $args) {

    return $this->smarty->render($response, 'login.tpl', ['name' => $args['name']]);
})->setName('login');