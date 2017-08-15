<?php

namespace Database\Migrations;

use App\Helpers\BBCodeHelper;
use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Migrations\Version;
use Doctrine\DBAL\Schema\Schema as Schema;

class Version20170601000000 extends AbstractMigration
{
    /**
     * @var \App\Helpers\BBCodeHelper $bbCodeHelper
     */
    private $bbCodeHelper;

    /**
     * @var \TorrentPier\Legacy\BBCode $bbCode
     */
    private $bbCode;

    public function __construct(Version $version)
    {
        $this->bbCodeHelper = new BBCodeHelper();
        $this->bbCode = $this->bbCodeHelper->getBBCode();
        parent::__construct($version);
    }

    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        /******************
         * Add new tables
         ******************/

        // bb_ads
        $this->addSql('CREATE TABLE bb_ads (
            ad_id INT UNSIGNED AUTO_INCREMENT NOT NULL,
            ad_block_ids VARCHAR(255) DEFAULT \'\' NOT NULL,
            ad_start_time DATETIME DEFAULT \'0000-00-00 00:00:00\' NOT NULL,
            ad_active_days SMALLINT DEFAULT 0 NOT NULL,
            ad_status TINYINT(1) DEFAULT \'1\' NOT NULL,
            ad_desc VARCHAR(255) DEFAULT \'\' NOT NULL,
            ad_html TEXT NOT NULL,
            PRIMARY KEY(ad_id)
        ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');

        // bb_auth_access_snap
        $this->addSql('CREATE TABLE bb_auth_access_snap (
            user_id INT NOT NULL,
            forum_id SMALLINT UNSIGNED NOT NULL,
            forum_perm INT DEFAULT 0 NOT NULL,
            PRIMARY KEY(user_id, forum_id)
        ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');

        // bb_bt_dlstatus, migration of old data later on
        $this->addSql('CREATE TABLE bb_bt_dlstatus (
            user_id INT NOT NULL,
            topic_id INT UNSIGNED NOT NULL,
            user_status SMALLINT DEFAULT 0 NOT NULL,
            compl_count SMALLINT UNSIGNED NOT NULL DEFAULT 0,
            last_modified_dlstatus TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP,
            INDEX topic_id (topic_id),
            PRIMARY KEY(user_id, topic_id)
        ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');

        // bb_bt_dlstatus_snap
        $this->addSql('CREATE TABLE bb_bt_dlstatus_snap (
            topic_id INT UNSIGNED NOT NULL,
            dl_status SMALLINT NOT NULL,
            users_count SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
            PRIMARY KEY(topic_id, dl_status)
        ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');

        // bb_bt_last_torstat
        $this->addSql('CREATE TABLE bb_bt_last_torstat (
            topic_id INT UNSIGNED NOT NULL,
            user_id INT NOT NULL,
            dl_status TINYINT(1) DEFAULT \'0\' NOT NULL,
            up_add BIGINT UNSIGNED DEFAULT 0 NOT NULL,
            down_add BIGINT UNSIGNED DEFAULT 0 NOT NULL,
            release_add BIGINT UNSIGNED DEFAULT 0 NOT NULL,
            bonus_add BIGINT UNSIGNED DEFAULT 0 NOT NULL,
            speed_up BIGINT UNSIGNED DEFAULT 0 NOT NULL,
            speed_down BIGINT UNSIGNED DEFAULT 0 NOT NULL,
            PRIMARY KEY(topic_id, user_id)
        ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');

        // bb_bt_last_userstat
        $this->addSql('CREATE TABLE bb_bt_last_userstat (
            user_id INT NOT NULL,
            up_add BIGINT UNSIGNED DEFAULT 0 NOT NULL,
            down_add BIGINT UNSIGNED DEFAULT 0 NOT NULL,
            release_add BIGINT UNSIGNED DEFAULT 0 NOT NULL,
            bonus_add BIGINT UNSIGNED DEFAULT 0 NOT NULL,
            speed_up BIGINT UNSIGNED DEFAULT 0 NOT NULL,
            speed_down BIGINT UNSIGNED DEFAULT 0 NOT NULL,
            PRIMARY KEY(user_id)
        ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');

        // bb_bt_torhelp
        $this->addSql('CREATE TABLE bb_bt_torhelp (
            user_id INT NOT NULL,
            topic_id_csv TEXT NOT NULL,
            PRIMARY KEY(user_id)
        ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');

        // bb_bt_torstat
        $this->addSql('CREATE TABLE bb_bt_torstat (
            topic_id INT UNSIGNED NOT NULL,
            user_id INT NOT NULL,
            last_modified_torstat TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP,
            completed TINYINT(1) DEFAULT \'0\' NOT NULL,
            PRIMARY KEY(topic_id, user_id)
        ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');

        // bb_bt_tracker_snap
        $this->addSql('CREATE TABLE bb_bt_tracker_snap (
            topic_id INT UNSIGNED NOT NULL,
            seeders INT UNSIGNED DEFAULT 0 NOT NULL,
            leechers INT UNSIGNED DEFAULT 0 NOT NULL,
            speed_up BIGINT UNSIGNED DEFAULT 0 NOT NULL,
            speed_down BIGINT UNSIGNED DEFAULT 0 NOT NULL,
            PRIMARY KEY(topic_id)
        ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');

        // bb_bt_user_settings
        $this->addSql('CREATE TABLE bb_bt_user_settings (
            user_id INT NOT NULL,
            tor_search_set TEXT NOT NULL,
            last_modified INT DEFAULT 0 NOT NULL,
            PRIMARY KEY(user_id)
        ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');

        // bb_cron
        $this->addSql('CREATE TABLE bb_cron (
            cron_id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
            cron_active TINYINT(1) DEFAULT \'1\' NOT NULL,
            cron_title CHAR(120) DEFAULT \'\' NOT NULL,
            cron_script CHAR(120) DEFAULT \'\' NOT NULL,
            schedule ENUM(\'hourly\',\'daily\',\'weekly\',\'monthly\',\'interval\') DEFAULT \'daily\' NOT NULL COMMENT \'(DC2Type:enumcronschedule)\',
            run_day ENUM(\'1\',\'2\',\'3\',\'4\',\'5\',\'6\',\'7\',\'8\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'24\',\'25\',\'26\',\'27\',\'28\') DEFAULT NULL COMMENT \'(DC2Type:enumcronrunday)\',
            run_time TIME DEFAULT \'04:00:00\',
            run_order SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
            last_run DATETIME DEFAULT \'0000-00-00 00:00:00\' NOT NULL,
            next_run DATETIME DEFAULT \'0000-00-00 00:00:00\' NOT NULL,
            run_interval TIME DEFAULT \'00:00:00\',
            log_enabled TINYINT(1) DEFAULT \'0\' NOT NULL,
            log_file CHAR(120) DEFAULT \'\' NOT NULL,
            log_sql_queries TINYINT(1) DEFAULT \'0\' NOT NULL,
            disable_board TINYINT(1) DEFAULT \'0\' NOT NULL,
            run_counter BIGINT UNSIGNED DEFAULT 0 NOT NULL,
            UNIQUE INDEX title (cron_title),
            UNIQUE INDEX script (cron_script),
            PRIMARY KEY(cron_id)
        ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');

        // bb_log
        $this->addSql('CREATE TABLE bb_log (
            id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL,
            log_type_id INT UNSIGNED DEFAULT 0 NOT NULL,
            log_user_id INT DEFAULT 0 NOT NULL,
            log_username VARCHAR(25) DEFAULT \'\' NOT NULL,
            log_user_ip VARCHAR(42) DEFAULT \'0\' NOT NULL COLLATE utf8mb4_bin,
            log_forum_id SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
            log_forum_id_new SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
            log_topic_id INT UNSIGNED DEFAULT 0 NOT NULL,
            log_topic_id_new INT UNSIGNED DEFAULT 0 NOT NULL,
            log_topic_title VARCHAR(250) DEFAULT \'\' NOT NULL,
            log_topic_title_new VARCHAR(250) DEFAULT \'\' NOT NULL,
            log_time INT DEFAULT 0 NOT NULL,
            log_msg TEXT NOT NULL,
            INDEX log_time (log_time),
            FULLTEXT INDEX log_topic_title (log_topic_title),
            PRIMARY KEY(id)
        ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');

        // bb_poll_users
        $this->addSql('CREATE TABLE bb_poll_users (
            topic_id INT UNSIGNED NOT NULL,
            user_id INT NOT NULL,
            vote_ip VARCHAR(42) DEFAULT \'0\' NOT NULL COLLATE utf8mb4_bin,
            vote_dt INT DEFAULT 0 NOT NULL,
            PRIMARY KEY(topic_id, user_id)
        ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');

        // bb_poll_votes
        $this->addSql('CREATE TABLE bb_poll_votes (
            topic_id INT UNSIGNED NOT NULL,
            vote_id TINYINT(1) NOT NULL,
            vote_text VARCHAR(255) NOT NULL,
            vote_result INT UNSIGNED NOT NULL,
            PRIMARY KEY(topic_id, vote_id)
        ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');

        // bb_posts_html
        $this->addSql('CREATE TABLE bb_posts_html (
            post_id INT UNSIGNED NOT NULL,
            post_html_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP,
            post_html MEDIUMTEXT NOT NULL,
            PRIMARY KEY(post_id)
        ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');

        // bb_posts_search
        $this->addSql('CREATE TABLE bb_posts_search (
            post_id INT UNSIGNED NOT NULL,
            search_words TEXT NOT NULL,
            FULLTEXT INDEX search_words (search_words),
            PRIMARY KEY(post_id)
        ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');

        // bb_search_rebuild
        $this->addSql('CREATE TABLE bb_search_rebuild (
            rebuild_session_id INT UNSIGNED AUTO_INCREMENT NOT NULL,
            start_post_id INT UNSIGNED DEFAULT 0 NOT NULL,
            end_post_id INT UNSIGNED DEFAULT 0 NOT NULL,
            start_time INT DEFAULT 0 NOT NULL,
            end_time INT DEFAULT 0 NOT NULL,
            last_cycle_time INT DEFAULT 0 NOT NULL,
            session_time INT DEFAULT 0 NOT NULL,
            session_posts INT UNSIGNED DEFAULT 0 NOT NULL,
            session_cycles INT UNSIGNED DEFAULT 0 NOT NULL,
            search_size INT UNSIGNED DEFAULT 0 NOT NULL,
            rebuild_session_status TINYINT(1) DEFAULT \'0\' NOT NULL,
            PRIMARY KEY(rebuild_session_id)
        ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');

        // bb_topic_tpl
        $this->addSql('CREATE TABLE bb_topic_tpl (
            tpl_id SMALLINT AUTO_INCREMENT NOT NULL,
            tpl_name VARCHAR(60) DEFAULT \'\' NOT NULL,
            tpl_src_form TEXT NOT NULL,
            tpl_src_title TEXT NOT NULL,
            tpl_src_msg TEXT NOT NULL,
            tpl_comment TEXT NOT NULL,
            tpl_rules_post_id INT UNSIGNED DEFAULT 0 NOT NULL,
            tpl_last_edit_tm INT DEFAULT 0 NOT NULL,
            tpl_last_edit_by INT DEFAULT 0 NOT NULL,
            UNIQUE INDEX tpl_name (tpl_name),
            PRIMARY KEY(tpl_id)
        ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');

        // buf_last_seeder
        $this->addSql('CREATE TABLE buf_last_seeder (
            topic_id INT UNSIGNED NOT NULL,
            seeder_last_seen INT DEFAULT 0 NOT NULL,
            PRIMARY KEY(topic_id)
        ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');

        // buf_topic_view
        $this->addSql('CREATE TABLE buf_topic_view (
            topic_id INT UNSIGNED NOT NULL,
            topic_views INT UNSIGNED DEFAULT 0 NOT NULL,
            PRIMARY KEY(topic_id)
        ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');

        /******************
         * Drop old tables
         ******************/

        /**
         * bb_bt_config
         * @see https://github.com/hurtom/toloka/issues/95
         */
        $this->addSql('DROP TABLE bb_bt_config');

        /**
         * bb_bt_search_results
         * @see https://github.com/hurtom/toloka/issues/94
         */
        $this->addSql('DROP TABLE bb_bt_search_results');

        /**
         * bb_bt_torrents_del & bb_topics_au trigger
         * @see https://github.com/hurtom/toloka/issues/96
         * @see https://github.com/hurtom/toloka/issues/108
         */
        $this->addSql('DROP TABLE bb_bt_torrents_del');
        $this->addSql('DROP TRIGGER IF EXISTS bb_topics_au');

        /**
         * bb_confirm
         * @see https://github.com/hurtom/toloka/issues/98
         */
        $this->addSql('DROP TABLE bb_confirm');

        /**
         * bb_dl_st_prevs_list
         * @see https://github.com/hurtom/toloka/issues/99
         */
        $this->addSql('DROP TABLE bb_dl_st_prevs_list');

        /**
         * bb_easymod & bb_easymod_processed_files
         * @see https://github.com/hurtom/toloka/issues/39
         */
        $this->addSql('DROP TABLE bb_easymod');
        $this->addSql('DROP TABLE bb_easymod_processed_files');

        /**
         * bb_flags
         * @see https://github.com/hurtom/toloka/issues/100
         */
        $this->addSql('DROP TABLE bb_flags');

        /**
         * bb_forbidden_extensions
         * @see https://github.com/hurtom/toloka/issues/101
         */
        $this->addSql('DROP TABLE bb_forbidden_extensions');

        /**
         * bb_forum_prune
         * @see https://github.com/hurtom/toloka/issues/102
         */
        $this->addSql('DROP TABLE bb_forum_prune');

        /**
         * bb_search_wordlist
         * @see https://github.com/hurtom/toloka/issues/103
         */
        $this->addSql('DROP TABLE bb_search_wordlist');

        /**
         * bb_search_wordmatch
         * @see https://github.com/hurtom/toloka/issues/90
         */
        $this->addSql('DROP TABLE bb_search_wordmatch');

        /**
         * bb_sessions_keys
         * @see https://github.com/hurtom/toloka/issues/37
         */
        $this->addSql('DROP TABLE bb_sessions_keys');

        /**
         * bb_themes & bb_themes_name
         * @see https://github.com/hurtom/toloka/issues/104
         */
        $this->addSql('DROP TABLE bb_themes');
        $this->addSql('DROP TABLE bb_themes_name');

        /**
         * bb_topics_move
         * @see https://github.com/hurtom/toloka/issues/105
         */
        $this->addSql('DROP TABLE bb_topics_move');

        /******************
         * Modify tables
         ******************/

        /**
         * bb_attachments
         * @see https://github.com/hurtom/toloka/issues/27
         */
        $this->addSql('DROP INDEX attach_id_post_id ON bb_attachments');
        $this->addSql('ALTER TABLE bb_attachments
            CHANGE attach_id attach_id INT UNSIGNED NOT NULL,
            CHANGE post_id post_id INT UNSIGNED NOT NULL,
            CHANGE privmsgs_id privmsgs_id INT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE user_id_1 user_id_1 INT DEFAULT 0 NOT NULL,
            CHANGE user_id_2 user_id_2 INT DEFAULT 0 NOT NULL,
            ADD PRIMARY KEY (attach_id, post_id),
            ENGINE = InnoDB');

        // bb_attachments_config
        $this->addSql('ALTER TABLE bb_attachments_config
            CHANGE config_name config_name VARCHAR(255) NOT NULL,
            ENGINE = InnoDB');

        // bb_attachments_desc
        $this->addSql('ALTER TABLE bb_attachments_desc
            CHANGE real_filename real_filename VARCHAR(255) DEFAULT \'\' NOT NULL,
            CHANGE comment comment VARCHAR(255) DEFAULT \'\' NOT NULL,
            CHANGE extension extension VARCHAR(100) DEFAULT \'\' NOT NULL,
            CHANGE mimetype mimetype VARCHAR(100) DEFAULT \'\' NOT NULL,
            CHANGE thanks thanks_count INT UNSIGNED DEFAULT 0 NOT NULL,
            ENGINE = InnoDB');

        // bb_attachments_rating
        $this->addSql('ALTER TABLE bb_attachments_rating
            CHANGE attach_id attach_id INT UNSIGNED NOT NULL,
            CHANGE user_id user_id INT NOT NULL,
            ENGINE = InnoDB');

        // bb_attach_quota
        $this->addSql('ALTER TABLE bb_attach_quota
            CHANGE user_id user_id INT DEFAULT 0 NOT NULL,
            CHANGE quota_limit_id quota_limit_id INT UNSIGNED NOT NULL,
            ADD PRIMARY KEY (quota_limit_id),
            ENGINE = InnoDB');

        /**
         * <bb_auth_access>
         * @see https://github.com/hurtom/toloka/issues/29
         */
        $table = $schema->getTable('bb_auth_access');
        if ($table->hasIndex('group_id')) {
            $this->addSql('DROP INDEX group_id ON bb_auth_access');
        }
        $this->addSql('ALTER TABLE bb_auth_access
            ADD forum_perm INT DEFAULT 0 NOT NULL,
            CHANGE group_id group_id INT UNSIGNED DEFAULT 0 NOT NULL,
            ADD PRIMARY KEY (group_id, forum_id),
            ENGINE = InnoDB');

        // migrate permissions
        $st = $this->connection->executeQuery('SELECT * FROM bb_auth_access');
        // TODO: better fetch over with iterator
        // $rows = $st->fetchAll();
        $permAssoc = $this->bbCodeHelper::FORUM_PERM;
        // foreach ($rows as $row) {
        while ($row = $st->fetch()) {
            $_perm = [];
            foreach ($permAssoc as $ident => $bit) {
                if (!empty($row[$ident])) {
                    $_perm[] = $bit;
                }
            }
            $this->addSql('UPDATE bb_auth_access SET forum_perm = ? WHERE group_id = ? AND forum_id = ?',
                [bit2dec($_perm), $row['group_id'], $row['forum_id']]);
        }

        $this->addSql("DELETE FROM bb_auth_access_snap");
        $this->addSql('
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
                AND g.group_id = ug.group_id
                AND aa.group_id = g.group_id
            GROUP BY
                ug.user_id, aa.forum_id
        ');

        if ($table->hasColumn('auth_view')) {
            $table->dropColumn('auth_view');
        }
        if ($table->hasColumn('auth_read')) {
            $table->dropColumn('auth_read');
        }
        if ($table->hasColumn('auth_post')) {
            $table->dropColumn('auth_post');
        }
        if ($table->hasColumn('auth_reply')) {
            $table->dropColumn('auth_reply');
        }
        if ($table->hasColumn('auth_edit')) {
            $table->dropColumn('auth_edit');
        }
        if ($table->hasColumn('auth_delete')) {
            $table->dropColumn('auth_delete');
        }
        if ($table->hasColumn('auth_sticky')) {
            $table->dropColumn('auth_sticky');
        }
        if ($table->hasColumn('auth_announce')) {
            $table->dropColumn('auth_announce');
        }
        if ($table->hasColumn('auth_vote')) {
            $table->dropColumn('auth_vote');
        }
        if ($table->hasColumn('auth_pollcreate')) {
            $table->dropColumn('auth_pollcreate');
        }
        if ($table->hasColumn('auth_attachments')) {
            $table->dropColumn('auth_attachments');
        }
        if ($table->hasColumn('auth_mod')) {
            $table->dropColumn('auth_mod');
        }
        if ($table->hasColumn('auth_download')) {
            $table->dropColumn('auth_download');
        }
        // if ($table->hasIndex('forum_id')) {
        //     $this->table("bb_auth_access")->removeIndexByName('forum_id');
        // }
        // </bb_auth_access>

        // bb_banlist
        $this->addSql('ALTER TABLE bb_banlist
            CHANGE ban_userid ban_userid INT DEFAULT 0 NOT NULL,
            CHANGE ban_ip ban_ip VARCHAR(42) DEFAULT \'0\' NOT NULL COLLATE utf8_bin,
            CHANGE ban_email ban_email VARCHAR(255) DEFAULT \'\' NOT NULL,
            ENGINE = InnoDB');

        /**
         * <bb_bt_torrents>
         * @see https://github.com/hurtom/toloka/issues/43
         */
        if ($schema->getTable('bb_bt_torrents')->hasIndex('info_hash')) {
            $this->addSql('DROP INDEX info_hash ON bb_bt_torrents');
        }
        if ($schema->getTable('bb_bt_torrents')->hasIndex('topic_check_uid')) {
            $this->addSql('DROP INDEX topic_check_uid ON bb_bt_torrents');
        }
        if ($schema->getTable('bb_bt_torrents')->hasIndex('forum_id')) {
            $this->addSql('DROP INDEX forum_id ON bb_bt_torrents');
        }

        // temporary mapping
        $this->addSql('CREATE TABLE tmp_torrents_topics (
            torrent_id INT UNSIGNED NOT NULL,
            topic_id INT UNSIGNED NOT NULL,
            peer_hash VARCHAR(32) NOT NULL COLLATE utf8_bin,
            PRIMARY KEY(torrent_id)
        )');
        $this->addSql('INSERT INTO tmp_torrents_topics (torrent_id, topic_id, peer_hash)
            SELECT tor.torrent_id,
                   tor.topic_id,
                   MD5(CONCAT(RTRIM(tor.info_hash), IFNULL(u.auth_key,\'\'), IFNULL(tr.ip,0), IFNULL(tr.port,0)))
            FROM bb_bt_torrents tor
            LEFT JOIN bb_bt_tracker tr USING (torrent_id)
            LEFT JOIN bb_bt_users u USING (user_id)');
        // end of temporary mapping

        $this->addSql('ALTER TABLE bb_bt_torrents
            DROP PRIMARY KEY,
            DROP torrent_id,
            CHANGE info_hash info_hash VARBINARY(20) NOT NULL,
            ADD forum_id SMALLINT UNSIGNED DEFAULT 0 NOT NULL AFTER topic_id,
            ADD call_seed_time INT DEFAULT 0 NOT NULL AFTER reg_time,
            CHANGE topic_check_status tor_status TINYINT(3) UNSIGNED NOT NULL DEFAULT 0 AFTER seeder_last_seen,
            CHANGE topic_check_uid checked_user_id INT NOT NULL DEFAULT 0 AFTER tor_status,
            CHANGE topic_check_date checked_time INT NOT NULL DEFAULT 0 AFTER checked_user_id,
            ADD tor_type SMALLINT UNSIGNED DEFAULT 0 NOT NULL AFTER checked_time,
            CHANGE speed_ul speed_up BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 AFTER tor_type,
            CHANGE speed_dl speed_down BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 AFTER speed_up,
            DROP piece_length,
            DROP last_seeder_uid,
            DROP leechers,
            DROP seeders,
            CHANGE topic_check_first_fid topic_check_orig_fid SMALLINT UNSIGNED DEFAULT 0 NOT NULL AFTER speed_down,
            CHANGE topic_check_duble_tid topic_check_dup_tid INT UNSIGNED DEFAULT 0 NOT NULL AFTER topic_check_orig_fid,
            ADD PRIMARY KEY (info_hash),
            ENGINE = InnoDB');
        $this->addSql('CREATE INDEX forum_id ON bb_bt_torrents (forum_id)');
        $this->addSql('CREATE INDEX checked_user_id ON bb_bt_torrents (checked_user_id)');
        $this->addSql('UPDATE bb_bt_torrents, bb_topics
            SET bb_bt_torrents.tor_type = bb_topics.topic_type_gold,
                bb_bt_torrents.forum_id = bb_topics.forum_id,
                bb_bt_torrents.call_seed_time = bb_topics.call_seed_time
            WHERE bb_bt_torrents.topic_id = bb_topics.topic_id');

        // bb_bt_tor_dl_stat
        $this->addSql('ALTER TABLE bb_bt_tor_dl_stat
            DROP PRIMARY KEY,
            ADD topic_id INT UNSIGNED NOT NULL FIRST,
            ENGINE=InnoDB ROW_FORMAT=DEFAULT');
        $this->addSql('UPDATE bb_bt_tor_dl_stat, tmp_torrents_topics
            SET bb_bt_tor_dl_stat.topic_id = tmp_torrents_topics.topic_id
            WHERE bb_bt_tor_dl_stat.torrent_id = tmp_torrents_topics.torrent_id');
        $this->addSql('ALTER TABLE bb_bt_tor_dl_stat
            DROP torrent_id,
            CHANGE user_id user_id INT NOT NULL,
            ADD PRIMARY KEY (topic_id, user_id)');

        /**
         * bb_bt_tracker
         * @see https://github.com/hurtom/toloka/issues/42
         */
        if ($schema->getTable('bb_bt_tracker')->hasIndex('torrent_peer_id')) {
            $this->addSql('DROP INDEX torrent_peer_id ON bb_bt_tracker');
        }
        $this->addSql('ALTER TABLE bb_bt_tracker
            ADD peer_hash VARCHAR(32) NOT NULL COLLATE utf8_bin FIRST,
            ADD topic_id INT UNSIGNED DEFAULT 0 NOT NULL AFTER peer_hash,
            CHANGE peer_id peer_id VARCHAR(20) DEFAULT \'0\' NOT NULL AFTER topic_id,
            CHANGE user_id user_id INT DEFAULT 0 NOT NULL AFTER peer_id,
            CHANGE ip ip VARCHAR(42) DEFAULT \'0\' NOT NULL COLLATE utf8_bin AFTER user_id,
            CHANGE ipv6 ipv6 VARCHAR(42) DEFAULT NULL COLLATE utf8_bin AFTER ip,
            CHANGE port port SMALLINT UNSIGNED DEFAULT 0 NOT NULL AFTER ipv6,
            ADD client VARCHAR(51) DEFAULT \'Unknown\' NOT NULL AFTER port,
            CHANGE seeder seeder TINYINT(1) DEFAULT 0 NOT NULL AFTER client,
            ADD releaser TINYINT(1) DEFAULT 0 NOT NULL AFTER seeder,
            ADD tor_type SMALLINT UNSIGNED DEFAULT 0 NOT NULL AFTER releaser,
            CHANGE uploaded uploaded BIGINT UNSIGNED DEFAULT 0 NOT NULL AFTER tor_type,
            CHANGE downloaded downloaded BIGINT UNSIGNED DEFAULT 0 NOT NULL AFTER uploaded,
            ADD remain BIGINT UNSIGNED DEFAULT 0 NOT NULL AFTER downloaded,
            CHANGE speed_up speed_up BIGINT UNSIGNED DEFAULT 0 NOT NULL AFTER remain,
            CHANGE speed_down speed_down BIGINT UNSIGNED DEFAULT 0 NOT NULL AFTER speed_up,
            CHANGE last_stored_up up_add BIGINT UNSIGNED DEFAULT 0 NOT NULL AFTER speed_down,
            CHANGE last_stored_down down_add BIGINT UNSIGNED DEFAULT 0 NOT NULL AFTER up_add,
            CHANGE update_time update_time INT DEFAULT 0 NOT NULL AFTER down_add,
            CHANGE complete_percent complete_percent BIGINT DEFAULT 0 NOT NULL AFTER update_time,
            ADD complete INT DEFAULT 0 NOT NULL,
            DROP stat_last_updated,
            DROP expire_time,
            /* ADD PRIMARY KEY (peer_hash), */
            ENGINE = InnoDB');
        $this->addSql('UPDATE bb_bt_tracker, tmp_torrents_topics
            SET bb_bt_tracker.topic_id = tmp_torrents_topics.topic_id,
                bb_bt_tracker.peer_hash = tmp_torrents_topics.peer_hash
            WHERE bb_bt_tracker.torrent_id = tmp_torrents_topics.torrent_id');
        // remove temp mapping
        $this->addSql('DROP TABLE tmp_torrents_topics');
        // index creation delayed after CHARSET converion time
        // $this->addSql('CREATE INDEX topic_id ON bb_bt_tracker (topic_id)');

        /**
         * bb_bt_users
         * @see https://github.com/hurtom/toloka/issues/47
         */
        $this->addSql('ALTER TABLE bb_bt_users
            ADD u_up_release BIGINT UNSIGNED DEFAULT 0 NOT NULL AFTER u_down_total,
            CHANGE u_bonus_total u_up_bonus BIGINT UNSIGNED DEFAULT 0 NOT NULL AFTER u_up_release,
            CHANGE u_up_today up_today BIGINT UNSIGNED DEFAULT 0 NOT NULL AFTER u_up_bonus,
            CHANGE u_down_today down_today BIGINT UNSIGNED DEFAULT 0 NOT NULL AFTER up_today,
            ADD up_release_today BIGINT UNSIGNED DEFAULT 0 NOT NULL AFTER down_today,
            CHANGE u_bonus_today up_bonus_today BIGINT UNSIGNED DEFAULT 0 NOT NULL AFTER up_release_today,
            ADD points_today DOUBLE PRECISION DEFAULT \'0.00\' NOT NULL AFTER up_bonus_today,
            CHANGE u_up_yday up_yesterday BIGINT UNSIGNED DEFAULT 0 NOT NULL AFTER points_today,
            CHANGE u_down_yday down_yesterday BIGINT UNSIGNED DEFAULT 0 NOT NULL AFTER up_yesterday,
            ADD up_release_yesterday BIGINT UNSIGNED DEFAULT 0 NOT NULL AFTER down_yesterday,
            CHANGE u_bonus_yday up_bonus_yesterday BIGINT UNSIGNED DEFAULT 0 NOT NULL AFTER up_release_yesterday,
            ADD points_yesterday DOUBLE PRECISION DEFAULT \'0.00\' NOT NULL AFTER up_bonus_yesterday,
            DROP u_bonus_hourly,
            DROP max_up_speed,
            DROP max_down_speed,
            DROP ratio_nulled,
            DROP u_up_old,
            DROP u_down_old,
            DROP u_bonus_old,
            DROP max_up_speed_old,
            DROP u_releases,
            DROP can_leech,
            CHANGE user_id user_id INT NOT NULL,
            CHANGE auth_key auth_key CHAR(10) DEFAULT \'\' NOT NULL COLLATE utf8_bin,
            ENGINE=InnoDB ROW_FORMAT=DEFAULT');

        /**
         * bb_bt_users_dl_status migration to bb_bt_dlstatus
         * @see https://github.com/hurtom/toloka/issues/97
         */
        $this->addSql('
            INSERT INTO bb_bt_dlstatus
                (user_id, topic_id, user_status, compl_count, last_modified_dlstatus)
            SELECT
                user_id,
                topic_id,
                user_status,
                compl_count,
                FROM_UNIXTIME(update_time)
            FROM bb_bt_users_dl_status
        ');
        $this->addSql('DROP TABLE bb_bt_users_dl_status');

        // bb_categories
        $this->addSql('ALTER TABLE bb_categories
            DROP cat_title_short,
            DROP cat_title_hashtag,
            DROP cat_url,
            DROP cat_desc,
            CHANGE cat_title cat_title VARCHAR(100) DEFAULT \'\' NOT NULL,
            CHANGE cat_order cat_order SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
            ENGINE = InnoDB');

        // bb_config
        $this->addSql('ALTER TABLE bb_config
            CHANGE config_name config_name VARCHAR(255) NOT NULL,
            CHANGE config_value config_value TEXT NOT NULL,
            ENGINE = InnoDB');

        // bb_disallow
        $this->addSql('ALTER TABLE bb_disallow ENGINE = InnoDB');

        // bb_extension_groups
        $this->addSql('ALTER TABLE bb_extension_groups
            CHANGE group_id group_id INT UNSIGNED AUTO_INCREMENT NOT NULL,
            CHANGE cat_id cat_id INT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE download_mode download_mode SMALLINT UNSIGNED DEFAULT 1 NOT NULL,
            CHANGE upload_icon upload_icon VARCHAR(100) DEFAULT \'\' NOT NULL,
            CHANGE forum_permissions forum_permissions TEXT NOT NULL,
            ENGINE = InnoDB');

        // bb_extensions
        $this->addSql('ALTER TABLE bb_extensions
            CHANGE comment comment VARCHAR(100) DEFAULT \'\' NOT NULL,
            ENGINE = InnoDB');

        // bb_forums
        $this->addSql('ALTER TABLE bb_forums
            ADD forum_tpl_id SMALLINT DEFAULT 0 NOT NULL,
            ADD prune_days SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
            ADD allow_porno_topic TINYINT(1) DEFAULT \'0\' NOT NULL,
            DROP prune_next,
            DROP prune_enable,
            DROP allow_dl_topic,
            DROP dl_type_default,
            DROP last_dl_topics_synch,
            DROP show_dl_buttons,
            DROP move_next,
            DROP recycle_move_next,
            DROP move_enable,
            CHANGE forum_id forum_id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
            CHANGE forum_name forum_name VARCHAR(150) DEFAULT \'\' NOT NULL,
            CHANGE forum_desc forum_desc TEXT NOT NULL,
            CHANGE forum_order forum_order SMALLINT UNSIGNED DEFAULT 1 NOT NULL,
            CHANGE forum_parent forum_parent SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
            ENGINE = InnoDB');

        // bb_groups
        $this->addSql('ALTER TABLE bb_groups
            ADD group_time INT DEFAULT 0 NOT NULL,
            ADD mod_time INT DEFAULT 0 NOT NULL,
            ADD release_group TINYINT(1) DEFAULT \'0\' NOT NULL,
            ADD group_signature TEXT NOT NULL,
            CHANGE group_id group_id INT UNSIGNED AUTO_INCREMENT NOT NULL,
            CHANGE group_name group_name VARCHAR(40) DEFAULT \'\' NOT NULL,
            CHANGE group_description group_description TEXT NOT NULL,
            CHANGE group_order avatar_ext_id INT DEFAULT 0 NOT NULL, ENGINE=InnoDB');

        // bb_posts
        $this->addSql('ALTER TABLE bb_posts
            ADD poster_rg_id INT DEFAULT 0 NOT NULL,
            ADD attach_rg_sig TINYINT(1) DEFAULT \'0\' NOT NULL,
            ADD user_post TINYINT(1) DEFAULT \'1\' NOT NULL,
            ADD mc_comment TEXT DEFAULT NULL,
            ADD mc_type TINYINT(1) DEFAULT \'0\' NOT NULL,
            ADD mc_user_id INT DEFAULT 0 NOT NULL,
            DROP enable_bbcode,
            DROP enable_html,
            DROP enable_smilies,
            DROP enable_sig,
            DROP parsed,
            DROP dont_cache,
            DROP cache_file_md5,
            CHANGE poster_ip poster_ip VARCHAR(42) DEFAULT \'0\' NOT NULL COLLATE utf8_bin,
            CHANGE post_username post_username VARCHAR(25) DEFAULT \'\' NOT NULL,
            CHANGE post_edit_time post_edit_time INT DEFAULT 0 NOT NULL,
            ENGINE = InnoDB');
        $this->addSql('CREATE INDEX topic_id ON bb_posts (topic_id)');
        $this->addSql('CREATE INDEX forum_id_post_time ON bb_posts (forum_id, post_time)');

        /**
         * <bb_posts_edit>
         * @see https://github.com/hurtom/toloka/issues/40
         */
        if ($schema->getTable('bb_posts_edit')->hasIndex('post_id')) {
            $this->addSql('DROP INDEX post_id ON bb_posts_edit');
        }
        $this->addSql('ALTER TABLE bb_posts_edit
            CHANGE post_id post_id INT UNSIGNED NOT NULL,
            ADD PRIMARY KEY (post_id, user_id),
            ADD INDEX (user_id),
            ENGINE = InnoDB');
        // </bb_posts_edit>

        /**
         * <bb_posts_text>
         * start logic hurtom bb_posts_text + bb_posts_html migration
         */
        $table = $schema->getTable('bb_posts_text');
        $this->addSql('ALTER TABLE bb_posts_text
            CHANGE post_id post_id INT UNSIGNED NOT NULL,
            CHANGE post_text post_text TEXT NOT NULL,
            ENGINE = InnoDB');

        // taken from #76
        $this->addSql("UPDATE bb_posts_text SET post_text = REPLACE(`post_text`, CONCAT(':', `bbcode_uid`), '')");
        if ($table->hasColumn('bbcode_uid')) {
            $table->dropColumn('bbcode_uid');
        }
        if ($table->hasColumn('post_subject')) {
            $table->dropColumn('post_subject');
        }

        $bbcode = $this->bbCode;
        $smilies = [];

        $conn = $this->connection;
        $st = $conn->executeQuery('SELECT * FROM bb_smilies');
        // TODO: better fetch over with iterator
        // $rows = $st->fetchAll();
        // foreach ($rows as $smile) {
        while ($smile = $st->fetch()) {
            $smilies['orig'][] = '#(?<=^|\W)' . preg_quote($smile['code'], '#') . '(?=$|\W)#';
            $smilies['repl'][] = ' <img class="smile" src="' . $bb_cfg['smilies_path'] . '/' . $smile['smile_url'] . '" alt="' . $smile['emoticon'] . '" align="absmiddle" border="0" />';
            $smilies['smile'][] = $smile;
        }

        $bbcode->smilies = $smilies;
        $st = $conn->executeQuery('SELECT * FROM bb_posts_text');
        // TODO: better not use fetchAll() here - possibly huge amount of rows
        // $rows = $st->fetchAll();
        // foreach ($rows as $row) {
        while ($row = $st->fetch()) {
            $postText = $bbcode->bbcode2html($row['post_text']);
            $this->addSql('INSERT INTO bb_posts_html (post_id, post_html) VALUES (?, ?)',
                [$row['post_id'], $postText]);
        }
        // </bb_posts_text>

        // bb_privmsgs
        $this->addSql('ALTER TABLE bb_privmsgs
            DROP privmsgs_enable_bbcode,
            DROP privmsgs_enable_html,
            DROP privmsgs_enable_smilies,
            DROP privmsgs_attach_sig,
            DROP privmsgs_attachment,
            CHANGE privmsgs_id privmsgs_id INT UNSIGNED NOT NULL,
            CHANGE privmsgs_subject privmsgs_subject VARCHAR(255) DEFAULT \'0\' NOT NULL,
            CHANGE privmsgs_ip privmsgs_ip VARCHAR(42) DEFAULT \'0\' NOT NULL COLLATE utf8_bin,
            ENGINE = InnoDB');

        // bb_privmsgs_text
        $this->addSql('ALTER TABLE bb_privmsgs_text
            DROP privmsgs_bbcode_uid,
            CHANGE privmsgs_text_id privmsgs_text_id INT UNSIGNED NOT NULL,
            CHANGE privmsgs_text privmsgs_text TEXT NOT NULL,
            ENGINE = InnoDB');

        // bb_quota_limits
        $this->addSql('ALTER TABLE bb_quota_limits ENGINE = InnoDB');

        // bb_ranks
        $this->addSql('ALTER TABLE bb_ranks
            ADD rank_style VARCHAR(255) DEFAULT \'\' NOT NULL,
            DROP rank_min,
            DROP rank_special,
            CHANGE rank_title rank_title VARCHAR(50) DEFAULT \'\' NOT NULL,
            CHANGE rank_image rank_image VARCHAR(255) DEFAULT \'\' NOT NULL,
            CHANGE rank_group rank_group INT UNSIGNED NOT NULL,
            ENGINE = InnoDB');

        // bb_search_results
        $this->addSql('DROP INDEX session_id ON bb_search_results');
        $this->addSql('ALTER TABLE bb_search_results
            DROP PRIMARY KEY,
            ENGINE = InnoDB');
        $this->addSql('ALTER TABLE bb_search_results
            ADD search_type TINYINT(1) DEFAULT \'0\' NOT NULL,
            ADD search_time INT DEFAULT 0 NOT NULL,
            ADD search_settings TEXT NOT NULL,
            CHANGE search_id search_id VARCHAR(12) NOT NULL COLLATE utf8_bin,
            CHANGE session_id session_id CHAR(20) NOT NULL COLLATE utf8_bin');
        // delay index building after changing CHARSET (due it is done via BLOB and back)
        // $this->addSql('CREATE INDEX search_id ON bb_search_results (search_id)');
        // $this->addSql('ALTER TABLE bb_search_results ADD PRIMARY KEY (session_id, search_type)');

        // bb_sessions
        $this->addSql('DROP INDEX session_user_id ON bb_sessions');
        $this->addSql('DROP INDEX session_id_ip_user_id ON bb_sessions');
        $this->addSql('DROP INDEX session_time ON bb_sessions');
        $this->addSql('ALTER TABLE bb_sessions
            DROP session_page,
            CHANGE session_id session_id CHAR(20) NOT NULL COLLATE utf8_bin,
            CHANGE session_ip session_ip VARCHAR(42) DEFAULT \'0\' NOT NULL COLLATE utf8_bin,
            ENGINE=InnoDB ROW_FORMAT=DEFAULT');

        // bb_smilies
        $this->addSql('ALTER TABLE bb_smilies
            CHANGE code code VARCHAR(50) DEFAULT \'\' NOT NULL,
            CHANGE smile_url smile_url VARCHAR(100) DEFAULT \'\' NOT NULL,
            CHANGE emoticon emoticon VARCHAR(75) DEFAULT \'\' NOT NULL,
            ENGINE = InnoDB');

        // bb_topics
        $this->addSql('DROP INDEX topic_cache_lock ON bb_topics');
        $this->addSql('ALTER TABLE bb_topics
            ADD topic_last_post_time INT DEFAULT 0 NOT NULL,
            DROP topic_dl_status,
            DROP topic_type_gold,
            DROP call_seed_time,
            DROP topic_cache_lock,
            CHANGE topic_title topic_title VARCHAR(250) DEFAULT \'\' NOT NULL,
            CHANGE topic_show_first_post topic_show_first_post TINYINT(1) DEFAULT \'0\' NOT NULL,
            ENGINE = InnoDB');
        $this->addSql('CREATE INDEX topic_last_post_time ON bb_topics (topic_last_post_time)');
        $this->addSql('CREATE FULLTEXT INDEX topic_title ON bb_topics (topic_title)');

        // bb_topics_watch
        $this->addSql('DROP INDEX topic_id ON bb_topics_watch');
        $this->addSql('ALTER TABLE bb_topics_watch
            DROP PRIMARY KEY,
            ENGINE = InnoDB');
        $this->addSql('ALTER TABLE bb_topics_watch
            CHANGE user_id user_id INT NOT NULL,
            CHANGE topic_id topic_id INT UNSIGNED NOT NULL');
        $this->addSql('CREATE INDEX user_id ON bb_topics_watch (user_id)');
        $this->addSql('CREATE INDEX notify_status ON bb_topics_watch (notify_status)');
        $this->addSql('ALTER TABLE bb_topics_watch ADD PRIMARY KEY (topic_id, user_id)');

        // bb_user_group
        $this->addSql('DROP INDEX group_id ON bb_user_group');
        $this->addSql('ALTER TABLE bb_user_group
            ADD user_time INT DEFAULT 0 NOT NULL,
            CHANGE group_id group_id INT UNSIGNED NOT NULL,
            CHANGE user_id user_id INT NOT NULL,
            CHANGE user_pending user_pending TINYINT(1) DEFAULT \'0\' NOT NULL,
            CHANGE group_moderator group_moderator INT DEFAULT 0 NOT NULL,
            ADD PRIMARY KEY (group_id, user_id),
            ENGINE = InnoDB');

        // bb_users
        $this->addSql('DROP INDEX user_session_time ON bb_users');
        $this->addSql('ALTER TABLE bb_users
            CHANGE user_password2 user_password VARCHAR(60) NOT NULL COLLATE utf8_bin,
            ADD user_last_ip VARCHAR(42) DEFAULT \'0\' NOT NULL COLLATE utf8_bin,
            ADD user_reg_ip VARCHAR(42) DEFAULT \'0\' NOT NULL COLLATE utf8_bin,
            ADD user_opt INT DEFAULT 0 NOT NULL,
            ADD avatar_ext_id TINYINT(1) DEFAULT \'0\' NOT NULL,
            ADD user_gender TINYINT(1) DEFAULT \'0\' NOT NULL,
            ADD user_birthday DATE DEFAULT \'0000-00-00\' NOT NULL,
            ADD user_twitter VARCHAR(15) DEFAULT \'\' NOT NULL,
            ADD autologin_id VARCHAR(12) DEFAULT \'\' NOT NULL COLLATE utf8_bin,
            ADD user_newest_pm_id INT UNSIGNED DEFAULT 0 NOT NULL,
            ADD user_points DOUBLE PRECISION DEFAULT \'0.00\' NOT NULL,
            ADD tpl_name VARCHAR(255) DEFAULT \'default\' NOT NULL,
            DROP user_session_page,
            DROP user_style,
            DROP user_dateformat,
            DROP user_emailtime,
            DROP user_allowhtml,
            DROP user_allowbbcode,
            DROP user_allowsmile,
            DROP user_allowavatar,
            DROP user_allow_pm,
            DROP user_aim,
            DROP user_yim,
            DROP user_msnm,
            CHANGE user_id user_id INT AUTO_INCREMENT NOT NULL,
            CHANGE user_active user_active TINYINT(1) DEFAULT \'1\' NOT NULL,
            CHANGE username username VARCHAR(25) NOT NULL,
            CHANGE user_level user_level TINYINT(1) DEFAULT \'0\' NOT NULL,
            CHANGE user_lang user_lang VARCHAR(255) DEFAULT \'uk\' NOT NULL,
            CHANGE user_rank user_rank INT DEFAULT 0 NOT NULL,
            CHANGE user_email user_email VARCHAR(255) DEFAULT \'\' NOT NULL,
            CHANGE user_icq user_icq VARCHAR(15) DEFAULT \'\' NOT NULL,
            CHANGE user_website user_website VARCHAR(100) DEFAULT \'\' NOT NULL,
            CHANGE user_from user_from VARCHAR(100) DEFAULT \'\' NOT NULL,
            CHANGE user_sig user_sig TEXT NOT NULL,
            CHANGE user_occ user_occ VARCHAR(100) DEFAULT \'\' NOT NULL,
            CHANGE user_interests user_interests VARCHAR(255) DEFAULT \'\' NOT NULL,
            CHANGE user_actkey user_actkey VARCHAR(32) DEFAULT \'\' NOT NULL COLLATE utf8_bin,
            CHANGE user_newpasswd user_newpasswd VARCHAR(60) DEFAULT \'\' NOT NULL COLLATE utf8_bin,
            CHANGE user_skype user_skype VARCHAR(32) DEFAULT \'\' NOT NULL,
            ENGINE = InnoDB');

        /**
         * <bb_vote_(desc|results|voters)>
         * @see https://github.com/hurtom/toloka/issues/91
         */
        $this->addSql('
            INSERT INTO bb_poll_votes
                (topic_id, vote_id, vote_text, vote_result)
            SELECT
                vd.topic_id,
                0 AS vote_id,
                vd.vote_text,
                0 AS vote_result
            FROM bb_vote_desc vd
            UNION
            SELECT
                vd.topic_id,
                vr.vote_option_id AS vote_id,
                vr.vote_option_text AS vote_text,
                vr.vote_result
            FROM bb_vote_desc vd, bb_vote_results vr
            WHERE vr.vote_id = vd.vote_id
        ');
        $this->addSql('
            INSERT INTO bb_poll_users (topic_id, user_id, vote_ip, vote_dt)
            SELECT
                vd.topic_id,
                vv.vote_user_id AS user_id,
                CASE vv.vote_user_ip WHEN \'-\' THEN 0 WHEN \'\' THEN 0 WHEN NULL THEN 0 ELSE vv.vote_user_ip END AS user_ip,
                vv.vote_timestamp AS vote_dt
            FROM bb_vote_desc vd, bb_vote_voters vv
            WHERE vv.vote_id = vd.vote_id
        ');
        $this->addSql('DROP TABLE bb_vote_desc');
        $this->addSql('DROP TABLE bb_vote_results');
        $this->addSql('DROP TABLE bb_vote_voters');
        // </bb_vote_(desc|results|voters)>

        // bb_warnings*
        $this->addSql('ALTER TABLE bb_warnings
            CHANGE warning_type warning_type TINYINT(1) DEFAULT \'0\' NOT NULL,
            ENGINE = InnoDB');
        $this->addSql('ALTER TABLE bb_warnings_text
            CHANGE warning_id warning_id INT UNSIGNED NOT NULL,
            ENGINE = InnoDB');

        // bb_words
        $this->addSql('ALTER TABLE bb_words
            CHANGE word word CHAR(100) DEFAULT \'\' NOT NULL,
            ENGINE = InnoDB');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        $this->abortIf(true, 'We do not support downgrade, sorry.');
    }
}
