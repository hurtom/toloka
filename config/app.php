<?php
/**
 * TorrentPier – Bull-powered BitTorrent tracker engine
 *
 * @copyright Copyright (c) 2005-2017 TorrentPier (https://torrentpier.com)
 * @link      https://github.com/torrentpier/torrentpier for the canonical source repository
 * @license   https://github.com/torrentpier/torrentpier/blob/master/LICENSE MIT License
 */

return [
    'debug' => env('APP_DEBUG', false),
    'locale' => 'uk',
    'fallback_locale' => 'source',
    'key' => env('APP_KEY'),
    'cipher' => 'AES-256-CBC',
    'log' => env('APP_LOG', 'single'),
    'log_level' => env('APP_LOG_LEVEL', 'debug'),
    'providers' => [
        /*
         * Laravel Framework Service Providers...
         */
        Illuminate\Auth\AuthServiceProvider::class,
//        Illuminate\Broadcasting\BroadcastServiceProvider::class,
//        Illuminate\Bus\BusServiceProvider::class,
        Illuminate\Cache\CacheServiceProvider::class,
        Illuminate\Foundation\Providers\ConsoleSupportServiceProvider::class,
//        Illuminate\Cookie\CookieServiceProvider::class,
        Illuminate\Database\DatabaseServiceProvider::class,
        Illuminate\Encryption\EncryptionServiceProvider::class,
        Illuminate\Filesystem\FilesystemServiceProvider::class,
        Illuminate\Foundation\Providers\FoundationServiceProvider::class,
        Illuminate\Hashing\HashServiceProvider::class,
//        Illuminate\Mail\MailServiceProvider::class,
//        Illuminate\Notifications\NotificationServiceProvider::class,
//        Illuminate\Pagination\PaginationServiceProvider::class,
//        Illuminate\Pipeline\PipelineServiceProvider::class,
        Illuminate\Queue\QueueServiceProvider::class,
        Illuminate\Redis\RedisServiceProvider::class,
//        Illuminate\Auth\Passwords\PasswordResetServiceProvider::class,
        Illuminate\Session\SessionServiceProvider::class,
        Illuminate\Translation\TranslationServiceProvider::class,
        Illuminate\Validation\ValidationServiceProvider::class,
//        Illuminate\View\ViewServiceProvider::class,

        /*
         * Doctrine ORM & Migrations
         */
         LaravelDoctrine\ORM\DoctrineServiceProvider::class,
         LaravelDoctrine\Migrations\MigrationsServiceProvider::class,

        /*
         * Application Service Providers...
         */
//        App\Providers\AppServiceProvider::class,
//        App\Providers\AuthServiceProvider::class,
//         App\Providers\BroadcastServiceProvider::class,
//        App\Providers\EventServiceProvider::class,
//        App\Providers\RouteServiceProvider::class,
    ],
    'aliases' => [
        'App' => Illuminate\Support\Facades\App::class,
        'Artisan' => Illuminate\Support\Facades\Artisan::class,
        'Auth' => Illuminate\Support\Facades\Auth::class,
        //'Cache' => Illuminate\Support\Facades\Cache::class,
        //'Config' => Illuminate\Support\Facades\Config::class,
        //'Crypt' => Illuminate\Support\Facades\Crypt::class,
        'DB' => Illuminate\Support\Facades\DB::class,
        'Eloquent' => Illuminate\Database\Eloquent\Model::class,
        'File' => Illuminate\Support\Facades\File::class,
        //'Password' => Illuminate\Support\Facades\Password::class,
        //'Redis' => Illuminate\Support\Facades\Redis::class,
        'Schema' => Illuminate\Support\Facades\Schema::class,
        //'Session' => Illuminate\Support\Facades\Session::class,
        'Storage' => Illuminate\Support\Facades\Storage::class,
        //'URL' => Illuminate\Support\Facades\URL::class,
        //'Validator' => Illuminate\Support\Facades\Validator::class,
        // doctrine
        'EntityManager' => LaravelDoctrine\ORM\Facades\EntityManager::class,
        'Registry' => LaravelDoctrine\ORM\Facades\Registry::class,
        'Doctrine' => LaravelDoctrine\ORM\Facades\Doctrine::class,
    ],
];
