<?php
/**
 * MIT License
 *
 * Copyright (c) 2005-2017 TorrentPier
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

if (!defined('BB_ROOT')) {
    die(basename(__FILE__));
}

// $domain_name = 'torrentpier.me'; // enter here your primary domain name of your site
// $domain_name = (!empty($_SERVER['SERVER_NAME'])) ? $_SERVER['SERVER_NAME'] : $domain_name;
$domain_name = $_SERVER['HTTP_HOST'];

$bb_cfg = [];

// Increase number after changing js or css
$bb_cfg['js_ver'] = $bb_cfg['css_ver'] = 1;

// Version info
$bb_cfg['tp_version'] = '2.2.1';
$bb_cfg['tp_release_date'] = '16-06-2017';
$bb_cfg['tp_release_codename'] = 'Aurochs';

// Database


$bb_cfg['db'] = [
    'db' => [
        env('DB_HOST'),
        env('DB_DATABASE'),
        env('DB_USERNAME'),
        env('DB_PASSWORD'),
        'utf8',
        false
    ],
];

$bb_cfg['db_alias'] = [
    'log' => 'db', // BB_LOG
    'search' => 'db', // BB_TOPIC_SEARCH
    'sres' => 'db', // BB_BT_USER_SETTINGS, BB_SEARCH_RESULTS
    'u_ses' => 'db', // BB_USER_SES, BB_USER_LASTVISIT
    'dls' => 'db', // BB_BT_DLS_*
    'ip' => 'db', // BB_POSTS_IP
    'ut' => 'db', // BB_TOPICS_USER_POSTED
    'pm' => 'db', // BB_PRIVMSGS, BB_PRIVMSGS_TEXT
    'pt' => 'db', // BB_POSTS_TEXT
];

// Cache
$bb_cfg['cache'] = [
    'pconnect' => true,
    'db_dir' => realpath(BB_ROOT) . '/internal_data/cache/filecache/',

    'prefix' => 'tp_',
    'memcache' => [
        'host' => '127.0.0.1',
        'port' => 11211,
        'pconnect' => true,
        'con_required' => true,
    ],
    'redis' => [
        'host' => '127.0.0.1',
        'port' => 6379,
        'con_required' => true,
    ],
    // Available cache types: memcache, sqlite, redis, apc, xcache (default of filecache)
    'engines' => [
        'bb_cache' => ['filecache', []],
        'bb_config' => ['filecache', []],
        'tr_cache' => ['filecache', []],
        'session_cache' => ['filecache', []],
        'bb_cap_sid' => ['filecache', []],
        'bb_login_err' => ['filecache', []],
        'bb_poll_data' => ['filecache', []],
    ],
];

// Datastore
// Available datastore types: memcache, sqlite, redis, apc, xcache  (default filecache)
$bb_cfg['datastore_type'] = 'filecache';

// Server
$bb_cfg['server_name'] = $domain_name; // The domain name from which this board runs
$bb_cfg['server_port'] = (!empty($_SERVER['SERVER_PORT'])) ? $_SERVER['SERVER_PORT'] : 80; // The port your server is running on
$bb_cfg['script_path'] = '/'; // The path where FORUM is located relative to the domain name

// GZip
$bb_cfg['gzip_compress'] = true; // compress output

// Tracker
$bb_cfg['announce_interval'] = 2400; // Announce interval (default: 1800)
$bb_cfg['passkey_key'] = 'h'; // Passkey key name in GET request
$bb_cfg['ignore_reported_ip'] = false; // Ignore IP reported by client
$bb_cfg['verify_reported_ip'] = true; // Verify IP reported by client against $_SERVER['HTTP_X_FORWARDED_FOR']
$bb_cfg['allow_internal_ip'] = false; // Allow internal IP (10.xx.. etc.)

// Ocelot
$bb_cfg['ocelot'] = [
    'enabled' => false,
    'host' => $domain_name,
    'port' => 34000,
    'url' => "http://$domain_name:34000/", // with '/'
    'secret' => 'some_10_chars', // 10 chars
    'stats' => 'some_10_chars', // 10 chars
];

// FAQ url help link
$bb_cfg['how_to_download_url_help'] = 't1'; // How to download?
$bb_cfg['what_is_torrent_url_help'] = 't2'; // What is a torrent?
$bb_cfg['ratio_url_help'] = 't3'; // Ration
$bb_cfg['search_help_url'] = 't4'; // Search

// Torrents
$bb_cfg['bt_min_ratio_allow_dl_tor'] = 0.3; // 0 - disable
$bb_cfg['bt_min_ratio_warning'] = 0.6; // 0 - disable

$bb_cfg['show_dl_status_in_search'] = true;
$bb_cfg['show_dl_status_in_forum'] = true;
$bb_cfg['show_tor_info_in_dl_list'] = true;
$bb_cfg['allow_dl_list_names_mode'] = true;

// Days to keep torrent registered


$bb_cfg['seeder_last_seen_days_keep'] = 0;
$bb_cfg['seeder_never_seen_days_keep'] = 0;

// DL-Status (days to keep user's dlstatus records)
$bb_cfg['dl_will_days_keep'] = 360;
$bb_cfg['dl_down_days_keep'] = 180;
$bb_cfg['dl_complete_days_keep'] = 180;
$bb_cfg['dl_cancel_days_keep'] = 30;

// Tor-Stats
$bb_cfg['torstat_days_keep'] = 60; // days to keep user's per-torrent stats

// Tor-Help
$bb_cfg['torhelp_enabled'] = false; // find dead torrents (without seeder) that user might help seeding

// URL's
$bb_cfg['ajax_url'] = 'ajax.php'; # "http://{$_SERVER['SERVER_NAME']}/ajax.php"
$bb_cfg['login_url'] = 'login.php'; # "http://{$domain_name}/login.php"
$bb_cfg['posting_url'] = 'posting.php'; # "http://{$domain_name}/posting.php"
$bb_cfg['pm_url'] = 'privmsg.php'; # "http://{$domain_name}/privmsg.php"

// Language
$bb_cfg['charset'] = 'UTF-8'; // page charset
$bb_cfg['auto_language'] = false; // select user-preferred language automatically
$bb_cfg['lang'] = [
















































































































































































    'uk' => [
        'name' => 'Ukrainian',
        'locale' => 'uk_UA.UTF-8',
    ],








];

// Templates
$bb_cfg['templates'] = [

    'default' => 'Default',
];

$bb_cfg['tpl_name'] = 'default';
$bb_cfg['stylesheet'] = 'main.css';

$bb_cfg['show_sidebar1_on_every_page'] = false;
$bb_cfg['show_sidebar2_on_every_page'] = false;

// Cookie
// $bb_cfg['cookie_domain'] = in_array($domain_name, [getenv('SERVER_ADDR'), 'localhost'], true) ? '' : ".$domain_name";
$bb_cfg['cookie_domain'] = '';
$bb_cfg['cookie_secure'] = !empty($_SERVER['HTTPS']) ? 1 : 0;
$bb_cfg['cookie_prefix'] = 'bb_'; // 'bb_'

// Sessions
$bb_cfg['session_update_intrv'] = 180; // sec
$bb_cfg['user_session_duration'] = 1800; // sec
$bb_cfg['admin_session_duration'] = 6 * 3600; // sec
$bb_cfg['user_session_gc_ttl'] = 1800; // number of seconds that a staled session entry may remain in sessions table
$bb_cfg['session_cache_gc_ttl'] = 1200; // sec
$bb_cfg['max_last_visit_days'] = 14; // days
$bb_cfg['last_visit_update_intrv'] = 3600; // sec

// Registration





$bb_cfg['invalid_logins'] = 5;
$bb_cfg['new_user_reg_disabled'] = false;
$bb_cfg['unique_ip'] = false;
$bb_cfg['new_user_reg_restricted'] = false;
$bb_cfg['reg_email_activation'] = false;

// Email
$bb_cfg['emailer'] = [
    'enabled' => false,
    'smtp' => [
        'enabled' => false, // send email via external SMTP server
        'host' => '', // SMTP server host
        'port' => 25, // SMTP server port
        'username' => '', // SMTP username (if server requires it)
        'password' => '', // SMTP password (if server requires it)
    ],
    'ssl_type' => '', // SMTP ssl type (ssl or tls)
];

$bb_cfg['board_email'] = "noreply@$domain_name"; // admin email address
$bb_cfg['board_email_form'] = false; // can users send email to each other via board
$bb_cfg['board_email_sig'] = ''; // this text will be attached to all emails the board sends
$bb_cfg['board_email_sitename'] = $domain_name; // sitename used in all emails header

$bb_cfg['topic_notify_enabled'] = true;
$bb_cfg['pm_notify_enabled'] = true;
$bb_cfg['group_send_email'] = true;
$bb_cfg['email_change_disabled'] = false; // disable changing email by user

$bb_cfg['bounce_email'] = "bounce@$domain_name"; // bounce email address
$bb_cfg['tech_admin_email'] = "admin@$domain_name"; // email for sending error reports
$bb_cfg['abuse_email'] = "abuse@$domain_name";
$bb_cfg['adv_email'] = "adv@$domain_name";

// Bugsnag error reporting
$bb_cfg['bugsnag'] = [
    'enabled' => true,
    'api_key' => 'ee1adc9739cfceb01ce4a450ae1e52bf',
];

// Special users
$bb_cfg['dbg_users'] = [
#	user_id => 'name',
    2 => 'admin',
];
$bb_cfg['unlimited_users'] = [
#	user_id => 'name',
    2 => 'admin',
];
$bb_cfg['super_admins'] = [
#	user_id => 'name',
    2 => 'admin',
];

// Date format
$bb_cfg['date_format'] = 'Y-m-d';

// Subforums
$bb_cfg['sf_on_first_page_only'] = true;

// Forums
$bb_cfg['allowed_topics_per_page'] = [50, 100, 150, 200, 250, 300];

// Topics
$bb_cfg['show_quick_reply'] = true;
$bb_cfg['show_rank_text'] = false;
$bb_cfg['show_rank_image'] = true;
$bb_cfg['show_poster_joined'] = true;
$bb_cfg['show_poster_posts'] = true;
$bb_cfg['show_poster_from'] = true;
$bb_cfg['show_bot_nick'] = false;
$bb_cfg['text_buttons'] = false; // replace EDIT, QUOTE... images with text links
$bb_cfg['parse_ed2k_links'] = true; // make ed2k links clickable
$bb_cfg['post_date_format'] = 'd-M-Y H:i';
$bb_cfg['ext_link_new_win'] = true; // open external links in new window

$bb_cfg['topic_moved_days_keep'] = 7; // remove topic moved links after xx days (or FALSE to disable)
$bb_cfg['allowed_posts_per_page'] = [15, 30, 50, 100];
$bb_cfg['user_signature_start'] = '<div class="signature"><br />_________________<br />';

$bb_cfg['user_signature_end'] = '</div>';

// Posts
$bb_cfg['use_posts_cache'] = true;
$bb_cfg['posts_cache_days_keep'] = 14;
$bb_cfg['max_post_length'] = 120000;
$bb_cfg['use_ajax_posts'] = true;

// Search
$bb_cfg['search_engine_type'] = 'mysql'; // none, mysql, sphinx
$bb_cfg['sphinx_topic_titles_host'] = '127.0.0.1';
$bb_cfg['sphinx_topic_titles_port'] = 3312;
$bb_cfg['sphinx_config_path'] = realpath("../install/sphinx/sphinx.conf");
$bb_cfg['disable_ft_search_in_posts'] = false; // disable searching in post bodies
$bb_cfg['disable_search_for_guest'] = true;
$bb_cfg['allow_search_in_bool_mode'] = true;
$bb_cfg['max_search_words_per_post'] = 200;
$bb_cfg['search_min_word_len'] = 3;
$bb_cfg['search_max_word_len'] = 35;
$bb_cfg['limit_max_search_results'] = false;
$bb_cfg['spam_filter_file_path'] = ''; // BB_PATH .'/misc/spam_filter_words.txt';

// Posting
$bb_cfg['prevent_multiposting'] = true;           // replace "reply" with "edit last msg" if user (not admin or mod) is last topic poster

$bb_cfg['max_smilies'] = 10;

// PM





$bb_cfg['privmsg_disable'] = false;
$bb_cfg['max_outgoing_pm_cnt'] = 10;
$bb_cfg['max_inbox_privmsgs'] = 200;
$bb_cfg['max_savebox_privmsgs'] = 25;
$bb_cfg['max_sentbox_privmsgs'] = 50;
$bb_cfg['pm_days_keep'] = 180;

// Actions log
$bb_cfg['log_days_keep'] = 90;

// Users

$bb_cfg['color_nick'] = true;
$bb_cfg['user_not_activated_days_keep'] = 7;       // "not activated" == "not finished registration"
$bb_cfg['user_not_active_days_keep'] = 180;     // inactive users but only with no posts

// Groups
$bb_cfg['group_members_per_page'] = 50;

// Tidy
$bb_cfg['tidy_post'] = (!in_array('tidy', get_loaded_extensions(), true)) ? false : true;

// Misc
$bb_cfg['mem_on_start'] = MEM_USAGE ? memory_get_usage() : 0;
$bb_cfg['translate_dates'] = true; // in displaying time
$bb_cfg['use_word_censor'] = true;

$bb_cfg['last_visit_date_format'] = 'd-M H:i';
$bb_cfg['last_post_date_format'] = 'd-M-y H:i';

$bb_cfg['poll_max_days'] = 180;

$bb_cfg['allow_change'] = [
    'language' => true,
    'dateformat' => true,
];

$bb_cfg['trash_forum_id'] = 0; // (int) 7

$bb_cfg['first_logon_redirect_url'] = 'index.php';
$bb_cfg['terms_and_conditions_url'] = 'terms.php';
$bb_cfg['tor_help_links'] = 'terms.php';

$bb_cfg['user_agreement_url'] = 'info.php?show=user_agreement';
$bb_cfg['copyright_holders_url'] = 'info.php?show=copyright_holders';
$bb_cfg['advert_url'] = 'info.php?show=advert';

// Extensions
$bb_cfg['file_id_ext'] = [
    1 => 'gif',
    2 => 'gz',
    3 => 'jpg',
    4 => 'png',
    5 => 'rar',
    6 => 'tar',
    7 => 'tiff',
    8 => 'torrent',
    9 => 'zip',
];

// Attachments
$bb_cfg['attach'] = [
    'upload_path' => DATA_DIR . '/torrent_files',

    'max_size' => 5 * 1024 * 1024,
];

$bb_cfg['tor_forums_allowed_ext'] = ['torrent', 'zip', 'rar'];
$bb_cfg['gen_forums_allowed_ext'] = ['zip', 'rar'];

// Avatars
$bb_cfg['avatars'] = [
    'allowed_ext' => ['gif', 'jpg', 'jpeg', 'png'],
    'bot_avatar' => '/gallery/bot.gif',



    'max_size' => 100 * 1024,
    'max_height' => 100,
    'max_width' => 100,
    'no_avatar' => '/gallery/noavatar.png',

    'display_path' => '/data/avatars',
    'upload_path' => BB_PATH . '/data/avatars/',

    'up_allowed' => true,
];

// Group avatars
$bb_cfg['group_avatars'] = [
    'allowed_ext' => ['gif', 'jpg', 'jpeg', 'png'],



    'max_size' => 300 * 1024,
    'max_height' => 300,
    'max_width' => 300,
    'no_avatar' => '/gallery/noavatar.png',

    'display_path' => '/data/avatars',
    'upload_path' => BB_PATH . '/data/avatars/',

    'up_allowed' => true,
];

// Captcha
// Get a Google reCAPTCHA API Key: https://www.google.com/recaptcha/admin
$bb_cfg['captcha'] = [
    'disabled' => true,
    'public_key' => '', // your public key
    'secret_key' => '', // your secret key
    'theme' => 'light', // light or dark
];

// Atom feed
$bb_cfg['atom'] = [
    'path' => INT_DATA_DIR . '/atom', // without ending slash
    'url' => './internal_data/atom', // without ending slash
];

// Nofollow
$bb_cfg['nofollow'] = [
    'disabled' => false,
    'allowed_url' => [$domain_name], // 'allowed.site', 'www.allowed.site'
];

// Page settings
$bb_cfg['page'] = [
    'show_torhelp' => [
        #BB_SCRIPT => true
        'index' => true,
        'tracker' => true,
    ],
    'show_sidebar1' => [
        #BB_SCRIPT => true
        'index' => true,
    ],
    'show_sidebar2' => [
        #BB_SCRIPT => true
        'index' => true,
    ]
];

// Tracker settings
$bb_cfg['tracker'] = [
    'autoclean' => true,
    'off' => false,
    'off_reason' => 'temporarily disabled',
    'numwant' => 50,
    'update_dlstat' => true,
    'expire_factor' => 2.5,
    'compact_mode' => true,
    'upd_user_up_down_stat' => true,
    'browser_redirect_url' => '',
    'scrape' => true,
    'limit_active_tor' => true,
    'limit_seed_count' => 0,
    'limit_leech_count' => 8,
    'leech_expire_factor' => 60,
    'limit_concurrent_ips' => false,
    'limit_seed_ips' => 0,
    'limit_leech_ips' => 0,
    'tor_topic_up' => true,
    'gold_silver_enabled' => true,
    'retracker' => true,
    'retracker_host' => 'http://retracker.local/announce',
    'freeleech' => false,
    'guest_tracker' => true,
];

// Ratio settings
// Don't change the order of ratios (from 0 to 1)
// rating < 0.4 -- allow only 1 torrent for leeching
// rating < 0.5 -- only 2
// rating < 0.6 -- only 3
// rating > 0.6 -- depend on your tracker config limits (in "ACP - Tracker Config - Limits")
$bb_cfg['rating'] = [
    '0.4' => 1,
    '0.5' => 2,
    '0.6' => 3,
];


// Release status icons
$bb_cfg['tor_icons'] = [
    TOR_NOT_APPROVED => '<span class="tor-icon tor-not-approved">*</span>',
    TOR_CLOSED => '<span class="tor-icon tor-closed">x</span>',
    TOR_APPROVED => '<span class="tor-icon tor-approved">&radic;</span>',
    TOR_NEED_EDIT => '<span class="tor-icon tor-need-edit">?</span>',
    TOR_NO_DESC => '<span class="tor-icon tor-no-desc">!</span>',
    TOR_DUP => '<span class="tor-icon tor-dup">D</span>',
    TOR_CLOSED_CPHOLD => '<span class="tor-icon tor-closed-cp">&copy;</span>',
    TOR_CONSUMED => '<span class="tor-icon tor-consumed">&sum;</span>',
    TOR_DOUBTFUL => '<span class="tor-icon tor-approved">#</span>',
    TOR_CHECKING => '<span class="tor-icon tor-checking">%</span>',
    TOR_TMP => '<span class="tor-icon tor-dup">T</span>',
    TOR_PREMOD => '<span class="tor-icon tor-dup">&#8719;</span>',
];


// Disallow downloading
$bb_cfg['tor_frozen'] = [
    TOR_CHECKING => true,
    TOR_CLOSED => true,
    TOR_CLOSED_CPHOLD => true,
    TOR_CONSUMED => true,
    TOR_DUP => true,
    TOR_NO_DESC => true,
    TOR_PREMOD => true,
];


// Allow downloading for the author, even if the release has been frozen
$bb_cfg['tor_frozen_author_download'] = [
    TOR_CHECKING => true,
    TOR_NO_DESC => true,
    TOR_PREMOD => true,
];


// Disallow editing the main image
$bb_cfg['tor_cannot_edit'] = [
    TOR_CHECKING => true,
    TOR_CLOSED => true,
    TOR_CONSUMED => true,
    TOR_DUP => true,
];


// Disallow creating new releases if one of the existing ones has a specific status
$bb_cfg['tor_cannot_new'] = [TOR_NEED_EDIT, TOR_NO_DESC, TOR_DOUBTFUL];


// Permission to reply after the release has been corrected
$bb_cfg['tor_reply'] = [TOR_NEED_EDIT, TOR_NO_DESC, TOR_DOUBTFUL];


// Hide torrent stats based on release status
$bb_cfg['tor_no_tor_act'] = [
    TOR_CLOSED => true,
    TOR_DUP => true,
    TOR_CLOSED_CPHOLD => true,
    TOR_CONSUMED => true,
];

// Vote graphic length defines the maximum length of a vote result graphic, ie. 100% = this length
$bb_cfg['vote_graphic_length'] = 205;
$bb_cfg['privmsg_graphic_length'] = 175;
$bb_cfg['topic_left_column_witdh'] = 150;

// Images auto-resize
$bb_cfg['post_img_width_decr'] = 52;
$bb_cfg['attach_img_width_decr'] = 130;

if (!empty($_SERVER['HTTP_ACCEPT_LANGUAGE']) && $bb_cfg['auto_language']) {
    $user_lang = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);
    if (file_exists(LANG_ROOT_DIR . '/' . $user_lang)) {
        $bb_cfg['default_lang_dir'] = LANG_ROOT_DIR . '/' . $user_lang . '/';
        $bb_cfg['default_lang'] = $user_lang;
    } else {
        $bb_cfg['default_lang_dir'] = LANG_ROOT_DIR . '/en/';
        $bb_cfg['default_lang'] = 'en';
    }
} else {
    if (isset($bb_cfg['default_lang']) && file_exists(LANG_ROOT_DIR . '/' . $bb_cfg['default_lang'])) {
        $bb_cfg['default_lang_dir'] = LANG_ROOT_DIR . '/' . $bb_cfg['default_lang'] . '/';
    } else {
        $bb_cfg['default_lang_dir'] = LANG_ROOT_DIR . '/en/';
    }
}
