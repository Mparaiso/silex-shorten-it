<?php

$autoload = require __DIR__."/../vendor/autoload.php";
$autoload->add("",__DIR__.'/../app/');
$app = new ShortenIt;

$app['http_cache']->run();
