<?php

use App\Middleware\AuthMiddleware;
use App\Middleware\CsrfViewMiddleware;

$app->get('/test', function ($req, $res) {
    return $this->smarty->render($res, 'adminDashboard.tpl');
})->setName('test');

$app->get('/', function ($req, $res) {
    return $res->withRedirect('/login');
})->setName('index');


$app->map(
    ['GET', 'POST'],
    '/login',
    'UserController:loginUser'
)->setName('login')->add(new CsrfViewMiddleware($container));


$app->map(
    ['GET'],
    '/logout',
    'UserController:logoutUser'
)->setName('logout');


$app->get('/restricted', function ($req, $res) {
    return $this->smarty->render($res, 'restricted.tpl');
})->setName('restricted');


$app->group('', function () use ($app) {

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

            $app->get(
                '/edit/{id}',
                'CandidateController:editCandidateForm'
            )->setName('editForm');

            $app->post(
                '/update/{id}',
                'CandidateController:updateCandidateData'
            )->setName('updateCandidate');

            $app->post(
                '/delete',
                'CandidateController:deleteCandidate'
            )->setName('deleteCandidate');

            $app->post(
                '/check-email',
                'CandidateController:isCandidateEmailExists'
            )->setName('checkEmail');
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

            $app->post(
                '/offer-job',
                'UserController:offerJob'
            )->setName('offerJob');

            $app->post(
                '/check-email',
                'UserController:isUserEmailExists'
            )->setName('checkUserEmail');

            $app->post(
                '/check-user-name',
                'UserController:isUserNameExists'
            )->setName('checkUserEmail');

            $app->post(
                '/delete',
                'UserController:deleteUser'
            )->setName('deleteUser');
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
            )->setName('requestAction');

            $app->get(
                '/request/dashboard',
                'InterviewController:getAllInterviewRequests'
            )->setName('interviewRequest');

            $app->post(
                '/feedback/{id}/{candidateId}',
                'InterviewController:submitFeedback'
            )->setName('submitFeedback');

        });


    $app->group('/consultancy',
        function () use ($app) {
            $app->get(
                '/dashboard',
                'ConsultancyController:getAllConsultData'
            )->setName('userDashboard');
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

})->add(new CsrfViewMiddleware($container))
    ->add(new AuthMiddleware($container));