<?php

use Phinx\Migration\AbstractMigration;
use Phinx\Db\Adapter\MysqlAdapter;

/*global $datastore;
$datastore = new TorrentPier\Legacy\Datastore\File(__DIR__.'/../../internal_data/cache/filecache/datastore/', 'tp_');*/

class BBCode
{
    public $tpl = []; // шаблоны для замены тегов
    public $smilies;    // смайлы
    public $found_spam;    // найденные спам "слова"
    public $del_words = []; // см. get_words_rate()
    public $tidy_cfg = [
        'drop-empty-paras' => false,
        'fix-uri' => false,
        'force-output' => true,
        'hide-comments' => true,
        'join-classes' => false,
        'join-styles' => false,
        'merge-divs' => false,
        'newline' => 'LF',
        'output-xhtml' => true,
        'preserve-entities' => true,
        'quiet' => true,
        'quote-ampersand' => false,
        'show-body-only' => true,
        'show-errors' => false,
        'show-warnings' => false,
        'wrap' => 0,
    ];
    public $block_tags = [
        'align',
        'br',
        'clear',
        'hr',
        'list',
        'pre',
        'quote',
        'spoiler',
    ];
    public $preg = [];
    public $str = [];
    public $preg_search = [];
    public $preg_repl = [];
    public $str_search = [];
    public $str_repl = [];

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->tpl = get_bbcode_tpl();

        $this->init_replacements();
    }

    /**
     * init_replacements
     */
    public function init_replacements()
    {
        $tpl = $this->tpl;
        $img_exp = '(https?:)?//[^\s\?&;=\#\"<>]+?\.(jpg|jpeg|gif|png)([a-z0-9/?&%;][^\[\]]*)?';
        $email_exp = '[a-z0-9&\-_.]+?@[\w\-]+\.([\w\-\.]+\.)?[\w]+';

        $this->preg = [
            '#\[quote="(.+?)"\]#isu' => $tpl['quote_username_open'],
            '#\[spoiler="(.+?)"\]#isu' => $tpl['spoiler_title_open'],
            '#\[list=(a|A|i|I|1)\]#isu' => '<ul type="$1">',
            '#\[\*=(\d+)\]#isu' => '<li value="$1">',
            '#\[pre\](.*?)\[/pre\]#isu' => '<pre class="post-pre">$1</pre>',
            '#\[name=([a-zA-Z0-9_]+?)\]#isu' => '<a name="$1"></a>',
            '#\[url=\#([a-zA-Z0-9_]+?)\](.*?)\[/url\]#isu' => '<a class="postLink-name" href="#$1">$2</a>',
            '#\[color=([\#0-9a-zA-Z]+)\]#isu' => '<span style="color: $1;">',
            '#\[size=([1-2]?[0-9])\]#isu' => '<span style="font-size: $1px; line-height: normal;">',
            '#\[align=(left|right|center|justify)\]#isu' => '<span class="post-align" style="text-align: $1;">',
            '#\[font="([\w\- \']+)"\]#isu' => '<span style="font-family: $1;">',
            "#\[img\]($img_exp)\[/img\]#isu" => $tpl['img'],
            "#\[img=(left|right|center)\]($img_exp)\[/img\]\s*#isu" => $tpl['img_aligned'],
            "#\[email\]($email_exp)\[/email\]#isu" => '<a href="mailto:$1">$1</a>',
            "#\[qpost=([0-9]*)\]#isu" => '<u class="q-post">$1</u>',
        ];

        $this->str = [
            '[quote]' => $tpl['quote_open'],
            '[/quote]' => $tpl['quote_close'],
            '[spoiler]' => $tpl['spoiler_open'],
            '[/spoiler]' => $tpl['spoiler_close'],
            '[list]' => '<ul>',
            '[*]' => '<li>',
            '[/list]' => '</ul>',
            '[/color]' => '</span>',
            '[/size]' => '</span>',
            '[/align]' => '</span>',
            '[/font]' => '</span>',
            '[tab]' => '&nbsp;&nbsp;&nbsp;&nbsp;',
            '[br]' => "\n\n",
            '[hr]' => $tpl['hr'],
            '[b]' => '<span class="post-b">',
            '[/b]' => '</span>',
            '[u]' => '<span class="post-u">',
            '[/u]' => '</span>',
            '[i]' => '<span class="post-i">',
            '[/i]' => '</span>',
            '[s]' => '<span class="post-s">',
            '[/s]' => '</span>',
            '[del]' => '<span class="post-s">',
            '[/del]' => '</span>',
            '[clear]' => '<div class="clear">&nbsp;</div>',
        ];

        $this->preg_search = array_keys($this->preg);
        $this->preg_repl = array_values($this->preg);
        $this->str_search = array_keys($this->str);
        $this->str_repl = array_values($this->str);
    }

    /**
     * bbcode2html
     *
     * @param string $text должен быть уже обработан htmlCHR($text, false, ENT_NOQUOTES)
     * @return string
     */
    public function bbcode2html($text)
    {
        global $bb_cfg;

        $text = " $text ";
        $text = static::clean_up($text);
        $text = $this->spam_filter($text);

        // Tag parse
        if (strpos($text, '[') !== false) {
            // [code]
            $text = preg_replace_callback('#(\s*)\[code\](.+?)\[/code\](\s*)#s', [&$this, 'code_callback'], $text);

            // Escape tags inside tiltes in [quote="tilte"]
            $text = preg_replace_callback('#(\[(quote|spoiler)=")(.+?)("\])#', [&$this, 'escape_tiltes_callback'], $text);

            // [url]
            $url_exp = '[\w\#!$%&~/.\-;:=,?@а-яА-Я()\[\]+]+?';
            $text = preg_replace_callback("#\[url\]((?:https?://)?$url_exp)\[/url\]#isu", [&$this, 'url_callback'], $text);
            $text = preg_replace_callback("#\[url\](www\.$url_exp)\[/url\]#isu", [&$this, 'url_callback'], $text);
            $text = preg_replace_callback("#\[url=((?:https?://)?$url_exp)\]([^?\n\t].*?)\[/url\]#isu", [&$this, 'url_callback'], $text);
            $text = preg_replace_callback("#\[url=(www\.$url_exp)\]([^?\n\t].*?)\[/url\]#isu", [&$this, 'url_callback'], $text);

            // Normalize block level tags wrapped with new lines
            $block_tags = implode('|', $this->block_tags);
            $text = str_replace("\n\n[hr]\n\n", '[br][hr][br]', $text);
            $text = preg_replace("#(\s*)(\[/?($block_tags)(.*?)\])(\s*)#", '$2', $text);

            // Tag replacements
            $text = preg_replace($this->preg_search, $this->preg_repl, $text);
            $text = str_replace($this->str_search, $this->str_repl, $text);
        }

        $text = $this->make_clickable($text);
        $text = $this->smilies_pass($text);
        $text = $this->new_line2html($text);
        $text = trim($text);

        if ($bb_cfg['tidy_post']) {
            $text = $this->tidy($text);
        }

        return trim($text);
    }

    /**
     * Clean up
     *
     * @param string $text
     * @return string
     */
    public static function clean_up($text)
    {
        $text = trim($text);
        $text = str_replace("\r", '', $text);
        $text = preg_replace('#[ \t]+$#m', '', $text); // trailing spaces
        $text = preg_replace('#\n{3,}#', "\n\n", $text);
        return $text;
    }

    /**
     * Spam filter
     *
     * @param string $text
     * @return string
     */
    private function spam_filter($text)
    {
        global $bb_cfg;
        static $spam_words = null;
        static $spam_replace = ' СПАМ';

        if (isset($this)) {
            $found_spam =& $this->found_spam;
        }

        // set $spam_words and $spam_replace
        if (!$bb_cfg['spam_filter_file_path']) {
            return $text;
        }
        if (null === $spam_words) {
            $spam_words = file_get_contents($bb_cfg['spam_filter_file_path']);
            $spam_words = strtolower($spam_words);
            $spam_words = explode("\n", $spam_words);
        }

        $found_spam = [];

        $msg_decoded = $text;
        $msg_decoded = html_entity_decode($msg_decoded);
        $msg_decoded = urldecode($msg_decoded);
        $msg_decoded = str_replace('&', ' &', $msg_decoded);

        $msg_search = strtolower($msg_decoded);

        foreach ($spam_words as $spam_str) {
            if (!$spam_str = trim($spam_str)) {
                continue;
            }
            if (strpos($msg_search, $spam_str) !== false) {
                $found_spam[] = $spam_str;
            }
        }
        if ($found_spam) {
            $spam_exp = [];
            foreach ($found_spam as $keyword) {
                $spam_exp[] = preg_quote($keyword, '/');
            }
            $spam_exp = implode('|', $spam_exp);

            $text = preg_replace("/($spam_exp)(\S*)/i", $spam_replace, $msg_decoded);
            $text = htmlCHR($text, false, ENT_NOQUOTES);
        }

        return $text;
    }

    /**
     * [code] callback
     *
     * @param string $m
     * @return string
     */
    public function code_callback($m)
    {
        $code = trim($m[2]);
        $code = str_replace('  ', '&nbsp; ', $code);
        $code = str_replace('  ', ' &nbsp;', $code);
        $code = str_replace("\t", '&nbsp; ', $code);
        $code = str_replace(['[', ']', ':', ')'], ['&#91;', '&#93;', '&#58;', '&#41;'], $code);
        return $this->tpl['code_open'] . $code . $this->tpl['code_close'];
    }

    /**
     * [url] callback
     *
     * @param string $m
     * @return string
     */
    public function url_callback($m)
    {
        global $bb_cfg;

        $url = trim($m[1]);
        $url_name = isset($m[2]) ? trim($m[2]) : $url;

        if (!preg_match('#^https?://#iu', $url) && !preg_match('/^#/', $url)) {
            $url = 'http://' . $url;
        }

        if (in_array(parse_url($url, PHP_URL_HOST), $bb_cfg['nofollow']['allowed_url']) || $bb_cfg['nofollow']['disabled']) {
            $link = "<a href=\"$url\" class=\"postLink\">$url_name</a>";
        } else {
            $link = "<a href=\"$url\" class=\"postLink\" rel=\"nofollow\">$url_name</a>";
        }

        return $link;
    }

    /**
     * Escape tags inside titles in [quote="title"]
     *
     * @param string $m
     * @return string
     */
    public function escape_tiltes_callback($m)
    {
        $tilte = substr($m[3], 0, 250);
        $tilte = str_replace(['[', ']', ':', ')', '"'], ['&#91;', '&#93;', '&#58;', '&#41;', '&#34;'], $tilte);
        // еще раз htmlspecialchars, т.к. при извлечении из title происходит обратное преобразование
        $tilte = htmlspecialchars($tilte, ENT_QUOTES);
        return $m[1] . $tilte . $m[4];
    }

    /**
     * Make clickable
     *
     * @param $text
     * @return string
     */
    public function make_clickable($text)
    {
        $url_regexp = "#
            (?<![\"'=])
            \b
            (
                https?://[\w\#!$%&~/.\-;:=?@а-яА-Я()\[\]+]+
            )
            (?![\"']|\[/url|\[/img|</a)
            (?=[,!]?\s|[\)<!])
        #xiu";

        // pad it with a space so we can match things at the start of the 1st line.
        $ret = " $text ";

        // hide passkey
        $ret = hide_passkey($ret);

        // matches an "xxxx://yyyy" URL at the start of a line, or after a space.
        $ret = preg_replace_callback($url_regexp, [&$this, 'make_url_clickable_callback'], $ret);

        // Remove our padding..
        $ret = substr(substr($ret, 0, -1), 1);

        return ($ret);
    }

    /**
     * Make url clickable
     *
     * @param string $m
     * @return string
     */
    public function make_url_clickable_callback($m)
    {
        global $bb_cfg;

        $max_len = 70;
        $href = $m[1];
        $name = (mb_strlen($href, 'UTF-8') > $max_len) ? mb_substr($href, 0, $max_len - 19) . '...' . mb_substr($href, -16) : $href;

        if (in_array(parse_url($href, PHP_URL_HOST), $bb_cfg['nofollow']['allowed_url']) || $bb_cfg['nofollow']['disabled']) {
            $link = "<a href=\"$href\" class=\"postLink\">$name</a>";
        } else {
            $link = "<a href=\"$href\" class=\"postLink\" rel=\"nofollow\">$name</a>";
        }

        return $link;
    }

    /**
     * Add smilies
     *
     * @param string $text
     * @return string
     */
    public function smilies_pass($text)
    {
        global $datastore;

        if (null === $this->smilies) {
            $this->smilies = $datastore->get('smile_replacements');
        }
        if ($this->smilies) {
            $parsed_text = preg_replace($this->smilies['orig'], $this->smilies['repl'], $text, 101, $smilies_cnt);
            $text = ($smilies_cnt <= 100) ? $parsed_text : $text;
        }

        return $text;
    }

    /**
     * Replace new line code to html
     *
     * @param string $text
     * @return string
     */
    public function new_line2html($text)
    {
        $text = preg_replace('#\n{2,}#', '<span class="post-br"><br /></span>', $text);
        $text = str_replace("\n", '<br />', $text);
        return $text;
    }

    /**
     * Tidy
     *
     * @param string $text
     * @return string
     */
    public function tidy($text)
    {
        $text = tidy_repair_string($text, $this->tidy_cfg, 'utf8');
        return $text;
    }
}


function sql_dbg_enabled()
{
    return (SQL_DEBUG && DBG_USER && !empty($_COOKIE['sql_log']));
}

function get_bbcode_tpl()
{
    $bbcode_tpl = array();

// Quote
    $bbcode_tpl['quote_open'] = <<<HTML
    <div class="q-wrap">
        <div class="q">
HTML;

    $bbcode_tpl['quote_username_open'] = <<<HTML
    <div class="q-wrap">
        <div class="q" head="\\1">
HTML;

    $bbcode_tpl['quote_close'] = <<<HTML
        </div>
    </div>
HTML;

// Code
    $bbcode_tpl['code_open'] = <<<HTML
    <div class="c-wrap">
        <div class="c-body">
HTML;

    $bbcode_tpl['code_close'] = <<<HTML
        </div>
    </div>
HTML;

// Spoiler
    $bbcode_tpl['spoiler_open'] = <<<HTML
    <div class="sp-wrap">
        <div class="sp-body">
HTML;

    $bbcode_tpl['spoiler_title_open'] = <<<HTML
    <div class="sp-wrap">
        <div class="sp-body" title="\\1">
        <h3 class="sp-title">\\1</h3>
HTML;

    $bbcode_tpl['spoiler_close'] = <<<HTML
        </div>
    </div>
HTML;

// Image
    $bbcode_tpl['img'] = <<<HTML
    <var class="postImg" title="$1">&#10;</var>
HTML;

    $bbcode_tpl['img_aligned'] = <<<HTML
    <var class="postImg postImgAligned img-\\1" title="\\2">&#10;</var>
HTML;

// HR
    $bbcode_tpl['hr'] = <<<HTML
    <span class="post-hr">-</span>
HTML;

    array_deep($bbcode_tpl, 'bbcode_tpl_compact');
    return $bbcode_tpl;
}

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

function bbcode_tpl_compact($text)
{
    $text = str_compact($text);
    $text = str_replace('> <', '><', $text);
    return $text;
}
function str_compact($str)
{
    return preg_replace('#\s+#u', ' ', trim($str));
}

function hide_passkey($str)
{
    global $bb_cfg;
    return preg_replace("#\?{$bb_cfg['passkey_key']}=[a-zA-Z0-9]{" . BT_AUTH_KEY_LENGTH . "}#", "?{$bb_cfg['passkey_key']}=passkey", $str);
}

class TolokaNew extends AbstractMigration
{
    public function newTable()
    {
        $table = $this->table("bb_ads", ['id' => false, 'primary_key' => ["ad_id"], 'engine' => "InnoDB", 'encoding' => "utf8", 'collation' => "utf8_general_ci", 'comment' => ""]);
        $table->addColumn('ad_id', 'integer', ['null' => false, 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7, 'signed' => false, 'identity' => 'enable']);
        $table->addColumn('ad_block_ids', 'string', ['null' => false, 'default' => '', 'limit' => 255, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'ad_id']);
        $table->addColumn('ad_start_time', 'datetime', ['null' => false, 'default' => '0000-00-00 00:00:00', 'after' => 'ad_block_ids']);
        $table->addColumn('ad_active_days', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_SMALL, 'precision' => 5, 'after' => 'ad_start_time']);
        $table->addColumn('ad_status', 'integer', ['null' => false, 'default' => '1', 'limit' => MysqlAdapter::INT_TINY, 'precision' => 3, 'after' => 'ad_active_days']);
        $table->addColumn('ad_desc', 'string', ['null' => false, 'default' => '', 'limit' => 255, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'ad_status']);
        $table->addColumn('ad_html', 'text', ['null' => false, 'limit' => 65535, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'ad_desc']);
        $table->save();

        $table = $this->table("bb_auth_access_snap", ['id' => false, 'primary_key' => ["user_id", "forum_id"], 'engine' => "InnoDB", 'encoding' => "utf8", 'collation' => "utf8_general_ci", 'comment' => ""]);
        $table->addColumn('user_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7]);
        $table->addColumn('forum_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_SMALL, 'precision' => 5, 'after' => 'user_id']);
        $table->addColumn('forum_perm', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_REGULAR, 'precision' => 10, 'after' => 'forum_id']);
        $table->save();


        $table = $this->table("bb_bt_dlstatus_snap", ['engine' => "InnoDB", 'encoding' => "utf8", 'collation' => "utf8_general_ci", 'comment' => ""]);
        $table->addColumn('topic_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7, 'signed' => false]);
        $table->addColumn('dl_status', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_TINY, 'precision' => 3, 'after' => 'topic_id']);
        $table->addColumn('users_count', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_SMALL, 'precision' => 5, 'signed' => false, 'after' => 'dl_status']);
        $table->save();
        if($this->table('bb_bt_dlstatus_snap')->hasIndex('topic_id')) {
            $this->table("bb_bt_dlstatus_snap")->removeIndexByName('topic_id');
        }
        $this->table("bb_bt_dlstatus_snap")->addIndex(['topic_id'], ['name' => "topic_id", 'unique' => false])->save();

        $table = $this->table("bb_bt_last_torstat", ['id' => false, 'primary_key' => ["topic_id", "user_id"], 'engine' => "InnoDB", 'encoding' => "utf8", 'collation' => "utf8_general_ci", 'comment' => ""]);
        $table->addColumn('topic_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7, 'signed' => false]);
        $table->addColumn('user_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7, 'after' => 'topic_id']);
        $table->addColumn('dl_status', 'boolean', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_TINY, 'precision' => 3, 'after' => 'user_id']);
        $table->addColumn('up_add', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_BIG, 'precision' => 20, 'signed' => false, 'after' => 'dl_status']);
        $table->addColumn('down_add', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_BIG, 'precision' => 20, 'signed' => false, 'after' => 'up_add']);
        $table->addColumn('release_add', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_BIG, 'precision' => 20, 'signed' => false, 'after' => 'down_add']);
        $table->addColumn('bonus_add', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_BIG, 'precision' => 20, 'signed' => false, 'after' => 'release_add']);
        $table->addColumn('speed_up', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_BIG, 'precision' => 20, 'signed' => false, 'after' => 'bonus_add']);
        $table->addColumn('speed_down', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_BIG, 'precision' => 20, 'signed' => false, 'after' => 'speed_up']);
        $table->save();
        $table = $this->table("bb_bt_last_userstat", ['id' => false, 'primary_key' => ["user_id"], 'engine' => "InnoDB", 'encoding' => "utf8", 'collation' => "utf8_general_ci", 'comment' => ""]);
        $table->addColumn('user_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7]);
        $table->addColumn('up_add', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_BIG, 'precision' => 20, 'signed' => false, 'after' => 'user_id']);
        $table->addColumn('down_add', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_BIG, 'precision' => 20, 'signed' => false, 'after' => 'up_add']);
        $table->addColumn('release_add', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_BIG, 'precision' => 20, 'signed' => false, 'after' => 'down_add']);
        $table->addColumn('bonus_add', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_BIG, 'precision' => 20, 'signed' => false, 'after' => 'release_add']);
        $table->addColumn('speed_up', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_BIG, 'precision' => 20, 'signed' => false, 'after' => 'bonus_add']);
        $table->addColumn('speed_down', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_BIG, 'precision' => 20, 'signed' => false, 'after' => 'speed_up']);
        $table->save();

        $table = $this->table("bb_bt_torhelp", ['id' => false, 'primary_key' => ["user_id"], 'engine' => "InnoDB", 'encoding' => "utf8", 'collation' => "utf8_general_ci", 'comment' => ""]);
        $table->addColumn('user_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7]);
        $table->addColumn('topic_id_csv', 'text', ['null' => false, 'limit' => 65535, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'user_id']);
        $table->save();

        $table = $this->table("bb_bt_torstat", ['id' => false, 'primary_key' => ["topic_id", "user_id"], 'engine' => "InnoDB", 'encoding' => "utf8", 'collation' => "utf8_general_ci", 'comment' => ""]);
        $table->addColumn('topic_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7, 'signed' => false]);
        $table->addColumn('user_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7, 'after' => 'topic_id']);
        $table->addColumn('last_modified_torstat', 'timestamp', ['null' => false, 'default' => 'CURRENT_TIMESTAMP', 'after' => 'user_id']);
        $table->addColumn('completed', 'boolean', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_TINY, 'precision' => 3, 'after' => 'last_modified_torstat']);
        $table->save();

        $table = $this->table("bb_bt_tracker_snap", ['id' => false, 'primary_key' => ["topic_id"], 'engine' => "InnoDB", 'encoding' => "utf8", 'collation' => "utf8_general_ci", 'comment' => ""]);
        $table->addColumn('topic_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7, 'signed' => false]);
        $table->addColumn('seeders', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7, 'signed' => false, 'after' => 'topic_id']);
        $table->addColumn('leechers', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7, 'signed' => false, 'after' => 'seeders']);
        $table->addColumn('speed_up', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_REGULAR, 'precision' => 10, 'signed' => false, 'after' => 'leechers']);
        $table->addColumn('speed_down', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_REGULAR, 'precision' => 10, 'signed' => false, 'after' => 'speed_up']);
        $table->save();
        $table = $this->table("bb_bt_user_settings", ['id' => false, 'primary_key' => ["user_id"], 'engine' => "InnoDB", 'encoding' => "utf8", 'collation' => "utf8_general_ci", 'comment' => ""]);
        $table->addColumn('user_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7]);
        $table->addColumn('tor_search_set', 'text', ['null' => false, 'limit' => 65535, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'user_id']);
        $table->addColumn('last_modified', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_REGULAR, 'precision' => 10, 'after' => 'tor_search_set']);
        $table->save();

        $table = $this->table("bb_cron", ['id' => false, 'primary_key' => ["cron_id"], 'engine' => "InnoDB", 'encoding' => "utf8", 'collation' => "utf8_general_ci", 'comment' => ""]);
        $table->addColumn('cron_id', 'integer', ['null' => false, 'limit' => MysqlAdapter::INT_SMALL, 'precision' => 5, 'signed' => false, 'identity' => 'enable']);
        $table->addColumn('cron_active', 'integer', ['null' => false, 'default' => '1', 'limit' => MysqlAdapter::INT_TINY, 'precision' => 3, 'after' => 'cron_id']);
        $table->addColumn('cron_title', 'char', ['null' => false, 'default' => '', 'limit' => 120, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'cron_active']);
        $table->addColumn('cron_script', 'char', ['null' => false, 'default' => '', 'limit' => 120, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'cron_title']);
        $table->addColumn('schedule', 'enum', ['null' => false, 'default' => 'daily', 'limit' => 8, 'values' => ['hourly','daily','weekly','monthly','interval'], 'after' => 'cron_script']);
        $table->addColumn('run_day', 'enum', ['null' => true, 'limit' => 2, 'values' => ['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28'], 'after' => 'schedule']);
        $table->addColumn('run_time', 'time', ['null' => true, 'default' => '04:00:00', 'after' => 'run_day']);
        $table->addColumn('run_order', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_TINY, 'precision' => 3, 'signed' => false, 'after' => 'run_time']);
        $table->addColumn('last_run', 'datetime', ['null' => false, 'default' => '0000-00-00 00:00:00', 'after' => 'run_order']);
        $table->addColumn('next_run', 'datetime', ['null' => false, 'default' => '0000-00-00 00:00:00', 'after' => 'last_run']);
        $table->addColumn('run_interval', 'time', ['null' => true, 'default' => '00:00:00', 'after' => 'next_run']);
        $table->addColumn('log_enabled', 'boolean', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_TINY, 'precision' => 3, 'after' => 'run_interval']);
        $table->addColumn('log_file', 'char', ['null' => false, 'default' => '', 'limit' => 120, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'log_enabled']);
        $table->addColumn('log_sql_queries', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_TINY, 'precision' => 3, 'after' => 'log_file']);
        $table->addColumn('disable_board', 'boolean', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_TINY, 'precision' => 3, 'after' => 'log_sql_queries']);
        $table->addColumn('run_counter', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_BIG, 'precision' => 20, 'signed' => false, 'after' => 'disable_board']);
        $table->save();
        if($this->table('bb_cron')->hasIndex('title')) {
            $this->table("bb_cron")->removeIndexByName('title');
        }
        $this->table("bb_cron")->addIndex(['cron_title'], ['name' => "title", 'unique' => true])->save();
        if($this->table('bb_cron')->hasIndex('script')) {
            $this->table("bb_cron")->removeIndexByName('script');
        }
        $this->table("bb_cron")->addIndex(['cron_script'], ['name' => "script", 'unique' => true])->save();

        $table = $this->table("bb_log", ['engine' => "InnoDB", 'encoding' => "utf8", 'collation' => "utf8_general_ci", 'comment' => ""]);
        $table->addColumn('log_type_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7, 'signed' => false]);
        $table->addColumn('log_user_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7, 'after' => 'log_type_id']);
        $table->addColumn('log_username', 'string', ['null' => false, 'default' => '', 'limit' => 25, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'log_user_id']);
        $table->addColumn('log_user_ip', 'string', ['null' => false, 'default' => '', 'limit' => 32, 'collation' => "utf8_bin", 'encoding' => "utf8", 'after' => 'log_username']);
        $table->addColumn('log_forum_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_SMALL, 'precision' => 5, 'signed' => false, 'after' => 'log_user_ip']);
        $table->addColumn('log_forum_id_new', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_SMALL, 'precision' => 5, 'signed' => false, 'after' => 'log_forum_id']);
        $table->addColumn('log_topic_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7, 'signed' => false, 'after' => 'log_forum_id_new']);
        $table->addColumn('log_topic_id_new', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7, 'signed' => false, 'after' => 'log_topic_id']);
        $table->addColumn('log_topic_title', 'string', ['null' => false, 'default' => '', 'limit' => 250, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'log_topic_id_new']);
        $table->addColumn('log_topic_title_new', 'string', ['null' => false, 'default' => '', 'limit' => 250, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'log_topic_title']);
        $table->addColumn('log_time', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_REGULAR, 'precision' => 10, 'after' => 'log_topic_title_new']);
        $table->addColumn('log_msg', 'text', ['null' => false, 'limit' => 65535, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'log_time']);
        $table->save();
        if($this->table('bb_log')->hasIndex('log_time')) {
            $this->table("bb_log")->removeIndexByName('log_time');
        }
        $this->table("bb_log")->addIndex(['log_time'], ['name' => "log_time", 'unique' => false])->save();
        if($this->table('bb_log')->hasIndex('log_topic_title')) {
            $this->table("bb_log")->removeIndexByName('log_topic_title');
        }
        $this->table("bb_log")->addIndex(['log_topic_title'], ['name' => "log_topic_title", 'unique' => false, 'type' => 'fulltext'])->save();

        $table = $this->table("bb_poll_users", ['id' => false, 'primary_key' => ["topic_id", "user_id"], 'engine' => "InnoDB", 'encoding' => "utf8", 'collation' => "utf8_general_ci", 'comment' => ""]);
        $table->addColumn('topic_id', 'integer', ['null' => false, 'limit' => MysqlAdapter::INT_REGULAR, 'precision' => 10, 'signed' => false]);
        $table->addColumn('user_id', 'integer', ['null' => false, 'limit' => MysqlAdapter::INT_REGULAR, 'precision' => 10, 'after' => 'topic_id']);
        $table->addColumn('vote_ip', 'string', ['null' => false, 'limit' => 32, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'user_id']);
        $table->addColumn('vote_dt', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_REGULAR, 'precision' => 10, 'after' => 'vote_ip']);
        $table->save();
        $table = $this->table("bb_poll_votes", ['id' => false, 'primary_key' => ["topic_id", "vote_id"], 'engine' => "InnoDB", 'encoding' => "utf8", 'collation' => "utf8_general_ci", 'comment' => ""]);
        $table->addColumn('topic_id', 'integer', ['null' => false, 'limit' => MysqlAdapter::INT_REGULAR, 'precision' => 10, 'signed' => false]);
        $table->addColumn('vote_id', 'integer', ['null' => false, 'limit' => MysqlAdapter::INT_TINY, 'precision' => 3, 'signed' => false, 'after' => 'topic_id']);
        $table->addColumn('vote_text', 'string', ['null' => false, 'limit' => 255, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'vote_id']);
        $table->addColumn('vote_result', 'integer', ['null' => false, 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7, 'signed' => false, 'after' => 'vote_text']);
        $table->save();

        $table = $this->table("bb_posts_html", ['id' => false, 'primary_key' => ["post_id"], 'engine' => "InnoDB", 'encoding' => "utf8", 'collation' => "utf8_general_ci", 'comment' => ""]);
        $table->addColumn('post_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7]);
        $table->addColumn('post_html_time', 'timestamp', ['null' => false, 'default' => 'CURRENT_TIMESTAMP', 'after' => 'post_id']);
        $table->addColumn('post_html', 'text', ['null' => false, 'default' => "''", 'limit' => MysqlAdapter::TEXT_MEDIUM, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'post_html_time']);
        $table->save();
        $table = $this->table("bb_posts_search", ['id' => false, 'primary_key' => ["post_id"], 'engine' => "InnoDB", 'encoding' => "utf8", 'collation' => "utf8_general_ci", 'comment' => ""]);
        $table->addColumn('post_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7, 'signed' => false]);
        $table->addColumn('search_words', 'text', ['null' => false, 'limit' => 65535, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'post_id']);
        $table->save();
        if($this->table('bb_posts_search')->hasIndex('search_words')) {
            $this->table("bb_posts_search")->removeIndexByName('search_words');
        }
        $this->table("bb_posts_search")->addIndex(['search_words'], ['name' => "search_words", 'unique' => false, 'type' => 'fulltext'])->save();

        $table = $this->table("bb_search_rebuild", ['id' => false, 'primary_key' => ["rebuild_session_id"], 'engine' => "InnoDB", 'encoding' => "utf8", 'collation' => "utf8_general_ci", 'comment' => ""]);
        $table->addColumn('rebuild_session_id', 'integer', ['null' => false, 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7, 'signed' => false, 'identity' => 'enable']);
        $table->addColumn('start_post_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7, 'signed' => false, 'after' => 'rebuild_session_id']);
        $table->addColumn('end_post_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7, 'signed' => false, 'after' => 'start_post_id']);
        $table->addColumn('start_time', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_REGULAR, 'precision' => 10, 'after' => 'end_post_id']);
        $table->addColumn('end_time', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_REGULAR, 'precision' => 10, 'after' => 'start_time']);
        $table->addColumn('last_cycle_time', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_REGULAR, 'precision' => 10, 'after' => 'end_time']);
        $table->addColumn('session_time', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_REGULAR, 'precision' => 10, 'after' => 'last_cycle_time']);
        $table->addColumn('session_posts', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7, 'signed' => false, 'after' => 'session_time']);
        $table->addColumn('session_cycles', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7, 'signed' => false, 'after' => 'session_posts']);
        $table->addColumn('search_size', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_REGULAR, 'precision' => 10, 'signed' => false, 'after' => 'session_cycles']);
        $table->addColumn('rebuild_session_status', 'boolean', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_TINY, 'precision' => 3, 'after' => 'search_size']);
        $table->save();

        $table = $this->table("bb_topic_tpl", ['id' => false, 'primary_key' => ["tpl_id"], 'engine' => "InnoDB", 'encoding' => "utf8", 'collation' => "utf8_general_ci", 'comment' => ""]);
        $table->addColumn('tpl_id', 'integer', ['null' => false, 'limit' => MysqlAdapter::INT_SMALL, 'precision' => 5, 'identity' => 'enable']);
        $table->addColumn('tpl_name', 'string', ['null' => false, 'default' => '', 'limit' => 60, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'tpl_id']);
        $table->addColumn('tpl_src_form', 'text', ['null' => false, 'limit' => 65535, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'tpl_name']);
        $table->addColumn('tpl_src_title', 'text', ['null' => false, 'limit' => 65535, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'tpl_src_form']);
        $table->addColumn('tpl_src_msg', 'text', ['null' => false, 'limit' => 65535, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'tpl_src_title']);
        $table->addColumn('tpl_comment', 'text', ['null' => false, 'limit' => 65535, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'tpl_src_msg']);
        $table->addColumn('tpl_rules_post_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_REGULAR, 'precision' => 10, 'signed' => false, 'after' => 'tpl_comment']);
        $table->addColumn('tpl_last_edit_tm', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_REGULAR, 'precision' => 10, 'after' => 'tpl_rules_post_id']);
        $table->addColumn('tpl_last_edit_by', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_REGULAR, 'precision' => 10, 'after' => 'tpl_last_edit_tm']);
        $table->save();
        if($this->table('bb_topic_tpl')->hasIndex('tpl_name')) {
            $this->table("bb_topic_tpl")->removeIndexByName('tpl_name');
        }
        $this->table("bb_topic_tpl")->addIndex(['tpl_name'], ['name' => "tpl_name", 'unique' => true])->save();

        $table = $this->table("buf_last_seeder", ['id' => false, 'primary_key' => ["topic_id"], 'engine' => "InnoDB", 'encoding' => "utf8", 'collation' => "utf8_general_ci", 'comment' => ""]);
        $table->addColumn('topic_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7, 'signed' => false]);
        $table->addColumn('seeder_last_seen', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_REGULAR, 'precision' => 10, 'after' => 'topic_id']);
        $table->save();
        $table = $this->table("buf_topic_view", ['id' => false, 'primary_key' => ["topic_id"], 'engine' => "InnoDB", 'encoding' => "utf8", 'collation' => "utf8_general_ci", 'comment' => ""]);
        $table->addColumn('topic_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7, 'signed' => false]);
        $table->addColumn('topic_views', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7, 'signed' => false, 'after' => 'topic_id']);
        $table->save();
    }

    // library/includes/function.php
    private function bit2dec($bit_num)
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

    public function tickets()
    {
        // https://github.com/hurtom/toloka/issues/27
        $this->table("bb_attachments")->removeIndexByName('attach_id_post_id');
        $this->table("bb_attachments")->removeIndexByName('post_id');

        //start !complete https://github.com/hurtom/toloka/issues/29
        $this->table("bb_auth_access")->changeColumn('group_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7])->update();
        $this->table("bb_auth_access")->changeColumn('forum_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_SMALL, 'precision' => 5, 'signed' => false, 'after' => 'group_id'])->update();
        $table = $this->table("bb_auth_access");
        $table->addColumn('forum_perm', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_REGULAR, 'precision' => 10, 'after' => 'forum_id']);
        $table->save();

        $rows = $this->fetchAll('SELECT * FROM bb_auth_access');
        $permAssoc = [
            'auth_view' => 1,
            'auth_read' => 2,
            'auth_post' => 4,
            'auth_reply' => 5,
            'auth_edit' => 6,
            'auth_delete' => 7,
            'auth_sticky' => 8,
            'auth_announce' => 9,
            'auth_vote' => 10,
            'auth_pollcreate' => 11,
            'auth_attachments' => 12,
            'auth_mod' => 3,
            'auth_download' => 13,
        ];
        foreach ($rows as $row) {
            $_perm = [];
            foreach ($permAssoc as $ident => $bit) {
                if (!empty($row[$ident])) {
                    $_perm[] = $bit;
                }
            }
            $this->query('UPDATE bb_auth_access SET forum_perm = '.$this->bit2dec($_perm).' WHERE group_id = '.$row['group_id'].' AND forum_id = '.$row['forum_id']);
        }

        $this->query("DELETE FROM bb_auth_access_snap");

        $this->query("
            INSERT INTO bb_auth_access_snap
                (user_id, forum_id, forum_perm)
            SELECT
                ug.user_id, aa.forum_id, BIT_OR(aa.forum_perm)
            FROM
                bb_user_group ug,
                bb_groups g,
                bb_auth_access aa
            WHERE
                    ug.user_pending = 0
                    $users_in
                AND g.group_id = ug.group_id
                AND aa.group_id = g.group_id
            GROUP BY
                ug.user_id, aa.forum_id
        ");

        if($this->table('bb_auth_access')->hasColumn('auth_view')) {
            $this->table("bb_auth_access")->removeColumn('auth_view')->update();
        }
        if($this->table('bb_auth_access')->hasColumn('auth_read')) {
            $this->table("bb_auth_access")->removeColumn('auth_read')->update();
        }
        if($this->table('bb_auth_access')->hasColumn('auth_post')) {
            $this->table("bb_auth_access")->removeColumn('auth_post')->update();
        }
        if($this->table('bb_auth_access')->hasColumn('auth_reply')) {
            $this->table("bb_auth_access")->removeColumn('auth_reply')->update();
        }
        if($this->table('bb_auth_access')->hasColumn('auth_edit')) {
            $this->table("bb_auth_access")->removeColumn('auth_edit')->update();
        }
        if($this->table('bb_auth_access')->hasColumn('auth_delete')) {
            $this->table("bb_auth_access")->removeColumn('auth_delete')->update();
        }
        if($this->table('bb_auth_access')->hasColumn('auth_sticky')) {
            $this->table("bb_auth_access")->removeColumn('auth_sticky')->update();
        }
        if($this->table('bb_auth_access')->hasColumn('auth_announce')) {
            $this->table("bb_auth_access")->removeColumn('auth_announce')->update();
        }
        if($this->table('bb_auth_access')->hasColumn('auth_vote')) {
            $this->table("bb_auth_access")->removeColumn('auth_vote')->update();
        }
        if($this->table('bb_auth_access')->hasColumn('auth_pollcreate')) {
            $this->table("bb_auth_access")->removeColumn('auth_pollcreate')->update();
        }
        if($this->table('bb_auth_access')->hasColumn('auth_attachments')) {
            $this->table("bb_auth_access")->removeColumn('auth_attachments')->update();
        }
        if($this->table('bb_auth_access')->hasColumn('auth_mod')) {
            $this->table("bb_auth_access")->removeColumn('auth_mod')->update();
        }
        if($this->table('bb_auth_access')->hasColumn('auth_download')) {
            $this->table("bb_auth_access")->removeColumn('auth_download')->update();
        }
        if($this->table('bb_auth_access')->hasIndex('forum_id')) {
            $this->table("bb_auth_access")->removeIndexByName('forum_id');
        }
        $this->table("bb_auth_access")->addIndex(['forum_id'], ['name' => "forum_id", 'unique' => false])->save();
        //finish !complete https://github.com/hurtom/toloka/issues/29
        
        // start
        $table = $this->table("bb_forums");
        $table->addColumn('forum_tpl_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_SMALL, 'precision' => 5, 'after' => 'forum_last_post_id']);
        $table->addColumn('prune_days', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_SMALL, 'precision' => 5, 'signed' => false, 'after' => 'forum_tpl_id']);
        $table->addColumn('allow_porno_topic', 'boolean', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_TINY, 'precision' => 3, 'after' => 'allow_reg_tracker']);
        $table->save();
        $this->execute('UPDATE bb_forums, bb_forum_prune SET bb_forums.prune_days = bb_forum_prune.prune_days WHERE bb_forum_prune.forum_id = bb_forums.forum_id');

        if($this->table('bb_forums')->hasColumn('prune_next')) {
            $this->table("bb_forums")->removeColumn('prune_next')->update();
        }
        if($this->table('bb_forums')->hasColumn('prune_enable')) {
            $this->table("bb_forums")->removeColumn('prune_enable')->update();
        }

        if($this->table('bb_forums')->hasColumn('allow_dl_topic')) {
            $this->table("bb_forums")->removeColumn('allow_dl_topic')->update();
        }
        if($this->table('bb_forums')->hasColumn('dl_type_default')) {
            $this->table("bb_forums")->removeColumn('dl_type_default')->update();
        }
        if($this->table('bb_forums')->hasColumn('last_dl_topics_synch')) {
            $this->table("bb_forums")->removeColumn('last_dl_topics_synch')->update();
        }
        if($this->table('bb_forums')->hasColumn('show_dl_buttons')) {
            $this->table("bb_forums")->removeColumn('show_dl_buttons')->update();
        }

        $table = $this->table("bb_bt_dlstatus", ['id' => false, 'primary_key' => ["user_id", "topic_id"], 'engine' => "InnoDB", 'encoding' => "utf8", 'collation' => "utf8_general_ci", 'comment' => ""]);
        $table->addColumn('user_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7]);
        $table->addColumn('topic_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7, 'signed' => false, 'after' => 'user_id']);
        $table->addColumn('user_status', 'boolean', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_TINY, 'precision' => 3, 'after' => 'topic_id']);
        $table->addColumn('last_modified_dlstatus', 'timestamp', ['null' => false, 'default' => 'CURRENT_TIMESTAMP', 'after' => 'user_status']);
        $table->save();
        if($this->table('bb_bt_dlstatus')->hasIndex('topic_id')) {
            $this->table("bb_bt_dlstatus")->removeIndexByName('topic_id');
        }
        $this->table("bb_bt_dlstatus")->addIndex(['topic_id'], ['name' => "topic_id", 'unique' => false])->save();

        $this->table("bb_bt_users_dl_status")->removeIndexByName('PRIMARY');
        $this->dropTable("bb_bt_users_dl_status");

        // start toloka columns https://github.com/hurtom/toloka/issues/36
        if($this->table('bb_forums')->hasColumn('move_next')) {
            $this->table("bb_forums")->removeColumn('move_next')->update();
        }
        if($this->table('bb_forums')->hasColumn('recycle_move_next')) {
            $this->table("bb_forums")->removeColumn('recycle_move_next')->update();
        }
        if($this->table('bb_forums')->hasColumn('move_enable')) {
            $this->table("bb_forums")->removeColumn('move_enable')->update();
        }
        // finosh toloka columns 

        $this->dropTable("bb_forum_prune");

        // finish

        // start categorie hurtom https://github.com/hurtom/toloka/issues/35
        if($this->table('bb_categories')->hasColumn('cat_title_short')) {
            $this->table("bb_categories")->removeColumn('cat_title_short')->update();
        }
        if($this->table('bb_categories')->hasColumn('cat_title_hashtag')) {
            $this->table("bb_categories")->removeColumn('cat_title_hashtag')->update();
        }
        if($this->table('bb_categories')->hasColumn('cat_url')) {
            $this->table("bb_categories")->removeColumn('cat_url')->update();
        }
        if($this->table('bb_categories')->hasColumn('cat_desc')) {
            $this->table("bb_categories")->removeColumn('cat_desc')->update();
        }
        // finish categorie hurtom

        // start last login hurtom https://github.com/hurtom/toloka/issues/37
        $this->table("bb_sessions_keys")->removeIndexByName('PRIMARY');
        $this->table("bb_sessions_keys")->removeIndexByName('last_login');
        $this->dropTable("bb_sessions_keys");
        // finish last login hurtom


        // start logic hurtomhttps://github.com/hurtom/toloka/issues/38
        //if($this->table('bb_user_group')->hasColumn('group_moderator')) {
//            $this->table("bb_user_group")->removeColumn('group_moderator')->update();
  //      }
        // finish logic hurtom

        // start order group hurtom
        if($this->table('bb_groups')->hasColumn('group_order')) {
            $this->table("bb_groups")->removeColumn('group_order')->update();
        }
        // finish order group hurtom

        // start logic hurtom
        //if($this->table('bb_ranks')->hasColumn('rank_group')) {
          //  $this->table("bb_ranks")->removeColumn('rank_group')->update();
        //}
        // finish logic hurtom

        // start logic hurtom bb_posts_text + bb_posts_html мігрувати
        $this->execute("UPDATE bb_posts_text SET post_text = REPLACE(`post_text`, CONCAT(':', `bbcode_uid`), '')");
        if($this->table('bb_posts_text')->hasColumn('bbcode_uid')) {
            $this->table("bb_posts_text")->removeColumn('bbcode_uid')->update();
        }

        $bbcode = new BBCode();
        $smilies = array();

        $rowset = $this->fetchAll("SELECT * FROM bb_smilies");
        foreach ($rowset as $smile) {
            $smilies['orig'][] = '#(?<=^|\W)' . preg_quote($smile['code'], '#') . '(?=$|\W)#';
            $smilies['repl'][] = ' <img class="smile" src="' . $bb_cfg['smilies_path'] . '/' . $smile['smile_url'] . '" alt="' . $smile['emoticon'] . '" align="absmiddle" border="0" />';
            $smilies['smile'][] = $smile;
        }
        
        $bbcode->smilies = $smilies;

        $conn = $this->getAdapter()->getConnection();
        $rows = $this->fetchAll('SELECT * FROM bb_posts_text');
        foreach ($rows as $row) {
            $postText = $bbcode->bbcode2html($row['post_text']);
            $this->query('INSERT INTO bb_posts_html (post_id, post_html) VALUE ('.$row['post_id'].', '.$conn->quote($postText).')');
        }
        // finish logic hurtom

        // start logic hurtom https://github.com/hurtom/toloka/issues/39
        $this->dropTable("bb_easymod");
        $this->dropTable("bb_easymod_processed_files");
        // finish logic hurtom

        // start logic hurtom https://github.com/hurtom/toloka/issues/40
        //$this->table("bb_posts_edit")->removeIndexByName('post_id');
        //$this->dropTable("bb_posts_edit");
        // finish logic hurtom

        // start logic hurtom https://github.com/hurtom/toloka/issues/41
        //$this->table("bb_warnings")->removeIndexByName('PRIMARY');
        //$this->table("bb_warnings")->removeIndexByName('warning_user_id');
        //$this->dropTable("bb_warnings");
        //$this->table("bb_warnings_text")->removeIndexByName('PRIMARY');
        //$this->dropTable("bb_warnings_text");
        // finish logic hurtom

        // start статус срібло чи золото, де в старій версії проставляється. Створити тікет, щоб додати типи бронза і авторський
        $table = $this->table("bb_bt_torrents");
        $table->addColumn('tor_type', 'boolean', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_TINY, 'precision' => 3]);
        $table->save();
        $this->execute('UPDATE bb_bt_torrents, bb_topics SET bb_bt_torrents.tor_type = bb_topics.topic_type_gold WHERE bb_topics.topic_id = bb_bt_torrents.topic_id');
        if($this->table('bb_topics')->hasColumn('topic_type_gold')) {
            $this->table("bb_topics")->removeColumn('topic_type_gold')->update();
        }
        // finish

        // start хто останній роздавав
        if($this->table('bb_bt_torrents')->hasColumn('last_seeder_uid')) {
            $this->table("bb_bt_torrents")->removeColumn('last_seeder_uid')->update();
        }
        // finish

        // start logic hurtom https://github.com/hurtom/toloka/issues/43
        $table = $this->table("bb_bt_torrents");
        $table->addColumn('forum_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_SMALL, 'precision' => 5, 'signed' => false, 'after' => 'topic_id']);
        $table->addColumn('call_seed_time', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_REGULAR, 'precision' => 10, 'after' => 'reg_time']);
        $table->save();

        $this->execute('ALTER TABLE `bb_bt_torrents` CHANGE `topic_check_status` `tor_status` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0');
        $this->execute('ALTER TABLE `bb_bt_torrents` CHANGE `topic_check_uid` `checked_user_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0');
        $this->execute('ALTER TABLE `bb_bt_torrents` CHANGE `topic_check_date` `checked_time` INT(11) NOT NULL DEFAULT 0');

        if($this->table('bb_bt_torrents')->hasColumn('piece_length')) {
            $this->table("bb_bt_torrents")->removeColumn('piece_length')->update();
        }

        if($this->table('bb_bt_torrents')->hasIndex('forum_id')) {
            $this->table("bb_bt_torrents")->removeIndexByName('forum_id');
        }
        $this->table("bb_bt_torrents")->addIndex(['forum_id'], ['name' => "forum_id", 'unique' => false])->save();

        $this->execute('ALTER TABLE bb_bt_torrents CHANGE speed_ul speed_up BIGINT(20) UNSIGNED NOT NULL DEFAULT 0');
        $this->execute('ALTER TABLE bb_bt_torrents CHANGE speed_dl speed_down BIGINT(20) UNSIGNED NOT NULL DEFAULT 0');
        $this->execute('UPDATE bb_bt_torrents, bb_topics SET bb_bt_torrents.forum_id = bb_topics.forum_id, bb_bt_torrents.call_seed_time = bb_topics.call_seed_time WHERE bb_bt_torrents.topic_id = bb_topics.topic_id');

        if($this->table('bb_bt_torrents')->hasColumn('leechers')) {
            $this->table("bb_bt_torrents")->removeColumn('leechers')->update();
        }
        if($this->table('bb_bt_torrents')->hasColumn('seeders')) {
            $this->table("bb_bt_torrents")->removeColumn('seeders')->update();
        }
        // finish

        // start bb_bt_tracker https://github.com/hurtom/toloka/issues/42
        $table = $this->table("bb_bt_tracker");
        $table->addColumn('topic_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7, 'signed' => false]);
        $table->save();
        if($this->table('bb_bt_tracker')->hasIndex('topic_id')) {
            $this->table("bb_bt_tracker")->removeIndexByName('topic_id');
        }
        $this->table("bb_bt_tracker")->addIndex(['topic_id'], ['name' => "topic_id", 'unique' => false])->save();

        if($this->table('bb_bt_torrents')->hasColumn('torrent_id')) {
            $this->table("bb_bt_torrents")->removeColumn('torrent_id')->update();
        }
        $table = $this->table("bb_bt_tracker");
        $table->addColumn('peer_hash', 'string', ['null' => false, 'default' => '', 'limit' => 32, 'collation' => "utf8_bin", 'encoding' => "utf8"]);
        $table->changeColumn('peer_id', 'string', ['null' => false, 'default' => '0', 'limit' => 20, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'topic_id']);
        $table->changeColumn('ip', 'char', ['null' => false, 'default' => '0', 'limit' => 8, 'collation' => "utf8_bin", 'encoding' => "utf8", 'after' => 'user_id']);
        $table->addColumn('client', 'string', ['null' => false, 'default' => 'Unknown', 'limit' => 51, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'port']);
        $table->addColumn('releaser', 'boolean', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_TINY, 'precision' => 3, 'after' => 'seeder']);
        $table->addColumn('tor_type', 'boolean', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_TINY, 'precision' => 3, 'after' => 'releaser']);
        $table->addColumn('remain', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_BIG, 'precision' => 20, 'signed' => false, 'after' => 'downloaded']);
        $table->addColumn('up_add', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_BIG, 'precision' => 20, 'signed' => false, 'after' => 'speed_down']);
        $table->addColumn('down_add', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_BIG, 'precision' => 20, 'signed' => false, 'after' => 'up_add']);
        $table->changeColumn('complete_percent', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_BIG, 'precision' => 19, 'after' => 'update_time']);
        $table->addColumn('complete', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_REGULAR, 'precision' => 10, 'after' => 'complete_percent']);
        $table->save();

        if($this->table('bb_bt_tracker')->hasColumn('torrent_id')) {
            $this->table("bb_bt_tracker")->removeColumn('torrent_id')->update();
        }
        if($this->table('bb_bt_tracker')->hasColumn('last_stored_up')) {
            $this->table("bb_bt_tracker")->removeColumn('last_stored_up')->update();
        }
        if($this->table('bb_bt_tracker')->hasColumn('last_stored_down')) {
            $this->table("bb_bt_tracker")->removeColumn('last_stored_down')->update();
        }
        if($this->table('bb_bt_tracker')->hasColumn('stat_last_updated')) {
            $this->table("bb_bt_tracker")->removeColumn('stat_last_updated')->update();
        }
        if($this->table('bb_bt_tracker')->hasColumn('expire_time')) {
            $this->table("bb_bt_tracker")->removeColumn('expire_time')->update();
        }
        // finish bb_bt_tracker

        // start bonus logic https://github.com/hurtom/toloka/issues/47
        $this->execute('ALTER TABLE `bb_bt_users` CHANGE `u_bonus_total` `u_up_bonus` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0');
        $this->execute('ALTER TABLE `bb_bt_users` CHANGE `u_bonus_today` `up_bonus_today` BIGINT(20) NOT NULL DEFAULT 0');
        $this->execute('ALTER TABLE `bb_bt_users` CHANGE `u_down_today` `down_today` BIGINT(20) NOT NULL DEFAULT 0');
        $this->execute('ALTER TABLE `bb_bt_users` CHANGE `u_up_today` `up_today` BIGINT(20) NOT NULL DEFAULT 0');
        $this->execute('ALTER TABLE `bb_bt_users` CHANGE `u_bonus_yday` `up_bonus_yesterday` BIGINT(20) NOT NULL DEFAULT 0');
        $this->execute('ALTER TABLE `bb_bt_users` CHANGE `u_down_yday` `down_yesterday` BIGINT(20) NOT NULL DEFAULT 0');
        $this->execute('ALTER TABLE `bb_bt_users` CHANGE `u_up_yday` `up_yesterday` BIGINT(20) NOT NULL DEFAULT 0');
        
        $table = $this->table("bb_bt_users"); 
        $table->addColumn('u_up_release', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_BIG, 'precision' => 20, 'signed' => false, 'after' => 'u_down_total']);
        $table->addColumn('up_release_today', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_BIG, 'precision' => 20, 'signed' => false, 'after' => 'down_today']);
        $table->addColumn('points_today', 'float', ['null' => false, 'default' => '0.00', 'precision' => 16, 'scale' => 2, 'after' => 'up_bonus_today']);
        $table->addColumn('up_release_yesterday', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_BIG, 'precision' => 20, 'signed' => false, 'after' => 'down_yesterday']);
        $table->addColumn('points_yesterday', 'float', ['null' => false, 'default' => '0.00', 'precision' => 16, 'scale' => 2, 'after' => 'up_bonus_yesterday']);
        $table->save();


        if($this->table('bb_bt_users')->hasColumn('u_bonus_hourly')) {
            $this->table("bb_bt_users")->removeColumn('u_bonus_hourly')->update();
        }
        if($this->table('bb_bt_users')->hasColumn('max_up_speed')) {
            $this->table("bb_bt_users")->removeColumn('max_up_speed')->update();
        }
        if($this->table('bb_bt_users')->hasColumn('max_down_speed')) {
            $this->table("bb_bt_users")->removeColumn('max_down_speed')->update();
        }
        if($this->table('bb_bt_users')->hasColumn('ratio_nulled')) {
            $this->table("bb_bt_users")->removeColumn('ratio_nulled')->update();
        }
        if($this->table('bb_bt_users')->hasColumn('u_up_old')) {
            $this->table("bb_bt_users")->removeColumn('u_up_old')->update();
        }
        if($this->table('bb_bt_users')->hasColumn('u_down_old')) {
            $this->table("bb_bt_users")->removeColumn('u_down_old')->update();
        }
        if($this->table('bb_bt_users')->hasColumn('u_bonus_old')) {
            $this->table("bb_bt_users")->removeColumn('u_bonus_old')->update();
        }
        if($this->table('bb_bt_users')->hasColumn('max_up_speed_old')) {
            $this->table("bb_bt_users")->removeColumn('max_up_speed_old')->update();
        }
        if($this->table('bb_bt_users')->hasColumn('u_releases')) {
            $this->table("bb_bt_users")->removeColumn('u_releases')->update();
        }
        if($this->table('bb_bt_users')->hasColumn('can_leech')) {
            $this->table("bb_bt_users")->removeColumn('can_leech')->update();
        }
        // finish bonus logic

        // start in process
        if($this->table('bb_users')->hasColumn('user_session_page')) {
            $this->table("bb_users")->removeColumn('user_session_page')->update();
        }
        if($this->table('bb_users')->hasColumn('user_style')) {
            $this->table("bb_users")->removeColumn('user_style')->update();
        }
        if($this->table('bb_users')->hasColumn('user_dateformat')) {
            $this->table("bb_users")->removeColumn('user_dateformat')->update();
        }
        if($this->table('bb_users')->hasColumn('user_emailtime')) {
            $this->table("bb_users")->removeColumn('user_emailtime')->update();
        }
        if($this->table('bb_users')->hasColumn('user_allowhtml')) {
            $this->table("bb_users")->removeColumn('user_allowhtml')->update();
        }
        if($this->table('bb_users')->hasColumn('user_allowbbcode')) {
            $this->table("bb_users")->removeColumn('user_allowbbcode')->update();
        }
        if($this->table('bb_users')->hasColumn('user_allowsmile')) {
            $this->table("bb_users")->removeColumn('user_allowsmile')->update();
        }
        if($this->table('bb_users')->hasColumn('user_allowavatar')) {
            $this->table("bb_users")->removeColumn('user_allowavatar')->update();
        }
        if($this->table('bb_users')->hasColumn('user_allow_pm')) {
            $this->table("bb_users")->removeColumn('user_allow_pm')->update();
        }
        if($this->table('bb_users')->hasColumn('user_aim')) {
            $this->table("bb_users")->removeColumn('user_aim')->update();
        }
        if($this->table('bb_users')->hasColumn('user_yim')) {
            $this->table("bb_users")->removeColumn('user_yim')->update();
        }
        if($this->table('bb_users')->hasColumn('user_msnm')) {
            $this->table("bb_users")->removeColumn('user_msnm')->update();
        }

        $table = $this->table("bb_users");
        $table->addColumn('user_password', 'string', ['null' => false, 'default' => '', 'limit' => 32, 'collation' => "utf8_bin", 'encoding' => "utf8", 'after' => 'username']);
        $table->addColumn('user_last_ip', 'char', ['null' => false, 'default' => '', 'limit' => 32, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'user_lastvisit']);
        $table->addColumn('user_reg_ip', 'char', ['null' => false, 'default' => '', 'limit' => 32, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'user_regdate']);
        $table->addColumn('avatar_ext_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_TINY, 'precision' => 3, 'after' => 'user_rank']);
        $table->addColumn('user_gender', 'boolean', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_TINY, 'precision' => 3, 'after' => 'avatar_ext_id']);
        $table->addColumn('user_birthday', 'date', ['null' => false, 'default' => '0000-00-00', 'after' => 'user_gender']);
        $table->addColumn('user_twitter', 'string', ['null' => false, 'default' => '', 'limit' => 15, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'user_skype']);
        $table->addColumn('autologin_id', 'string', ['null' => false, 'default' => '', 'limit' => 12, 'collation' => "utf8_bin", 'encoding' => "utf8", 'after' => 'user_newpasswd']);
        $table->addColumn('user_newest_pm_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7, 'after' => 'autologin_id']);
        $table->addColumn('user_points', 'float', ['null' => false, 'default' => '0.00', 'precision' => 16, 'scale' => 2, 'after' => 'user_newest_pm_id']);
        $table->addColumn('tpl_name', 'string', ['null' => false, 'default' => 'default', 'limit' => 255, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'user_points']);
        $table->addColumn('user_opt', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_REGULAR, 'precision' => 10, 'after' => 'user_last_privmsg']);
        $table->save();
        // finish

        // start ОК
        if($this->table('bb_privmsgs')->hasColumn('privmsgs_enable_bbcode')) {
            $this->table("bb_privmsgs")->removeColumn('privmsgs_enable_bbcode')->update();
        }
        if($this->table('bb_privmsgs')->hasColumn('privmsgs_enable_html')) {
            $this->table("bb_privmsgs")->removeColumn('privmsgs_enable_html')->update();
        }
        if($this->table('bb_privmsgs')->hasColumn('privmsgs_enable_smilies')) {
            $this->table("bb_privmsgs")->removeColumn('privmsgs_enable_smilies')->update();
        }
        if($this->table('bb_privmsgs')->hasColumn('privmsgs_attach_sig')) {
            $this->table("bb_privmsgs")->removeColumn('privmsgs_attach_sig')->update();
        }
        if($this->table('bb_privmsgs')->hasColumn('privmsgs_attachment')) {
            $this->table("bb_privmsgs")->removeColumn('privmsgs_attachment')->update();
        }
        $this->execute("UPDATE bb_privmsgs_text SET privmsgs_text = REPLACE(`privmsgs_text`, CONCAT(':', `privmsgs_bbcode_uid`), '')");
        if($this->table('bb_privmsgs_text')->hasColumn('privmsgs_bbcode_uid')) {
            $this->table("bb_privmsgs_text")->removeColumn('privmsgs_bbcode_uid')->update();
        }
        // finish

        //start ok
        $table = $this->table("bb_topics");
        $table->addColumn('topic_last_post_time', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_REGULAR, 'precision' => 10, 'after' => 'topic_dl_type']);
        $table->changeColumn('topic_title', 'string', ['null' => false, 'default' => '', 'limit' => 250, 'collation' => "utf8_general_ci", 'encoding' => "utf8"]);
        $table->changeColumn('topic_show_first_post', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_TINY, 'precision' => 3, 'signed' => false]);
        $table->save();
        if($this->table('bb_topics')->hasColumn('topic_dl_status')) {
            $this->table("bb_topics")->removeColumn('topic_dl_status')->update();
        }
        if($this->table('bb_topics')->hasColumn('topic_cache_lock')) {
            $this->table("bb_topics")->removeColumn('topic_cache_lock')->update();
        }
        if($this->table('bb_topics')->hasColumn('call_seed_time')) {
            $this->table("bb_topics")->removeColumn('call_seed_time')->update();
        }
        if($this->table('bb_topics')->hasIndex('topic_last_post_time')) {
            $this->table("bb_topics")->removeIndexByName('topic_last_post_time');
        }
        $this->table("bb_topics")->addIndex(['topic_last_post_time'], ['name' => "topic_last_post_time", 'unique' => false])->save();
        if($this->table('bb_topics')->hasIndex('topic_title')) {
            $this->table("bb_topics")->removeIndexByName('topic_title');
        }
        $this->table("bb_topics")->addIndex(['topic_title'], ['name' => "topic_title", 'unique' => false, 'type' => 'fulltext'])->save();
        //finish

        // start
        $this->execute('UPDATE bb_posts SET post_username = "" WHERE post_username IS NULL');
        $this->execute('UPDATE bb_posts SET post_edit_time = 0 WHERE post_edit_time IS NULL');
        $table = $this->table("bb_posts");
        $table->addColumn('poster_rg_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7, 'after' => 'poster_ip']);
        $table->addColumn('attach_rg_sig', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_TINY, 'precision' => 3, 'after' => 'poster_rg_id']);
        $table->addColumn('user_post', 'boolean', ['null' => false, 'default' => '1', 'limit' => MysqlAdapter::INT_TINY, 'precision' => 3, 'after' => 'post_attachment']);
        $table->addColumn('mc_comment', 'text', ['null' => true, 'limit' => 65535, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'user_post']);
        $table->addColumn('mc_type', 'boolean', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_TINY, 'precision' => 3, 'after' => 'mc_comment']);
        $table->addColumn('mc_user_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7, 'after' => 'mc_type']);
        $table->changeColumn('poster_ip', 'char', ['null' => false, 'default' => '', 'limit' => 32, 'collation' => "utf8_bin", 'encoding' => "utf8"]);
        $table->changeColumn('post_username', 'string', ['null' => false, 'default' => '', 'limit' => 25, 'collation' => "utf8_general_ci", 'encoding' => "utf8"]);
        $table->changeColumn('post_edit_time', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_REGULAR, 'precision' => 10]);
        $table->save();
        if($this->table('bb_posts')->hasColumn('enable_bbcode')) {
            $this->table("bb_posts")->removeColumn('enable_bbcode')->update();
        }
        if($this->table('bb_posts')->hasColumn('enable_html')) {
            $this->table("bb_posts")->removeColumn('enable_html')->update();
        }
        if($this->table('bb_posts')->hasColumn('enable_smilies')) {
            $this->table("bb_posts")->removeColumn('enable_smilies')->update();
        }
        if($this->table('bb_posts')->hasColumn('enable_sig')) {
            $this->table("bb_posts")->removeColumn('enable_sig')->update();
        }
        if($this->table('bb_posts')->hasColumn('parsed')) {
            $this->table("bb_posts")->removeColumn('parsed')->update();
        }
        if($this->table('bb_posts')->hasColumn('dont_cache')) {
            $this->table("bb_posts")->removeColumn('dont_cache')->update();
        }
        if($this->table('bb_posts')->hasColumn('cache_file_md5')) {
            $this->table("bb_posts")->removeColumn('cache_file_md5')->update();
        }
        // finish
    }

    public function unknownSql()
    {


    }

    public function change()
    {
        $this->newTable();
    
        /* Колонки тільки у старій версії
        * bb_attachments_desc -> thanks
        * bb_attachments_desc -> rating_sum
        * bb_attachments_desc -> rating_count
        * bb_attachments_desc -> force_private
        *
        *
        *
        *
        */

        $this->table("bb_attachments_desc")->changeColumn('real_filename', 'string', ['null' => false, 'default' => '', 'limit' => 255, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'physical_filename'])->update();
        $this->table("bb_attachments_desc")->changeColumn('comment', 'string', ['null' => false, 'default' => '', 'limit' => 255, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'download_count'])->update();
        $this->table("bb_attachments_desc")->changeColumn('extension', 'string', ['null' => false, 'default' => '', 'limit' => 100, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'comment'])->update();
        $this->table("bb_attachments_desc")->changeColumn('mimetype', 'string', ['null' => false, 'default' => '', 'limit' => 100, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'extension'])->update();

        $this->table("bb_banlist")->changeColumn('ban_ip', 'string', ['null' => false, 'default' => '', 'limit' => 32, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'ban_userid'])->update();
        $this->table("bb_banlist")->changeColumn('ban_email', 'string', ['null' => false, 'default' => '', 'limit' => 255, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'ban_ip'])->update();
        $this->table("bb_bt_torrents")->changeColumn('info_hash', 'varbinary', ['null' => false, 'default' => '', 'limit' => 20])->update();

        $this->table("bb_bt_users")->changeColumn('auth_key', 'char', ['null' => false, 'default' => '', 'limit' => 10, 'collation' => "utf8_bin", 'encoding' => "utf8", 'after' => 'user_id'])->update();

        $this->table("bb_categories")->changeColumn('cat_title', 'string', ['null' => false, 'default' => '', 'limit' => 100, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'cat_id'])->update();

        $this->table("bb_config")->changeColumn('config_value', 'text', ['null' => false, 'limit' => 65535, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'config_name'])->update();

        $this->table("bb_extension_groups")->changeColumn('upload_icon', 'string', ['null' => false, 'default' => '', 'limit' => 100, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'download_mode'])->update();

        $this->table("bb_extension_groups")->changeColumn('forum_permissions', 'text', ['null' => false, 'limit' => 65535, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'max_filesize'])->update();

        $this->table("bb_extensions")->changeColumn('comment', 'string', ['null' => false, 'default' => '', 'limit' => 100, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'extension'])->update();
        
        $this->table("bb_forums")->changeColumn('forum_id', 'integer', ['null' => false, 'limit' => MysqlAdapter::INT_SMALL, 'precision' => 5, 'signed' => false, 'identity' => 'enable'])->update();
        $this->table("bb_forums")->changeColumn('forum_name', 'string', ['null' => false, 'default' => '', 'limit' => 150, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'cat_id'])->update();
        $this->table("bb_forums")->changeColumn('forum_desc', 'text', ['null' => false, 'limit' => 65535, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'forum_name'])->update();
        

        if($this->table('bb_posts')->hasIndex('topic_id')) {
            $this->table("bb_posts")->removeIndexByName('topic_id');
        }
        $this->table("bb_posts")->addIndex(['topic_id'], ['name' => "topic_id", 'unique' => false])->save();
        if($this->table('bb_posts')->hasIndex('forum_id_post_time')) {
            $this->table("bb_posts")->removeIndexByName('forum_id_post_time');
        }
        $this->table("bb_posts")->addIndex(['forum_id','post_time'], ['name' => "forum_id_post_time", 'unique' => false])->save();
        
        $this->table("bb_posts_text")->changeColumn('post_text', 'text', ['null' => false, 'limit' => 65535, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'post_id'])->update();
        
        $this->table("bb_privmsgs")->changeColumn('privmsgs_subject', 'string', ['null' => false, 'default' => '0', 'limit' => 255, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'privmsgs_type'])->update();
        $this->table("bb_privmsgs")->changeColumn('privmsgs_ip', 'string', ['null' => false, 'default' => '', 'limit' => 32, 'collation' => "utf8_bin", 'encoding' => "utf8", 'after' => 'privmsgs_date'])->update();
        
        $this->table("bb_privmsgs_text")->changeColumn('privmsgs_text', 'text', ['null' => false, 'limit' => 65535, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'privmsgs_text_id'])->update();
        
        $this->table("bb_ranks")->changeColumn('rank_title', 'string', ['null' => false, 'default' => '', 'limit' => 50, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'rank_id'])->update();
        $this->table("bb_ranks")->changeColumn('rank_special', 'boolean', ['null' => false, 'default' => '1', 'limit' => MysqlAdapter::INT_TINY, 'precision' => 3, 'after' => 'rank_min'])->update();
        $this->table("bb_ranks")->changeColumn('rank_image', 'string', ['null' => false, 'default' => '', 'limit' => 255, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'rank_special'])->update();
        
        $this->table("bb_search_results")->changeColumn('session_id', 'char', ['null' => false, 'default' => '', 'limit' => 20, 'collation' => "utf8_bin", 'encoding' => "utf8"])->update();
        $table = $this->table("bb_search_results");
        $table->addColumn('search_type', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_TINY, 'precision' => 3, 'after' => 'session_id'])->update();;
        $this->table("bb_search_results")->changeColumn('search_id', 'string', ['null' => false, 'default' => '', 'limit' => 12, 'collation' => "utf8_bin", 'encoding' => "utf8", 'after' => 'search_type'])->update();
        $table->addColumn('search_time', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_REGULAR, 'precision' => 10, 'after' => 'search_id'])->update();;
        $table->addColumn('search_settings', 'text', ['null' => false, 'limit' => 65535, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'search_time'])->update();;
        $table->save();
        
        $this->execute('TRUNCATE TABLE bb_sessions');
        $this->table("bb_sessions")->changeColumn('session_id', 'char', ['null' => false, 'default' => '', 'limit' => 20, 'collation' => "utf8_bin", 'encoding' => "utf8"])->update();
        $this->table("bb_sessions")->changeColumn('session_ip', 'char', ['null' => false, 'default' => '', 'limit' => 32, 'collation' => "utf8_bin", 'encoding' => "utf8", 'after' => 'session_time'])->update();

        $this->table("bb_smilies")->changeColumn('code', 'string', ['null' => false, 'default' => '', 'limit' => 50, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'smilies_id'])->update();
        $this->table("bb_smilies")->changeColumn('smile_url', 'string', ['null' => false, 'default' => '', 'limit' => 100, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'code'])->update();
        $this->table("bb_smilies")->changeColumn('emoticon', 'string', ['null' => false, 'default' => '', 'limit' => 75, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'smile_url'])->update();

        if($this->table('bb_topics_watch')->hasIndex('notify_status')) {
            $this->table("bb_topics_watch")->removeIndexByName('notify_status');
        }
        $this->table("bb_topics_watch")->addIndex(['notify_status'], ['name' => "notify_status", 'unique' => false])->save();

        $this->execute('UPDATE bb_users SET user_rank = 0 WHERE user_rank IS NULL');
        $this->execute('UPDATE bb_users SET user_skype = "" WHERE user_skype IS NULL');
        $this->execute('UPDATE bb_users SET user_newpasswd = "" WHERE user_newpasswd IS NULL');

        $this->table("bb_users")->changeColumn('user_id', 'integer', ['null' => false, 'limit' => MysqlAdapter::INT_MEDIUM, 'precision' => 7, 'identity' => 'enable'])->update();
        $this->table("bb_users")->changeColumn('user_active', 'boolean', ['null' => false, 'default' => '1', 'limit' => MysqlAdapter::INT_TINY, 'precision' => 3])->update();
        $this->table("bb_users")->changeColumn('username', 'string', ['null' => false, 'default' => '', 'limit' => 25, 'collation' => "utf8_general_ci", 'encoding' => "utf8"])->update();
        $this->table("bb_users")->changeColumn('user_level', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_TINY, 'precision' => 3])->update();
        $this->table("bb_users")->changeColumn('user_lang', 'string', ['null' => false, 'default' => 'uk', 'limit' => 255, 'collation' => "utf8_general_ci", 'encoding' => "utf8"])->update();
        $this->table("bb_users")->changeColumn('user_rank', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_REGULAR, 'precision' => 10])->update();
        $this->table("bb_users")->changeColumn('user_email', 'string', ['null' => false, 'default' => '', 'limit' => 255, 'collation' => "utf8_general_ci", 'encoding' => "utf8"])->update();
        $this->table("bb_users")->changeColumn('user_skype', 'string', ['null' => false, 'default' => '', 'limit' => 32, 'collation' => "utf8_general_ci", 'encoding' => "utf8"])->update();
        $this->table("bb_users")->changeColumn('user_icq', 'string', ['null' => false, 'default' => '', 'limit' => 15, 'collation' => "utf8_general_ci", 'encoding' => "utf8"])->update();
        $this->table("bb_users")->changeColumn('user_website', 'string', ['null' => false, 'default' => '', 'limit' => 100, 'collation' => "utf8_general_ci", 'encoding' => "utf8"])->update();
        $this->table("bb_users")->changeColumn('user_from', 'string', ['null' => false, 'default' => '', 'limit' => 100, 'collation' => "utf8_general_ci", 'encoding' => "utf8"])->update();
        $this->table("bb_users")->changeColumn('user_sig', 'text', ['null' => false, 'limit' => 65535, 'collation' => "utf8_general_ci", 'encoding' => "utf8"])->update();
        $this->table("bb_users")->changeColumn('user_occ', 'string', ['null' => false, 'default' => '', 'limit' => 100, 'collation' => "utf8_general_ci", 'encoding' => "utf8"])->update();
        $this->table("bb_users")->changeColumn('user_interests', 'string', ['null' => false, 'default' => '', 'limit' => 255, 'collation' => "utf8_general_ci", 'encoding' => "utf8"])->update();
        $this->table("bb_users")->changeColumn('user_actkey', 'string', ['null' => false, 'default' => '', 'limit' => 32, 'collation' => "utf8_general_ci", 'encoding' => "utf8"])->update();
        $this->table("bb_users")->changeColumn('user_newpasswd', 'string', ['null' => false, 'default' => '', 'limit' => 32, 'collation' => "utf8_general_ci", 'encoding' => "utf8"])->update();
        if($this->table('bb_users')->hasIndex('username')) {
            $this->table("bb_users")->removeIndexByName('username');
        }
        $this->table("bb_users")->addIndex(['username'], ['name' => "username", 'unique' => false, 'limit' => 10])->save();
        if($this->table('bb_users')->hasIndex('user_email')) {
            $this->table("bb_users")->removeIndexByName('user_email');
        }
        $this->table("bb_users")->addIndex(['user_email'], ['name' => "user_email", 'unique' => false, 'limit' => 10])->save();

        $this->table("bb_words")->changeColumn('word', 'char', ['null' => false, 'default' => '', 'limit' => 100, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'word_id'])->update();

        if($this->table('bb_sessions')->hasColumn('session_page')) {
            $this->table("bb_sessions")->removeColumn('session_page')->update();
        }
        $this->table("bb_sessions")->removeIndexByName('session_user_id');
        $this->table("bb_sessions")->removeIndexByName('session_id_ip_user_id');
        $this->table("bb_sessions")->removeIndexByName('session_time');

        $this->table("bb_user_group")->changeColumn('user_pending', 'boolean', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_TINY, 'precision' => 3, 'after' => 'user_id'])->update();
        $table = $this->table("bb_user_group");
        $table->addColumn('user_time', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_REGULAR, 'precision' => 10, 'after' => 'user_pending'])->update();;
        $table->save();

        $this->table("bb_user_group")->removeIndexByName('group_id');
        $this->execute('ALTER TABLE bb_user_group ADD PRIMARY KEY (group_id, user_id)');

        $table = $this->table("bb_groups");
        $table->changeColumn('group_description', 'text', ['null' => false, 'limit' => 65535, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'group_name']);
        $table->addColumn('avatar_ext_id', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_REGULAR, 'precision' => 10, 'after' => 'group_id']);
        $table->addColumn('group_time', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_REGULAR, 'precision' => 10, 'after' => 'avatar_ext_id']);
        $table->addColumn('mod_time', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_REGULAR, 'precision' => 10, 'after' => 'group_time']);
        $table->addColumn('release_group', 'integer', ['null' => false, 'default' => '0', 'limit' => MysqlAdapter::INT_TINY, 'precision' => 3, 'after' => 'group_type']);
        $table->addColumn('group_signature', 'text', ['null' => false, 'limit' => 65535, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'group_description']);
        $table->changeColumn('group_name', 'string', ['null' => false, 'default' => '', 'limit' => 40, 'collation' => "utf8_general_ci", 'encoding' => "utf8"]);
        $table->save();

        $table = $this->table("bb_ranks");
        $table->addColumn('rank_style', 'string', ['null' => false, 'default' => '', 'limit' => 255, 'collation' => "utf8_general_ci", 'encoding' => "utf8", 'after' => 'rank_image'])->update();;
        $table->save();

        $this->query("ALTER TABLE bb_bt_tor_dl_stat CHANGE torrent_id topic_id MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0'");

        $this->table("bb_confirm")->removeIndexByName('PRIMARY');
        $this->dropTable("bb_confirm");

        if($this->table('bb_posts_text')->hasColumn('post_subject')) {
            $this->table("bb_posts_text")->removeColumn('post_subject')->update();
        }

        $this->table("bb_users")->removeIndexByName('user_session_time');

        $this->dropTable("bb_themes");
        $this->dropTable("bb_themes_name");

        $this->tickets();
/////////////
        
        /* окремим тікетом
        
        if($this->table('bb_users')->hasColumn('user_password2')) {
            $this->table("bb_users")->removeColumn('user_password2')->update();
        }
        if($this->table('bb_users')->hasColumn('user_timer')) {
            $this->table("bb_users")->removeColumn('user_timer')->update();
        }
        if($this->table('bb_users')->hasColumn('user_login_tries')) {
            $this->table("bb_users")->removeColumn('user_login_tries')->update();
        }
        if($this->table('bb_users')->hasColumn('user_last_login_try')) {
            $this->table("bb_users")->removeColumn('user_last_login_try')->update();
        }

        //
        if($this->table('bb_users')->hasColumn('user_viewemail')) {
            $this->table("bb_users")->removeColumn('user_viewemail')->update();
        }
        if($this->table('bb_users')->hasColumn('user_notify')) {
            $this->table("bb_users")->removeColumn('user_notify')->update();
        }
        if($this->table('bb_users')->hasColumn('user_notify_pm')) {
            $this->table("bb_users")->removeColumn('user_notify_pm')->update();
        }
        //
        
        if($this->table('bb_users')->hasColumn('user_attachsig')) {
            $this->table("bb_users")->removeColumn('user_attachsig')->update();
        }

        if($this->table('bb_users')->hasColumn('user_allow_viewonline')) {
            $this->table("bb_users")->removeColumn('user_allow_viewonline')->update();
        }
        if($this->table('bb_users')->hasColumn('user_popup_pm')) {
            $this->table("bb_users")->removeColumn('user_popup_pm')->update();
        }
        if($this->table('bb_users')->hasColumn('user_avatar')) {
            $this->table("bb_users")->removeColumn('user_avatar')->update();
        }
        if($this->table('bb_users')->hasColumn('user_avatar_type')) {
            $this->table("bb_users")->removeColumn('user_avatar_type')->update();
        }
        if($this->table('bb_users')->hasColumn('user_sig_bbcode_uid')) {
            $this->table("bb_users")->removeColumn('user_sig_bbcode_uid')->update();
        }
        
        if($this->table('bb_users')->hasColumn('user_allow_passkey')) {
            $this->table("bb_users")->removeColumn('user_allow_passkey')->update();
        }
        if($this->table('bb_users')->hasColumn('user_from_flag')) {
            $this->table("bb_users")->removeColumn('user_from_flag')->update();
        }
        if($this->table('bb_users')->hasColumn('user_allowdefaultavatar')) {
            $this->table("bb_users")->removeColumn('user_allowdefaultavatar')->update();
        }
        if($this->table('bb_users')->hasColumn('user_warnings')) {
            $this->table("bb_users")->removeColumn('user_warnings')->update();
        }
        if($this->table('bb_users')->hasColumn('user_banned')) {
            $this->table("bb_users")->removeColumn('user_banned')->update();
        }
        if($this->table('bb_users')->hasColumn('bt_tor_browse_set')) {
            $this->table("bb_users")->removeColumn('bt_tor_browse_set')->update();
        }
        if($this->table('bb_users')->hasColumn('user_unread_topics')) {
            $this->table("bb_users")->removeColumn('user_unread_topics')->update();
        }
        if($this->table('bb_users')->hasColumn('user_hide_bt_stats')) {
            $this->table("bb_users")->removeColumn('user_hide_bt_stats')->update();
        }
        if($this->table('bb_users')->hasColumn('user_hide_bt_history')) {
            $this->table("bb_users")->removeColumn('user_hide_bt_history')->update();
        }
        if($this->table('bb_users')->hasColumn('user_hide_bt_activity')) {
            $this->table("bb_users")->removeColumn('user_hide_bt_activity')->update();
        }
        if($this->table('bb_users')->hasColumn('user_hide_bt_topics')) {
            $this->table("bb_users")->removeColumn('user_hide_bt_topics')->update();
        }
        if($this->table('bb_users')->hasColumn('user_bt_ssl')) {
            $this->table("bb_users")->removeColumn('user_bt_ssl')->update();
        }
        
        
        $this->table("bb_attachments_rating")->removeIndexByName('PRIMARY');
        $this->dropTable("bb_attachments_rating");
        $this->table("bb_auth_access")->removeIndexByName('group_id');
        $this->table("bb_bt_config")->removeIndexByName('PRIMARY');
        $this->dropTable("bb_bt_config");
        $this->table("bb_bt_search_results")->removeIndexByName('PRIMARY');
        $this->dropTable("bb_bt_search_results");
        $this->table("bb_bt_torrents")->removeIndexByName('info_hash');
        $this->table("bb_bt_torrents")->removeIndexByName('size');
        $this->table("bb_bt_torrents")->removeIndexByName('topic_check_uid');
        $this->table("bb_bt_torrents_del")->removeIndexByName('PRIMARY');
        $this->dropTable("bb_bt_torrents_del");
        $this->table("bb_bt_tracker")->removeIndexByName('torrent_peer_id');
        $this->table("bb_bt_users")->removeIndexByName('user_id_down');
        
        $this->table("bb_dl_st_prevs_list")->removeIndexByName('PRIMARY');
        $this->table("bb_dl_st_prevs_list")->removeIndexByName('prevs_user_pg_user_png_group_g');
        $this->dropTable("bb_dl_st_prevs_list");
        $this->table("bb_flags")->removeIndexByName('PRIMARY');
        $this->dropTable("bb_flags");
        $this->table("bb_forbidden_extensions")->removeIndexByName('PRIMARY');
        $this->dropTable("bb_forbidden_extensions");
        
        $this->table("bb_forums")->removeIndexByName('auth_view');
        $this->table("bb_forums")->removeIndexByName('auth_read');
        $this->table("bb_posts")->removeIndexByName('forum_id');
        $this->table("bb_posts")->removeIndexByName('topic_time');
        $this->table("bb_search_results")->removeIndexByName('session_id');
        $this->table("bb_search_wordlist")->removeIndexByName('PRIMARY');
        $this->table("bb_search_wordlist")->removeIndexByName('word_id');
        $this->dropTable("bb_search_wordlist");
        $this->table("bb_search_wordmatch")->removeIndexByName('post_id');
        $this->table("bb_search_wordmatch")->removeIndexByName('word_id');
        $this->dropTable("bb_search_wordmatch");
        
        $this->table("bb_topics")->removeIndexByName('topic_type');
        $this->table("bb_topics")->removeIndexByName('topic_status');
        $this->table("bb_topics")->removeIndexByName('topic_moved_id');
        $this->table("bb_topics")->removeIndexByName('topic_poster');
        $this->table("bb_topics")->removeIndexByName('topic_cache_lock');
        $this->table("bb_topics_move")->removeIndexByName('PRIMARY');
        $this->table("bb_topics_move")->removeIndexByName('forum_id');
        $this->dropTable("bb_topics_move");
        $this->table("bb_topics_watch")->removeIndexByName('PRIMARY');
        

        $this->table("bb_vote_desc")->removeIndexByName('PRIMARY');
        $this->table("bb_vote_desc")->removeIndexByName('topic_id');
        $this->dropTable("bb_vote_desc");
        $this->table("bb_vote_results")->removeIndexByName('vote_option_id');
        $this->table("bb_vote_results")->removeIndexByName('vote_id');
        $this->dropTable("bb_vote_results");
        $this->table("bb_vote_voters")->removeIndexByName('vote_id');
        $this->table("bb_vote_voters")->removeIndexByName('vote_user_id');
        $this->table("bb_vote_voters")->removeIndexByName('vote_user_ip');
        $this->dropTable("bb_vote_voters");*/
    }
}
