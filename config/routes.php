<?php

$app->group('/candidate',
            function () use ($app) {
    $app->get('/dashboard', 'CandidateController:getAllCandidates');

    $app->get('/add', 'CandidateController:addCandidate');
});

