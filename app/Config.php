<?php
use Silex\ServiceProviderInterface;
use Silex\Provider\HttpCacheServiceProvider;
use Mparaiso\Provider\DoctrineORMServiceProvider;
use Mparaiso\Provider\UrlShortenerAppServiceProvider;
use Silex\Provider\FormServiceProvider;
use Silex\Provider\DoctrineServiceProvider;
use Silex\Provider\TwigServiceProvider;
use Silex\Provider\SessionServiceProvider;
use Silex\Provider\TranslationServiceProvider;
use Mparaiso\Provider\ConsoleServiceProvider;
use Silex\Provider\ValidatorServiceProvider;
use Silex\Provider\UrlGeneratorServiceProvider;
use Silex\Provider\MonologServiceProvider;
use Silex\Application;

class Config implements ServiceProviderInterface
{
    public function register(Application $app)
    {
        !defined("ROOT") AND define("ROOT", __DIR__);
        if (isset($_SERVER['SERVER_NAME']) && $_SERVER['SERVER_NAME'] == "localhost"
            || getenv('SYMFONY__SHORTEN__ENV')=='development') {
            $app['debug'] = TRUE;
        }
        $app->register(new MonologServiceProvider,
            array('monolog.logfile' => ROOT . '/../temp/' . date("Y-m-d") . '.txt'));
        $app->register(new UrlGeneratorServiceProvider);
        $app->register(new ValidatorServiceProvider);
        $app->register(new ConsoleServiceProvider);
        $app->register(new SessionServiceProvider);
        $app->register(new TranslationServiceProvider);
        $app->register(new TwigServiceProvider);
        $app->register(new FormServiceProvider);
        $app->register(new HttpCacheServiceProvider,array('http_cache.cache_dir'=>ROOT.'/../temp/'));
        $app->register(new DoctrineServiceProvider, array(
            "db.options" => array(
                "dbname"   => getenv('SYMFONY__SHORTEN__DBNAME'),
                "host"     => getenv('SYMFONY__SHORTEN__HOST'),
                "user" => getenv('SYMFONY__SHORTEN__USER'),
                "password" => getenv('SYMFONY__SHORTEN__PASSWORD'),
//                "port"     => getenv('SYMFONY__SHORTEN__PORT'),
                "driver"   => "pdo_mysql",
            )
        ));
        $app->register(new DoctrineORMServiceProvider,array(
            'orm.proxy_dir'=>ROOT.'/Proxy/',
        ));
        $app->register(new UrlShortenerAppServiceProvider);
        $app->mount("/", $app['url_shortener.controller']);

    }

    public function boot(Application $app)
    {
    }
}