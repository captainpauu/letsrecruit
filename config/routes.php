<?php

$app->get('/', function ($req, $res) {
    return $res->withRedirect('/login');
})->setName('index');


$app->map(
    ['GET', 'POST'],
    '/login',
    'UserController:loginUser'
)->setName('login');


$app->map(
    ['GET'],
    '/logout',
    'UserController:logoutUser'
)->setName('logout');


$app->group('/candidate',
    function () use ($app) {
        $app->get(
            '/dashboard',
            'CandidateController:getAllCandidates'
        )->setName('candidateDashboard');

        $app->map(
            ['GET', 'POST'],
            '/add',
            'CandidateController:addCandidate'
        )->setName('addCandidate');

        $app->get(
            '/profile/{id}',
            'CandidateController:viewProfile'
        )->setName('candidateProfile');
    });


$app->group('/user',
    function () use ($app) {
        $app->get(
            '/dashboard',
            'UserController:getAllUsers'
        )->setName('userDashboard');

        $app->post(
            '/add',
            'UserController:addUser'
        )->setName('addUser');
    });


$app->group('/interview',
    function () use ($app) {

        $app->post(
            '/schedule/{candidateId}',
            'InterviewController:scheduleInterview'
        )->setName('scheduleInterview');

        $app->get(
            '/request/{id}/{candidateId}/{action}',
            'InterviewController:interviewRequestAction'
        )->setName('interviewRequest');

        $app->get(
            '/request/dashboard',
            'InterviewController:getAllInterviewRequests'
        )->setName('interviewRequest');

        $app->post(
            '/feedback/{id}/{candidateId}',
            'InterviewController:submitFeedback'
        )->setName('submitFeedback');

    });


$app->get(
    '/shortlist/{id}/{status}',
    'UserController:candidateShortlisting'
)->setName('shortlisting');


$app->get(
    '/jobOpening',
    'JobsController:getAllJobs'
)->setName('jobOpening');


$app->post(
    '/jobOpening',
    'JobsController:addJob'
)->setName('addJob');
/*
$app->post(
    '/add/technology',
    'UserController:addTechnology'
)->setName('addTech');*/
