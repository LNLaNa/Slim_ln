<?php

use App\Controllers\PageController;
use Slim\Factory\AppFactory;

require __DIR__ . '/vendor/autoload.php';

$app = AppFactory::create();

ORM::configure('mysql:host=localhost;dbname=ln_job');
ORM::configure('username', 'root');
ORM::configure('password', '');

$app->get('/', [PageController::class, 'index']);
$app->get('/job/{id}', [PageController::class, 'job_details']);
$app->get('/browse&nbsp;job', [PageController::class, 'jobs']);

$app->run();