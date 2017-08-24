<?php
/**
 * TorrentPier – Bull-powered BitTorrent tracker engine
 *
 * @copyright Copyright (c) 2005-2017 TorrentPier (https://torrentpier.com)
 * @link      https://github.com/torrentpier/torrentpier for the canonical source repository
 * @license   https://github.com/torrentpier/torrentpier/blob/master/LICENSE MIT License
 */

use Dotenv\Dotenv;
use Dotenv\Exception\InvalidPathException;
use Illuminate\Cache\CacheManager;
use Illuminate\Config\Repository;
use Illuminate\Container\Container;
use Illuminate\Database\Capsule\Manager;
use Illuminate\Database\Events\StatementPrepared;
use Illuminate\Events\Dispatcher;
use Illuminate\Filesystem\Filesystem;
use Illuminate\Foundation\Application;
use Illuminate\Translation\FileLoader;
use Illuminate\Translation\Translator;
use Symfony\Component\Finder\Finder;

try {
    (new Dotenv(__DIR__.'/..'))->load();
} catch (InvalidPathException $e) {
    throw $e;
}

/*
 * Create The Application
 * @var Application $app
*/
$app = new Application(
    realpath(__DIR__.'/../')
);
//$app = new Container();
//Container::setInstance($app);
//$app->instance('app', $app);
//$app->instance(Container::class, $app);

$app->singleton(
    Illuminate\Contracts\Console\Kernel::class,
    // in future to overrive use
     App\Console\Kernel::class
//    Illuminate\Foundation\Console\Kernel::class
);

$app->singleton(
    Illuminate\Contracts\Debug\ExceptionHandler::class,
    // in future to override use
    //App\Exceptions\Handler::class
    Illuminate\Foundation\Exceptions\Handler::class
);

/**
 * Service Container
 * @var Container $container
 */
//$container = new Container;
//Container::setInstance($container);

/**
 * Events
 */
$app->instance('events', new Dispatcher);

/**
 * Database
 */
$app->singleton('db', function ($app) {
    /** @var Manager $capsule */
    $capsule = new Manager;

    $capsule->addConnection([
        'driver' => 'mysql',
        'host' => env('DB_HOST', 'localhost'),
        'database' => env('DB_DATABASE', 'torrentpier'),
        'username' => env('DB_USERNAME', 'root'),
        'password' => env('DB_PASSWORD', 'pass'),
        'charset' => 'utf8mb4',
        'collation' => 'utf8mb4_unicode_ci',
        'prefix' => '',
        'strict' => true,
    ]);

    $capsule->setEventDispatcher($app['events']);
    $capsule->setAsGlobal();
    $capsule->bootEloquent();

    return $capsule;
});
$app->instance(Manager::class, $app->make('db'));

/**
 * Database setFetchMode
 * @var Dispatcher $dispatcher
 */
$dispatcher = $app->make('events');
$dispatcher->listen(StatementPrepared::class, function ($event) {
    $event->statement->setFetchMode(PDO::FETCH_ASSOC);
});

/**
 * Request
 */
$app->instance('request', Illuminate\Http\Request::capture());

/**
 * Filesystem
 */
$app->instance('files', new Filesystem);

/**
 * Config
 */
$app->singleton('config', function () {
    /** @var Repository $config */
    $config = new Repository;

    $files = [];

    $configPath = __DIR__ . '/config';

    /** @noinspection ForeachSourceInspection */
    foreach (Finder::create()->files()->name('*.php')->in($configPath) as $file) {
        /** @var \SplFileInfo $file */
        $configFile = $file->getRealPath();
        $files[basename($configFile, '.php')] = $configFile;
    }

    foreach ($files as $key => $path) {
        if ($key === 'tp') {
            // if (!$cfg = OLD_CACHE('bb_config')->get('config_bb_config')) {
            $cfg = [];
            foreach (Manager::table('bb_config')->get()->toArray() as $row) {
                $cfg[$row['config_name']] = $row['config_value'];
            }
            // }
            /** @noinspection PhpIncludeInspection */
            $config->set($key, array_merge(require $path, $cfg));
        } else {
            /** @noinspection PhpIncludeInspection */
            $config->set($key, require $path);
        }
    }

    $config->set('cache', [
        'default' => 'file',
        'stores' => [
            'file' => [
                'driver' => 'file',
                'path' => $config->get('tp.cache.db_dir'),
            ],
        ],
    ]);

    return $config;
});

/**
 * Cache
 */
$app->singleton('cache', function ($app) {
    /** @var CacheManager $cache */
    $cache = new CacheManager($app);

    return $cache->driver();
});

/**
 * Localization
 */
$app->singleton('translator', function ($app) {
    $loader = $app['translation.loader'];
    $locale = $app['config']['app.locale'];

    $trans = new Translator($loader, $locale);

    $trans->setFallback($app['config']['app.fallback_locale']);

    return $trans;
});

$app->singleton('translation.loader', function ($app) {
    return new FileLoader($app['files'], __DIR__ . '/resources/lang');
});

return $app;
