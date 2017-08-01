<?php

namespace {
    // common.php
    function sql_dbg_enabled()
    {
        return (SQL_DEBUG && DBG_USER && !empty($_COOKIE['sql_log']));
    }

    // common.php
    function array_deep(&$var, $fn, $one_dimensional = false, $array_only = false)
    {
        if (is_array($var)) {
            foreach ($var as $k => $v) {
                if (is_array($v)) {
                    if ($one_dimensional) {
                        unset($var[$k]);
                    } elseif ($array_only) {
                        $var[$k] = $fn($v);
                    } else {
                        array_deep($var[$k], $fn);
                    }
                } elseif (!$array_only) {
                    $var[$k] = $fn($v);
                }
            }
        } elseif (!$array_only) {
            $var = $fn($var);
        }
    }

    // common.php
    function str_compact($str)
    {
        return preg_replace('#\s+#u', ' ', trim($str));
    }

    // library/includes/functions.php
    function bit2dec($bit_num)
    {
        if (is_array($bit_num)) {
            $dec = 0;
            foreach ($bit_num as $bit) {
                $dec |= (1 << $bit);
            }
            return $dec;
        }
        return (1 << $bit_num);
    }

    /*
     * Some hacks to get legacy code working
     */
    if (!defined('BB_ROOT')) {
        define('BB_ROOT', __DIR__.'/../../');
    }
    if (!array_key_exists('HTTP_HOST', $_SERVER)) {
        $_SERVER['HTTP_HOST'] = 'cli';
    }

    require_once BB_ROOT.'library/defines.php';
    require_once BB_ROOT.'library/config.php';
    define('DBG_USER', (isset($_COOKIE[COOKIE_DBG])));
    // require_once BB_ROOT.'library/includes/functions.php';
    define('AUTH_ALL', 0);
    define('AUTH_VIEW', 1);
    define('AUTH_READ', 2);
    define('AUTH_MOD', 3);
    define('AUTH_POST', 4);
    define('AUTH_REPLY', 5);
    define('AUTH_EDIT', 6);
    define('AUTH_DELETE', 7);
    define('AUTH_STICKY', 8);
    define('AUTH_ANNOUNCE', 9);
    define('AUTH_VOTE', 10);
    define('AUTH_POLLCREATE', 11);
    define('AUTH_ATTACH', 12);
    define('AUTH_DOWNLOAD', 13);

    $datastore = new \TorrentPier\Legacy\Datastore\File($bb_cfg['cache']['db_dir'] . 'datastore/', $bb_cfg['cache']['prefix']);
    $GLOBALS['datastore'] = $datastore;
    require_once BB_ROOT.'library/includes/bbcode.php';
}

namespace App\Helpers {

    use TorrentPier\Legacy\BBCode;

    class BBCodeHelper
    {
        // corresponds to $bf['forum_perm'] from library/includes/functions.php
        const FORUM_PERM = [
            'auth_view' => AUTH_VIEW,
            'auth_read' => AUTH_READ,
            'auth_mod' => AUTH_MOD,
            'auth_post' => AUTH_POST,
            'auth_reply' => AUTH_REPLY,
            'auth_edit' => AUTH_EDIT,
            'auth_delete' => AUTH_DELETE,
            'auth_sticky' => AUTH_STICKY,
            'auth_announce' => AUTH_ANNOUNCE,
            'auth_vote' => AUTH_VOTE,
            'auth_pollcreate' => AUTH_POLLCREATE,
            'auth_attachments' => AUTH_ATTACH,
            'auth_download' => AUTH_DOWNLOAD,
        ];

        /**
         * @var \TorrentPier\Legacy\BBCode $bbcode
         */
        private $bbcode;

        /**
         * Constructor
         */
        public function __construct()
        {
            $this->bbcode = new BBCode();
        }

    }
}
