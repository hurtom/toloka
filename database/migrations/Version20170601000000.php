<?php

namespace Database\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema as Schema;

class Version20170601000000 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE bb_ads (ad_id INT UNSIGNED AUTO_INCREMENT NOT NULL, ad_block_ids VARCHAR(255) DEFAULT \'\' NOT NULL, ad_start_time DATETIME DEFAULT \'0000-00-00 00:00:00\' NOT NULL, ad_active_days SMALLINT DEFAULT 0 NOT NULL, ad_status TINYINT(1) DEFAULT \'1\' NOT NULL, ad_desc VARCHAR(255) DEFAULT \'\' NOT NULL, ad_html TEXT NOT NULL, PRIMARY KEY(ad_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE bb_auth_access_snap (user_id INT NOT NULL, forum_id SMALLINT UNSIGNED NOT NULL, forum_perm INT DEFAULT 0 NOT NULL, PRIMARY KEY(user_id, forum_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE bb_bt_dlstatus (user_id INT NOT NULL, topic_id INT UNSIGNED NOT NULL, user_status SMALLINT DEFAULT 0 NOT NULL, last_modified_dlstatus DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL, INDEX topic_id (topic_id), PRIMARY KEY(user_id, topic_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE bb_bt_dlstatus_snap (topic_id INT UNSIGNED NOT NULL, dl_status SMALLINT NOT NULL, users_count SMALLINT UNSIGNED DEFAULT 0 NOT NULL, PRIMARY KEY(topic_id, dl_status)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE bb_bt_last_torstat (topic_id INT UNSIGNED NOT NULL, user_id INT NOT NULL, dl_status TINYINT(1) DEFAULT \'0\' NOT NULL, up_add BIGINT UNSIGNED DEFAULT 0 NOT NULL, down_add BIGINT UNSIGNED DEFAULT 0 NOT NULL, release_add BIGINT UNSIGNED DEFAULT 0 NOT NULL, bonus_add BIGINT UNSIGNED DEFAULT 0 NOT NULL, speed_up BIGINT UNSIGNED DEFAULT 0 NOT NULL, speed_down BIGINT UNSIGNED DEFAULT 0 NOT NULL, PRIMARY KEY(topic_id, user_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE bb_bt_last_userstat (user_id INT NOT NULL, up_add BIGINT UNSIGNED DEFAULT 0 NOT NULL, down_add BIGINT UNSIGNED DEFAULT 0 NOT NULL, release_add BIGINT UNSIGNED DEFAULT 0 NOT NULL, bonus_add BIGINT UNSIGNED DEFAULT 0 NOT NULL, speed_up BIGINT UNSIGNED DEFAULT 0 NOT NULL, speed_down BIGINT UNSIGNED DEFAULT 0 NOT NULL, PRIMARY KEY(user_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE bb_bt_torhelp (user_id INT NOT NULL, topic_id_csv TEXT NOT NULL, PRIMARY KEY(user_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');

        $this->addSql('CREATE TABLE bb_bt_torstat (topic_id INT UNSIGNED NOT NULL, user_id INT NOT NULL, last_modified_torstat DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL, completed TINYINT(1) DEFAULT \'0\' NOT NULL, PRIMARY KEY(topic_id, user_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');

        $this->addSql('CREATE TABLE bb_bt_tracker_snap (topic_id INT UNSIGNED NOT NULL, seeders INT UNSIGNED DEFAULT 0 NOT NULL, leechers INT UNSIGNED DEFAULT 0 NOT NULL, speed_up BIGINT UNSIGNED DEFAULT 0 NOT NULL, speed_down BIGINT UNSIGNED DEFAULT 0 NOT NULL, PRIMARY KEY(topic_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB ROW_FORMAT=DEFAULT');

        $this->addSql('CREATE TABLE bb_bt_user_settings (user_id INT NOT NULL, tor_search_set TEXT NOT NULL, last_modified INT DEFAULT 0 NOT NULL, PRIMARY KEY(user_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');

        $this->addSql('CREATE TABLE bb_cron (cron_id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL, cron_active TINYINT(1) DEFAULT \'1\' NOT NULL, cron_title CHAR(120) DEFAULT \'\' NOT NULL, cron_script CHAR(120) DEFAULT \'\' NOT NULL, schedule ENUM(\'hourly\',\'daily\',\'weekly\',\'monthly\',\'interval\') DEFAULT \'daily\' NOT NULL COMMENT \'(DC2Type:enumcronschedule)\', run_day ENUM(\'1\',\'2\',\'3\',\'4\',\'5\',\'6\',\'7\',\'8\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'24\',\'25\',\'26\',\'27\',\'28\') DEFAULT NULL COMMENT \'(DC2Type:enumcronrunday)\', run_time TIME DEFAULT \'04:00:00\', run_order SMALLINT UNSIGNED DEFAULT 0 NOT NULL, last_run DATETIME DEFAULT \'0000-00-00 00:00:00\' NOT NULL, next_run DATETIME DEFAULT \'0000-00-00 00:00:00\' NOT NULL, run_interval TIME DEFAULT \'00:00:00\', log_enabled TINYINT(1) DEFAULT \'0\' NOT NULL, log_file CHAR(120) DEFAULT \'\' NOT NULL, log_sql_queries TINYINT(1) DEFAULT \'0\' NOT NULL, disable_board TINYINT(1) DEFAULT \'0\' NOT NULL, run_counter BIGINT UNSIGNED DEFAULT 0 NOT NULL, UNIQUE INDEX title (cron_title), UNIQUE INDEX script (cron_script), PRIMARY KEY(cron_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE bb_log (id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL, log_type_id INT UNSIGNED DEFAULT 0 NOT NULL, log_user_id INT DEFAULT 0 NOT NULL, log_username VARCHAR(25) DEFAULT \'\' NOT NULL, log_user_ip VARCHAR(42) DEFAULT \'0\' NOT NULL COLLATE utf8mb4_bin, log_forum_id SMALLINT UNSIGNED DEFAULT 0 NOT NULL, log_forum_id_new SMALLINT UNSIGNED DEFAULT 0 NOT NULL, log_topic_id INT UNSIGNED DEFAULT 0 NOT NULL, log_topic_id_new INT UNSIGNED DEFAULT 0 NOT NULL, log_topic_title VARCHAR(250) DEFAULT \'\' NOT NULL, log_topic_title_new VARCHAR(250) DEFAULT \'\' NOT NULL, log_time INT DEFAULT 0 NOT NULL, log_msg TEXT NOT NULL, INDEX log_time (log_time), FULLTEXT INDEX log_topic_title (log_topic_title), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE bb_poll_users (topic_id INT UNSIGNED NOT NULL, user_id INT NOT NULL, vote_ip VARCHAR(42) DEFAULT \'0\' NOT NULL COLLATE utf8mb4_bin, vote_dt INT DEFAULT 0 NOT NULL, PRIMARY KEY(topic_id, user_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE bb_poll_votes (topic_id INT UNSIGNED NOT NULL, vote_id TINYINT(1) NOT NULL, vote_text VARCHAR(255) NOT NULL, vote_result INT UNSIGNED NOT NULL, PRIMARY KEY(topic_id, vote_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE bb_posts_html (post_id INT UNSIGNED NOT NULL, post_html_time DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL, post_html MEDIUMTEXT NOT NULL, PRIMARY KEY(post_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE bb_posts_search (post_id INT UNSIGNED NOT NULL, search_words TEXT NOT NULL, FULLTEXT INDEX search_words (search_words), PRIMARY KEY(post_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE bb_search_rebuild (rebuild_session_id INT UNSIGNED AUTO_INCREMENT NOT NULL, start_post_id INT UNSIGNED DEFAULT 0 NOT NULL, end_post_id INT UNSIGNED DEFAULT 0 NOT NULL, start_time INT DEFAULT 0 NOT NULL, end_time INT DEFAULT 0 NOT NULL, last_cycle_time INT DEFAULT 0 NOT NULL, session_time INT DEFAULT 0 NOT NULL, session_posts INT UNSIGNED DEFAULT 0 NOT NULL, session_cycles INT UNSIGNED DEFAULT 0 NOT NULL, search_size INT UNSIGNED DEFAULT 0 NOT NULL, rebuild_session_status TINYINT(1) DEFAULT \'0\' NOT NULL, PRIMARY KEY(rebuild_session_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE bb_topic_tpl (tpl_id SMALLINT AUTO_INCREMENT NOT NULL, tpl_name VARCHAR(60) DEFAULT \'\' NOT NULL, tpl_src_form TEXT NOT NULL, tpl_src_title TEXT NOT NULL, tpl_src_msg TEXT NOT NULL, tpl_comment TEXT NOT NULL, tpl_rules_post_id INT UNSIGNED DEFAULT 0 NOT NULL, tpl_last_edit_tm INT DEFAULT 0 NOT NULL, tpl_last_edit_by INT DEFAULT 0 NOT NULL, UNIQUE INDEX tpl_name (tpl_name), PRIMARY KEY(tpl_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE buf_last_seeder (topic_id INT UNSIGNED NOT NULL, seeder_last_seen INT DEFAULT 0 NOT NULL, PRIMARY KEY(topic_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE buf_topic_view (topic_id INT UNSIGNED NOT NULL, topic_views INT UNSIGNED DEFAULT 0 NOT NULL, PRIMARY KEY(topic_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');

        $this->addSql('DROP TABLE bb_bt_users_dl_status');
        $this->addSql('DROP TABLE bb_confirm');
        $this->addSql('DROP TABLE bb_easymod');
        $this->addSql('DROP TABLE bb_easymod_processed_files');
        $this->addSql('DROP TABLE bb_forum_prune');
        $this->addSql('DROP TABLE bb_sessions_keys');
        $this->addSql('DROP TABLE bb_themes');
        $this->addSql('DROP TABLE bb_themes_name');

        $this->addSql('DROP INDEX attach_id_post_id ON bb_attachments');
        $this->addSql('DROP INDEX post_id ON bb_attachments');
        $this->addSql('ALTER TABLE bb_attachments CHANGE attach_id attach_id INT UNSIGNED NOT NULL, CHANGE post_id post_id INT UNSIGNED NOT NULL, ADD PRIMARY KEY (attach_id, post_id), ENGINE=InnoDB');

        $this->addSql('ALTER TABLE bb_attachments_config CHANGE config_name config_name VARCHAR(255) NOT NULL, ENGINE=InnoDB');

        $this->addSql('ALTER TABLE bb_attachments_desc CHANGE real_filename real_filename VARCHAR(255) DEFAULT \'\' NOT NULL, CHANGE comment comment VARCHAR(255) DEFAULT \'\' NOT NULL, CHANGE extension extension VARCHAR(100) DEFAULT \'\' NOT NULL, CHANGE mimetype mimetype VARCHAR(100) DEFAULT \'\' NOT NULL, ENGINE=InnoDB');

        $this->addSql('ALTER TABLE bb_attachments_rating CHANGE attach_id attach_id INT UNSIGNED NOT NULL, CHANGE user_id user_id INT NOT NULL, ENGINE=InnoDB');

        $this->addSql('ALTER TABLE bb_attach_quota CHANGE user_id user_id INT DEFAULT 0 NOT NULL, CHANGE quota_limit_id quota_limit_id INT UNSIGNED NOT NULL, ADD PRIMARY KEY (quota_limit_id), ENGINE=InnoDB');

        $this->addSql('DROP INDEX group_id ON bb_auth_access');
        $this->addSql('ALTER TABLE bb_auth_access ADD forum_perm INT DEFAULT 0 NOT NULL, DROP auth_view, DROP auth_read, DROP auth_post, DROP auth_reply, DROP auth_edit, DROP auth_delete, DROP auth_sticky, DROP auth_announce, DROP auth_vote, DROP auth_pollcreate, DROP auth_attachments, DROP auth_mod, DROP auth_download, CHANGE group_id group_id INT UNSIGNED DEFAULT 0 NOT NULL, ADD PRIMARY KEY (group_id, forum_id), ENGINE=InnoDB');

        $this->addSql('ALTER TABLE bb_banlist CHANGE ban_ip ban_ip VARCHAR(42) DEFAULT \'0\' NOT NULL COLLATE utf8mb4_bin, CHANGE ban_email ban_email VARCHAR(255) DEFAULT \'\' NOT NULL, ENGINE=InnoDB');

        $this->addSql('ALTER TABLE bb_bt_config CHANGE config_name config_name VARCHAR(255) NOT NULL, ENGINE=InnoDB');

        $this->addSql('ALTER TABLE bb_bt_search_results CHANGE session_id session_id VARCHAR(32) NOT NULL COLLATE utf8mb4_bin, ENGINE=InnoDB');

        $this->addSql('ALTER TABLE bb_bt_tor_dl_stat DROP PRIMARY KEY, ENGINE=InnoDB ROW_FORMAT=DEFAULT');
        $this->addSql('ALTER TABLE bb_bt_tor_dl_stat ADD topic_id INT UNSIGNED NOT NULL, DROP torrent_id, CHANGE user_id user_id INT NOT NULL');
        $this->addSql('ALTER TABLE bb_bt_tor_dl_stat ADD PRIMARY KEY (topic_id, user_id)');

        $this->addSql('ALTER TABLE bb_bt_torrents MODIFY torrent_id INT UNSIGNED NOT NULL, ENGINE=InnoDB');
        $this->addSql('DROP INDEX info_hash ON bb_bt_torrents');
        $this->addSql('ALTER TABLE bb_bt_torrents DROP PRIMARY KEY, ENGINE=InnoDB');
        $this->addSql('DROP INDEX topic_check_uid ON bb_bt_torrents');
        $this->addSql('ALTER TABLE bb_bt_torrents ADD forum_id SMALLINT UNSIGNED DEFAULT 0 NOT NULL, ADD call_seed_time INT DEFAULT 0 NOT NULL, ADD tor_status TINYINT(1) DEFAULT \'0\' NOT NULL, ADD checked_user_id INT DEFAULT 0 NOT NULL, ADD checked_time INT DEFAULT 0 NOT NULL, ADD tor_type SMALLINT UNSIGNED DEFAULT 0 NOT NULL, ADD speed_up BIGINT UNSIGNED DEFAULT 0 NOT NULL, ADD speed_down BIGINT UNSIGNED DEFAULT 0 NOT NULL, ADD topic_check_double_tid INT UNSIGNED DEFAULT 0 NOT NULL, DROP torrent_id, DROP piece_length, DROP last_seeder_uid, DROP topic_check_status, DROP topic_check_uid, DROP topic_check_date, DROP topic_check_duble_tid, DROP leechers, DROP seeders, DROP speed_ul, DROP speed_dl, CHANGE info_hash info_hash VARBINARY(255) NOT NULL, CHANGE topic_check_first_fid topic_check_first_fid SMALLINT UNSIGNED DEFAULT 0 NOT NULL');
        $this->addSql('CREATE INDEX forum_id ON bb_bt_torrents (forum_id)');
        $this->addSql('ALTER TABLE bb_bt_torrents ADD PRIMARY KEY (info_hash)');
        $this->addSql('CREATE INDEX topic_check_uid ON bb_bt_torrents (checked_user_id)');

        $this->addSql('ALTER TABLE bb_bt_torrents_del CHANGE torrent_id torrent_id INT UNSIGNED AUTO_INCREMENT NOT NULL, CHANGE info_hash info_hash VARBINARY(255) DEFAULT \'' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '\' NOT NULL, ENGINE=InnoDB');

        $this->addSql('DROP INDEX torrent_peer_id ON bb_bt_tracker');
        $this->addSql('ALTER TABLE bb_bt_tracker ADD peer_hash VARCHAR(32) NOT NULL COLLATE utf8mb4_bin, ADD client VARCHAR(51) DEFAULT \'Unknown\' NOT NULL, ADD releaser TINYINT(1) DEFAULT \'0\' NOT NULL, ADD tor_type SMALLINT UNSIGNED DEFAULT 0 NOT NULL, ADD remain BIGINT UNSIGNED DEFAULT 0 NOT NULL, ADD up_add BIGINT UNSIGNED DEFAULT 0 NOT NULL, ADD down_add BIGINT UNSIGNED DEFAULT 0 NOT NULL, ADD complete INT DEFAULT 0 NOT NULL, DROP last_stored_up, DROP last_stored_down, DROP stat_last_updated, DROP expire_time, CHANGE peer_id peer_id VARCHAR(20) DEFAULT \'0\' NOT NULL, CHANGE ip ip VARCHAR(42) DEFAULT \'0\' NOT NULL COLLATE utf8mb4_bin, CHANGE complete_percent complete_percent BIGINT DEFAULT 0 NOT NULL, CHANGE speed_up speed_up BIGINT UNSIGNED DEFAULT 0 NOT NULL, CHANGE speed_down speed_down BIGINT UNSIGNED DEFAULT 0 NOT NULL, CHANGE torrent_id topic_id INT UNSIGNED DEFAULT 0 NOT NULL, ADD PRIMARY KEY (peer_hash), ENGINE=InnoDB');
        // index creation delayed after CHARSET converion time
        // $this->addSql('CREATE INDEX topic_id ON bb_bt_tracker (topic_id)');
        // $this->addSql('CREATE UNIQUE INDEX torrent_peer_id ON bb_bt_tracker (peer_id)');

        $this->addSql('ALTER TABLE bb_bt_users ADD u_up_release BIGINT UNSIGNED DEFAULT 0 NOT NULL, ADD u_up_bonus BIGINT UNSIGNED DEFAULT 0 NOT NULL, ADD up_today BIGINT UNSIGNED DEFAULT 0 NOT NULL, ADD down_today BIGINT UNSIGNED DEFAULT 0 NOT NULL, ADD up_release_today BIGINT UNSIGNED DEFAULT 0 NOT NULL, ADD up_bonus_today BIGINT UNSIGNED DEFAULT 0 NOT NULL, ADD points_today DOUBLE PRECISION DEFAULT \'0.00\' NOT NULL, ADD up_yesterday BIGINT UNSIGNED DEFAULT 0 NOT NULL, ADD down_yesterday BIGINT UNSIGNED DEFAULT 0 NOT NULL, ADD up_release_yesterday BIGINT UNSIGNED DEFAULT 0 NOT NULL, ADD up_bonus_yesterday BIGINT UNSIGNED DEFAULT 0 NOT NULL, ADD points_yesterday DOUBLE PRECISION DEFAULT \'0.00\' NOT NULL, DROP u_bonus_total, DROP u_bonus_today, DROP u_bonus_hourly, DROP u_down_today, DROP u_up_today, DROP u_bonus_yday, DROP u_down_yday, DROP u_up_yday, DROP max_up_speed, DROP max_down_speed, DROP ratio_nulled, DROP u_up_old, DROP u_down_old, DROP u_bonus_old, DROP max_up_speed_old, DROP u_releases, DROP can_leech, CHANGE user_id user_id INT AUTO_INCREMENT NOT NULL, CHANGE auth_key auth_key CHAR(10) DEFAULT \'\' NOT NULL COLLATE utf8mb4_bin, ENGINE=InnoDB ROW_FORMAT=DEFAULT');

        $this->addSql('ALTER TABLE bb_categories DROP cat_title_short, DROP cat_title_hashtag, DROP cat_url, DROP cat_desc, CHANGE cat_title cat_title VARCHAR(100) DEFAULT \'\' NOT NULL, CHANGE cat_order cat_order SMALLINT UNSIGNED DEFAULT 0 NOT NULL, ENGINE=InnoDB');

        $this->addSql('ALTER TABLE bb_config CHANGE config_name config_name VARCHAR(255) NOT NULL, CHANGE config_value config_value TEXT NOT NULL, ENGINE=InnoDB');

        $this->addSql('ALTER TABLE bb_extension_groups CHANGE group_id group_id INT UNSIGNED AUTO_INCREMENT NOT NULL, CHANGE cat_id cat_id INT UNSIGNED DEFAULT 0 NOT NULL, CHANGE download_mode download_mode SMALLINT UNSIGNED DEFAULT 1 NOT NULL, CHANGE upload_icon upload_icon VARCHAR(100) DEFAULT \'\' NOT NULL, CHANGE forum_permissions forum_permissions TEXT NOT NULL, ENGINE=InnoDB');

        $this->addSql('ALTER TABLE bb_extensions CHANGE comment comment VARCHAR(100) DEFAULT \'\' NOT NULL, ENGINE=InnoDB');

        $this->addSql('ALTER TABLE bb_flags CHANGE flag_id flag_id INT UNSIGNED AUTO_INCREMENT NOT NULL, ENGINE=InnoDB');

        $this->addSql('ALTER TABLE bb_forbidden_extensions CHANGE ext_id ext_id INT UNSIGNED NOT NULL, ENGINE=InnoDB');

        $this->addSql('ALTER TABLE bb_forums ADD forum_tpl_id SMALLINT DEFAULT 0 NOT NULL, ADD prune_days SMALLINT UNSIGNED DEFAULT 0 NOT NULL, ADD allow_porno_topic TINYINT(1) DEFAULT \'0\' NOT NULL, DROP prune_next, DROP prune_enable, DROP allow_dl_topic, DROP dl_type_default, DROP last_dl_topics_synch, DROP show_dl_buttons, DROP move_next, DROP recycle_move_next, DROP move_enable, CHANGE forum_id forum_id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL, CHANGE forum_name forum_name VARCHAR(150) DEFAULT \'\' NOT NULL, CHANGE forum_desc forum_desc TEXT NOT NULL, CHANGE forum_order forum_order SMALLINT UNSIGNED DEFAULT 1 NOT NULL, CHANGE forum_parent forum_parent SMALLINT UNSIGNED DEFAULT 0 NOT NULL, ENGINE=InnoDB');

        $this->addSql('ALTER TABLE bb_groups ADD group_time INT DEFAULT 0 NOT NULL, ADD mod_time INT DEFAULT 0 NOT NULL, ADD release_group TINYINT(1) DEFAULT \'0\' NOT NULL, ADD group_signature TEXT NOT NULL, CHANGE group_id group_id INT UNSIGNED AUTO_INCREMENT NOT NULL, CHANGE group_name group_name VARCHAR(40) DEFAULT \'\' NOT NULL, CHANGE group_description group_description TEXT NOT NULL, CHANGE group_order avatar_ext_id INT DEFAULT 0 NOT NULL, ENGINE=InnoDB');

        $this->addSql('ALTER TABLE bb_posts ADD poster_rg_id INT DEFAULT 0 NOT NULL, ADD attach_rg_sig TINYINT(1) DEFAULT \'0\' NOT NULL, ADD user_post TINYINT(1) DEFAULT \'1\' NOT NULL, ADD mc_comment TEXT DEFAULT NULL, ADD mc_type TINYINT(1) DEFAULT \'0\' NOT NULL, ADD mc_user_id INT DEFAULT 0 NOT NULL, DROP enable_bbcode, DROP enable_html, DROP enable_smilies, DROP enable_sig, DROP parsed, DROP dont_cache, DROP cache_file_md5, CHANGE poster_ip poster_ip VARCHAR(42) DEFAULT \'0\' NOT NULL COLLATE utf8mb4_bin, CHANGE post_username post_username VARCHAR(25) DEFAULT \'\' NOT NULL, CHANGE post_edit_time post_edit_time INT DEFAULT 0 NOT NULL, ENGINE=InnoDB');
        $this->addSql('CREATE INDEX topic_id ON bb_posts (topic_id)');
        $this->addSql('CREATE INDEX forum_id_post_time ON bb_posts (forum_id, post_time)');

        $this->addSql('ALTER TABLE bb_posts_edit CHANGE post_id post_id INT UNSIGNED NOT NULL, ADD PRIMARY KEY (post_id), ENGINE=InnoDB');

        $this->addSql('ALTER TABLE bb_posts_text DROP bbcode_uid, DROP post_subject, CHANGE post_id post_id INT UNSIGNED NOT NULL, CHANGE post_text post_text TEXT NOT NULL, ENGINE=InnoDB');

        $this->addSql('ALTER TABLE bb_privmsgs DROP privmsgs_enable_bbcode, DROP privmsgs_enable_html, DROP privmsgs_enable_smilies, DROP privmsgs_attach_sig, DROP privmsgs_attachment, CHANGE privmsgs_subject privmsgs_subject VARCHAR(255) DEFAULT \'0\' NOT NULL, CHANGE privmsgs_ip privmsgs_ip VARCHAR(42) DEFAULT \'0\' NOT NULL COLLATE utf8mb4_bin, ENGINE=InnoDB');

        $this->addSql('ALTER TABLE bb_privmsgs_text DROP privmsgs_bbcode_uid, CHANGE privmsgs_text_id privmsgs_text_id INT UNSIGNED NOT NULL, CHANGE privmsgs_text privmsgs_text TEXT NOT NULL, ENGINE=InnoDB');

        $this->addSql('ALTER TABLE bb_ranks ADD rank_style VARCHAR(255) DEFAULT \'\' NOT NULL, DROP rank_min, DROP rank_special, CHANGE rank_title rank_title VARCHAR(50) DEFAULT \'\' NOT NULL, CHANGE rank_image rank_image VARCHAR(255) DEFAULT \'\' NOT NULL, CHANGE rank_group rank_group INT UNSIGNED NOT NULL, ENGINE=InnoDB');

        $this->addSql('DROP INDEX session_id ON bb_search_results');
        $this->addSql('ALTER TABLE bb_search_results DROP PRIMARY KEY, ENGINE=InnoDB');
        $this->addSql('ALTER TABLE bb_search_results ADD search_type TINYINT(1) DEFAULT \'0\' NOT NULL, ADD search_time INT DEFAULT 0 NOT NULL, ADD search_settings TEXT NOT NULL, CHANGE search_id search_id VARCHAR(12) NOT NULL COLLATE utf8mb4_bin, CHANGE session_id session_id CHAR(20) NOT NULL COLLATE utf8mb4_bin');
        // delay index building after changing CHARSET (due it is done via BLOB and back)
        // $this->addSql('CREATE INDEX search_id ON bb_search_results (search_id)');
        // $this->addSql('ALTER TABLE bb_search_results ADD PRIMARY KEY (session_id, search_type)');

        $this->addSql('ALTER TABLE bb_search_wordlist CHANGE word_text word_text VARCHAR(50) NOT NULL, CHANGE word_id word_id INT UNSIGNED NOT NULL, CHANGE word_common word_common TINYINT(1) DEFAULT \'0\' NOT NULL, ENGINE=InnoDB');

        $this->addSql('ALTER TABLE bb_search_wordmatch CHANGE post_id post_id INT UNSIGNED NOT NULL, CHANGE word_id word_id INT UNSIGNED NOT NULL, ADD PRIMARY KEY (post_id, word_id), ENGINE=InnoDB');

        $this->addSql('DROP INDEX session_user_id ON bb_sessions');
        $this->addSql('DROP INDEX session_id_ip_user_id ON bb_sessions');
        $this->addSql('DROP INDEX session_time ON bb_sessions');
        $this->addSql('ALTER TABLE bb_sessions DROP session_page, CHANGE session_id session_id CHAR(20) NOT NULL COLLATE utf8mb4_bin, CHANGE session_ip session_ip VARCHAR(42) DEFAULT \'0\' NOT NULL COLLATE utf8mb4_bin, ENGINE=InnoDB ROW_FORMAT=DEFAULT');

        $this->addSql('ALTER TABLE bb_smilies CHANGE code code VARCHAR(50) DEFAULT \'\' NOT NULL, CHANGE smile_url smile_url VARCHAR(100) DEFAULT \'\' NOT NULL, CHANGE emoticon emoticon VARCHAR(75) DEFAULT \'\' NOT NULL');

        $this->addSql('DROP INDEX topic_cache_lock ON bb_topics');
        $this->addSql('ALTER TABLE bb_topics ADD topic_last_post_time INT DEFAULT 0 NOT NULL, DROP topic_dl_status, DROP topic_type_gold, DROP call_seed_time, DROP topic_cache_lock, CHANGE topic_title topic_title VARCHAR(250) DEFAULT \'\' NOT NULL, CHANGE topic_show_first_post topic_show_first_post TINYINT(1) DEFAULT \'0\' NOT NULL, ENGINE=InnoDB');
        $this->addSql('CREATE INDEX topic_last_post_time ON bb_topics (topic_last_post_time)');
        $this->addSql('CREATE FULLTEXT INDEX topic_title ON bb_topics (topic_title)');

        $this->addSql('DROP INDEX topic_id ON bb_topics_watch');
        $this->addSql('ALTER TABLE bb_topics_watch DROP PRIMARY KEY, ENGINE=InnoDB');
        $this->addSql('ALTER TABLE bb_topics_watch CHANGE user_id user_id INT NOT NULL, CHANGE topic_id topic_id INT UNSIGNED NOT NULL');
        $this->addSql('CREATE INDEX user_id ON bb_topics_watch (user_id)');
        $this->addSql('CREATE INDEX notify_status ON bb_topics_watch (notify_status)');
        $this->addSql('ALTER TABLE bb_topics_watch ADD PRIMARY KEY (topic_id, user_id)');

        $this->addSql('DROP INDEX group_id ON bb_user_group');
        $this->addSql('ALTER TABLE bb_user_group ADD user_time INT DEFAULT 0 NOT NULL, CHANGE group_id group_id INT UNSIGNED NOT NULL, CHANGE user_id user_id INT NOT NULL, CHANGE user_pending user_pending TINYINT(1) DEFAULT \'0\' NOT NULL, CHANGE group_moderator group_moderator INT DEFAULT 0 NOT NULL, ADD PRIMARY KEY (group_id, user_id), ENGINE=InnoDB');

        $this->addSql('DROP INDEX user_session_time ON bb_users');
        $this->addSql('ALTER TABLE bb_users ADD user_password VARCHAR(60) NOT NULL COLLATE utf8mb4_bin, ADD user_last_ip VARCHAR(42) DEFAULT \'0\' NOT NULL COLLATE utf8mb4_bin, ADD user_reg_ip VARCHAR(42) DEFAULT \'0\' NOT NULL COLLATE utf8mb4_bin, ADD user_opt INT DEFAULT 0 NOT NULL, ADD avatar_ext_id TINYINT(1) DEFAULT \'0\' NOT NULL, ADD user_gender TINYINT(1) DEFAULT \'0\' NOT NULL, ADD user_birthday DATE DEFAULT \'0000-00-00\' NOT NULL, ADD user_twitter VARCHAR(15) DEFAULT \'\' NOT NULL, ADD autologin_id VARCHAR(12) DEFAULT \'\' NOT NULL COLLATE utf8mb4_bin, ADD user_newest_pm_id INT UNSIGNED DEFAULT 0 NOT NULL, ADD user_points DOUBLE PRECISION DEFAULT \'0.00\' NOT NULL, ADD tpl_name VARCHAR(255) DEFAULT \'default\' NOT NULL, DROP user_password2, DROP user_session_page, DROP user_style, DROP user_dateformat, DROP user_emailtime, DROP user_allowhtml, DROP user_allowbbcode, DROP user_allowsmile, DROP user_allowavatar, DROP user_allow_pm, DROP user_aim, DROP user_yim, DROP user_msnm, CHANGE user_id user_id INT AUTO_INCREMENT NOT NULL, CHANGE user_active user_active TINYINT(1) DEFAULT \'1\' NOT NULL, CHANGE username username VARCHAR(25) NOT NULL, CHANGE user_level user_level TINYINT(1) DEFAULT \'0\' NOT NULL, CHANGE user_lang user_lang VARCHAR(255) DEFAULT \'uk\' NOT NULL, CHANGE user_rank user_rank INT DEFAULT 0 NOT NULL, CHANGE user_email user_email VARCHAR(255) DEFAULT \'\' NOT NULL, CHANGE user_icq user_icq VARCHAR(15) DEFAULT \'\' NOT NULL, CHANGE user_website user_website VARCHAR(100) DEFAULT \'\' NOT NULL, CHANGE user_from user_from VARCHAR(100) DEFAULT \'\' NOT NULL, CHANGE user_sig user_sig TEXT NOT NULL, CHANGE user_occ user_occ VARCHAR(100) DEFAULT \'\' NOT NULL, CHANGE user_interests user_interests VARCHAR(255) DEFAULT \'\' NOT NULL, CHANGE user_actkey user_actkey VARCHAR(32) DEFAULT \'\' NOT NULL COLLATE utf8mb4_bin, CHANGE user_newpasswd user_newpasswd VARCHAR(60) DEFAULT \'\' NOT NULL COLLATE utf8mb4_bin, CHANGE user_skype user_skype VARCHAR(32) DEFAULT \'\' NOT NULL, ENGINE=InnoDB');

        $this->addSql('ALTER TABLE bb_vote_results CHANGE vote_id vote_id INT UNSIGNED AUTO_INCREMENT NOT NULL, CHANGE vote_option_id vote_option_id TINYINT(1) DEFAULT \'0\' NOT NULL, ADD PRIMARY KEY (vote_id), ENGINE=InnoDB');

        $this->addSql('DROP INDEX vote_id ON bb_vote_voters');
        $this->addSql('ALTER TABLE bb_vote_voters CHANGE vote_id vote_id INT UNSIGNED NOT NULL, CHANGE vote_user_id vote_user_id INT NOT NULL, CHANGE vote_user_ip vote_user_ip VARCHAR(42) DEFAULT \'0\' NOT NULL COLLATE utf8mb4_bin, ADD PRIMARY KEY (vote_id, vote_user_id), ENGINE=InnoDB');

        $this->addSql('ALTER TABLE bb_warnings CHANGE warning_type warning_type TINYINT(1) DEFAULT \'0\' NOT NULL, ENGINE=InnoDB');
        $this->addSql('ALTER TABLE bb_warnings_text CHANGE warning_id warning_id INT UNSIGNED NOT NULL, ENGINE=InnoDB');
        $this->addSql('ALTER TABLE bb_words CHANGE word word CHAR(100) DEFAULT \'\' NOT NULL, ENGINE=InnoDB');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE bb_bt_users_dl_status (topic_id INT UNSIGNED DEFAULT 0 NOT NULL, user_id INT DEFAULT 0 NOT NULL, user_status TINYINT(1) DEFAULT \'0\' NOT NULL, compl_count TINYINT(1) DEFAULT \'0\' NOT NULL, update_time INT DEFAULT 0 NOT NULL, drop_release TINYINT(1) DEFAULT \'0\' NOT NULL, PRIMARY KEY(topic_id, user_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE bb_confirm (session_id CHAR(32) DEFAULT \'\' NOT NULL COLLATE utf8_general_ci, confirm_id CHAR(32) DEFAULT \'\' NOT NULL COLLATE utf8_general_ci, code CHAR(10) NOT NULL COLLATE utf8_general_ci, PRIMARY KEY(session_id, confirm_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE bb_easymod (mod_id INT AUTO_INCREMENT NOT NULL, mod_title VARCHAR(255) DEFAULT \'\' COLLATE cp1251_general_ci, mod_file VARCHAR(255) DEFAULT \'\' COLLATE cp1251_general_ci, mod_version VARCHAR(15) DEFAULT \'\' COLLATE cp1251_general_ci, mod_author_handle VARCHAR(25) DEFAULT \'\' COLLATE cp1251_general_ci, mod_author_email VARCHAR(100) DEFAULT \'\' COLLATE cp1251_general_ci, mod_author_name VARCHAR(100) DEFAULT \'\' COLLATE cp1251_general_ci, mod_author_url VARCHAR(100) DEFAULT \'\' COLLATE cp1251_general_ci, mod_description TEXT DEFAULT NULL COLLATE cp1251_general_ci, mod_process_date INT DEFAULT 0, mod_phpBB_version VARCHAR(15) DEFAULT \'\' COLLATE cp1251_general_ci, mod_processed_themes VARCHAR(200) DEFAULT \'\' COLLATE cp1251_general_ci, mod_processed_langs VARCHAR(200) DEFAULT \'\' COLLATE cp1251_general_ci, mod_files_edited INT DEFAULT 0, mod_tables_added INT DEFAULT 0, mod_tables_altered INT DEFAULT 0, mod_rows_inserted INT DEFAULT 0, PRIMARY KEY(mod_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE bb_easymod_processed_files (mod_processed_file VARCHAR(255) DEFAULT \'\' NOT NULL COLLATE cp1251_general_ci, mod_id INT DEFAULT 0 NOT NULL, INDEX mod_processed_file (mod_processed_file), INDEX mod_id (mod_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE bb_forum_prune (prune_id INT UNSIGNED AUTO_INCREMENT NOT NULL, forum_id SMALLINT UNSIGNED DEFAULT 0 NOT NULL, prune_days SMALLINT UNSIGNED DEFAULT 0 NOT NULL, prune_freq SMALLINT UNSIGNED DEFAULT 0 NOT NULL, INDEX forum_id (forum_id), PRIMARY KEY(prune_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE bb_sessions_keys (key_id VARCHAR(32) DEFAULT \'0\' NOT NULL COLLATE utf8_general_ci, user_id INT DEFAULT 0 NOT NULL, last_ip VARCHAR(8) DEFAULT \'0\' NOT NULL COLLATE utf8_general_ci, last_login INT DEFAULT 0 NOT NULL, INDEX last_login (last_login), PRIMARY KEY(key_id, user_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE bb_themes (themes_id INT UNSIGNED AUTO_INCREMENT NOT NULL, template_name VARCHAR(30) DEFAULT \'\' NOT NULL COLLATE utf8_general_ci, style_name VARCHAR(30) DEFAULT \'\' NOT NULL COLLATE utf8_general_ci, head_stylesheet VARCHAR(100) DEFAULT NULL COLLATE utf8_general_ci, body_background VARCHAR(100) DEFAULT NULL COLLATE utf8_general_ci, body_bgcolor VARCHAR(6) DEFAULT NULL COLLATE utf8_general_ci, body_text VARCHAR(6) DEFAULT NULL COLLATE utf8_general_ci, body_link VARCHAR(6) DEFAULT NULL COLLATE utf8_general_ci, body_vlink VARCHAR(6) DEFAULT NULL COLLATE utf8_general_ci, body_alink VARCHAR(6) DEFAULT NULL COLLATE utf8_general_ci, body_hlink VARCHAR(6) DEFAULT NULL COLLATE utf8_general_ci, tr_color1 VARCHAR(6) DEFAULT NULL COLLATE utf8_general_ci, tr_color2 VARCHAR(6) DEFAULT NULL COLLATE utf8_general_ci, tr_color3 VARCHAR(6) DEFAULT NULL COLLATE utf8_general_ci, tr_class1 VARCHAR(25) DEFAULT NULL COLLATE utf8_general_ci, tr_class2 VARCHAR(25) DEFAULT NULL COLLATE utf8_general_ci, tr_class3 VARCHAR(25) DEFAULT NULL COLLATE utf8_general_ci, th_color1 VARCHAR(6) DEFAULT NULL COLLATE utf8_general_ci, th_color2 VARCHAR(6) DEFAULT NULL COLLATE utf8_general_ci, th_color3 VARCHAR(6) DEFAULT NULL COLLATE utf8_general_ci, th_class1 VARCHAR(25) DEFAULT NULL COLLATE utf8_general_ci, th_class2 VARCHAR(25) DEFAULT NULL COLLATE utf8_general_ci, th_class3 VARCHAR(25) DEFAULT NULL COLLATE utf8_general_ci, td_color1 VARCHAR(6) DEFAULT NULL COLLATE utf8_general_ci, td_color2 VARCHAR(6) DEFAULT NULL COLLATE utf8_general_ci, td_color3 VARCHAR(6) DEFAULT NULL COLLATE utf8_general_ci, td_class1 VARCHAR(25) DEFAULT NULL COLLATE utf8_general_ci, td_class2 VARCHAR(25) DEFAULT NULL COLLATE utf8_general_ci, td_class3 VARCHAR(25) DEFAULT NULL COLLATE utf8_general_ci, fontface1 VARCHAR(50) DEFAULT NULL COLLATE utf8_general_ci, fontface2 VARCHAR(50) DEFAULT NULL COLLATE utf8_general_ci, fontface3 VARCHAR(50) DEFAULT NULL COLLATE utf8_general_ci, fontsize1 TINYINT(1) DEFAULT NULL, fontsize2 TINYINT(1) DEFAULT NULL, fontsize3 TINYINT(1) DEFAULT NULL, fontcolor1 VARCHAR(6) DEFAULT NULL COLLATE utf8_general_ci, fontcolor2 VARCHAR(6) DEFAULT NULL COLLATE utf8_general_ci, fontcolor3 VARCHAR(6) DEFAULT NULL COLLATE utf8_general_ci, span_class1 VARCHAR(25) DEFAULT NULL COLLATE utf8_general_ci, span_class2 VARCHAR(25) DEFAULT NULL COLLATE utf8_general_ci, span_class3 VARCHAR(25) DEFAULT NULL COLLATE utf8_general_ci, img_size_poll SMALLINT UNSIGNED DEFAULT NULL, img_size_privmsg SMALLINT UNSIGNED DEFAULT NULL, PRIMARY KEY(themes_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE bb_themes_name (themes_id SMALLINT UNSIGNED DEFAULT 0 NOT NULL, tr_color1_name CHAR(50) DEFAULT NULL COLLATE utf8_general_ci, tr_color2_name CHAR(50) DEFAULT NULL COLLATE utf8_general_ci, tr_color3_name CHAR(50) DEFAULT NULL COLLATE utf8_general_ci, tr_class1_name CHAR(50) DEFAULT NULL COLLATE utf8_general_ci, tr_class2_name CHAR(50) DEFAULT NULL COLLATE utf8_general_ci, tr_class3_name CHAR(50) DEFAULT NULL COLLATE utf8_general_ci, th_color1_name CHAR(50) DEFAULT NULL COLLATE utf8_general_ci, th_color2_name CHAR(50) DEFAULT NULL COLLATE utf8_general_ci, th_color3_name CHAR(50) DEFAULT NULL COLLATE utf8_general_ci, th_class1_name CHAR(50) DEFAULT NULL COLLATE utf8_general_ci, th_class2_name CHAR(50) DEFAULT NULL COLLATE utf8_general_ci, th_class3_name CHAR(50) DEFAULT NULL COLLATE utf8_general_ci, td_color1_name CHAR(50) DEFAULT NULL COLLATE utf8_general_ci, td_color2_name CHAR(50) DEFAULT NULL COLLATE utf8_general_ci, td_color3_name CHAR(50) DEFAULT NULL COLLATE utf8_general_ci, td_class1_name CHAR(50) DEFAULT NULL COLLATE utf8_general_ci, td_class2_name CHAR(50) DEFAULT NULL COLLATE utf8_general_ci, td_class3_name CHAR(50) DEFAULT NULL COLLATE utf8_general_ci, fontface1_name CHAR(50) DEFAULT NULL COLLATE utf8_general_ci, fontface2_name CHAR(50) DEFAULT NULL COLLATE utf8_general_ci, fontface3_name CHAR(50) DEFAULT NULL COLLATE utf8_general_ci, fontsize1_name CHAR(50) DEFAULT NULL COLLATE utf8_general_ci, fontsize2_name CHAR(50) DEFAULT NULL COLLATE utf8_general_ci, fontsize3_name CHAR(50) DEFAULT NULL COLLATE utf8_general_ci, fontcolor1_name CHAR(50) DEFAULT NULL COLLATE utf8_general_ci, fontcolor2_name CHAR(50) DEFAULT NULL COLLATE utf8_general_ci, fontcolor3_name CHAR(50) DEFAULT NULL COLLATE utf8_general_ci, span_class1_name CHAR(50) DEFAULT NULL COLLATE utf8_general_ci, span_class2_name CHAR(50) DEFAULT NULL COLLATE utf8_general_ci, span_class3_name CHAR(50) DEFAULT NULL COLLATE utf8_general_ci, PRIMARY KEY(themes_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB');
        $this->addSql('DROP TABLE bb_ads');
        $this->addSql('DROP TABLE bb_auth_access_snap');
        $this->addSql('DROP TABLE bb_bt_dlstatus');
        $this->addSql('DROP TABLE bb_bt_dlstatus_snap');
        $this->addSql('DROP TABLE bb_bt_last_torstat');
        $this->addSql('DROP TABLE bb_bt_last_userstat');
        $this->addSql('DROP TABLE bb_bt_torhelp');
        $this->addSql('DROP TABLE bb_bt_torstat');
        $this->addSql('DROP TABLE bb_bt_tracker_snap');
        $this->addSql('DROP TABLE bb_bt_user_settings');
        $this->addSql('DROP TABLE bb_cron');
        $this->addSql('DROP TABLE bb_log');
        $this->addSql('DROP TABLE bb_poll_users');
        $this->addSql('DROP TABLE bb_poll_votes');
        $this->addSql('DROP TABLE bb_posts_html');
        $this->addSql('DROP TABLE bb_posts_search');
        $this->addSql('DROP TABLE bb_search_rebuild');
        $this->addSql('DROP TABLE bb_topic_tpl');
        $this->addSql('DROP TABLE buf_last_seeder');
        $this->addSql('DROP TABLE buf_topic_view');
        $this->addSql('ALTER TABLE bb_attach_quota DROP PRIMARY KEY');
        $this->addSql('ALTER TABLE bb_attach_quota CHANGE quota_limit_id quota_limit_id INT UNSIGNED DEFAULT 0 NOT NULL, CHANGE user_id user_id INT UNSIGNED DEFAULT 0 NOT NULL');
        $this->addSql('ALTER TABLE bb_attachments DROP INDEX primary, ADD INDEX attach_id_post_id (attach_id, post_id)');
        $this->addSql('ALTER TABLE bb_attachments CHANGE attach_id attach_id INT UNSIGNED DEFAULT 0 NOT NULL, CHANGE post_id post_id INT UNSIGNED DEFAULT 0 NOT NULL');
        $this->addSql('CREATE INDEX post_id ON bb_attachments (post_id)');
        $this->addSql('ALTER TABLE bb_attachments_config CHANGE config_name config_name VARCHAR(255) DEFAULT \'\' NOT NULL COLLATE utf8_general_ci');
        $this->addSql('ALTER TABLE bb_attachments_desc CHANGE real_filename real_filename VARCHAR(255) DEFAULT NULL COLLATE utf8_general_ci, CHANGE comment comment VARCHAR(255) DEFAULT NULL COLLATE utf8_general_ci, CHANGE extension extension VARCHAR(100) DEFAULT NULL COLLATE utf8_general_ci, CHANGE mimetype mimetype VARCHAR(100) DEFAULT NULL COLLATE utf8_general_ci');
        $this->addSql('ALTER TABLE bb_attachments_rating CHANGE attach_id attach_id INT UNSIGNED DEFAULT 0 NOT NULL, CHANGE user_id user_id INT DEFAULT 0 NOT NULL');
        $this->addSql('ALTER TABLE bb_auth_access DROP PRIMARY KEY');
        $this->addSql('ALTER TABLE bb_auth_access ADD auth_view TINYINT(1) DEFAULT \'0\' NOT NULL, ADD auth_read TINYINT(1) DEFAULT \'0\' NOT NULL, ADD auth_post TINYINT(1) DEFAULT \'0\' NOT NULL, ADD auth_reply TINYINT(1) DEFAULT \'0\' NOT NULL, ADD auth_edit TINYINT(1) DEFAULT \'0\' NOT NULL, ADD auth_delete TINYINT(1) DEFAULT \'0\' NOT NULL, ADD auth_sticky TINYINT(1) DEFAULT \'0\' NOT NULL, ADD auth_announce TINYINT(1) DEFAULT \'0\' NOT NULL, ADD auth_vote TINYINT(1) DEFAULT \'0\' NOT NULL, ADD auth_pollcreate TINYINT(1) DEFAULT \'0\' NOT NULL, ADD auth_attachments TINYINT(1) DEFAULT \'0\' NOT NULL, ADD auth_mod TINYINT(1) DEFAULT \'0\' NOT NULL, ADD auth_download TINYINT(1) DEFAULT \'0\' NOT NULL, DROP forum_perm, CHANGE group_id group_id INT DEFAULT 0 NOT NULL');
        $this->addSql('CREATE INDEX group_id ON bb_auth_access (group_id)');
        $this->addSql('ALTER TABLE bb_banlist CHANGE ban_ip ban_ip VARCHAR(8) DEFAULT \'\' NOT NULL COLLATE utf8_general_ci, CHANGE ban_email ban_email VARCHAR(255) DEFAULT NULL COLLATE utf8_general_ci');
        $this->addSql('ALTER TABLE bb_bt_config CHANGE config_name config_name VARCHAR(255) DEFAULT \'\' NOT NULL COLLATE utf8_general_ci');
        $this->addSql('ALTER TABLE bb_bt_search_results CHANGE session_id session_id VARCHAR(32) DEFAULT \'\' NOT NULL COLLATE utf8_general_ci');
        $this->addSql('ALTER TABLE bb_bt_tor_dl_stat DROP PRIMARY KEY');
        $this->addSql('ALTER TABLE bb_bt_tor_dl_stat ADD torrent_id INT UNSIGNED DEFAULT 0 NOT NULL, DROP topic_id, CHANGE user_id user_id INT DEFAULT 0 NOT NULL');
        $this->addSql('ALTER TABLE bb_bt_tor_dl_stat ADD PRIMARY KEY (torrent_id, user_id)');
        $this->addSql('ALTER TABLE bb_bt_torrents MODIFY info_hash VARBINARY(255) NOT NULL');
        $this->addSql('DROP INDEX forum_id ON bb_bt_torrents');
        $this->addSql('ALTER TABLE bb_bt_torrents DROP PRIMARY KEY');
        $this->addSql('DROP INDEX topic_check_uid ON bb_bt_torrents');
        $this->addSql('ALTER TABLE bb_bt_torrents ADD torrent_id INT UNSIGNED AUTO_INCREMENT NOT NULL, ADD last_seeder_uid INT DEFAULT 0 NOT NULL, ADD topic_check_status TINYINT(1) DEFAULT \'0\' NOT NULL, ADD topic_check_uid INT UNSIGNED DEFAULT 0 NOT NULL, ADD topic_check_date INT DEFAULT 0 NOT NULL, ADD topic_check_duble_tid INT DEFAULT 0 NOT NULL, ADD leechers INT DEFAULT 0 NOT NULL, ADD seeders INT DEFAULT 0 NOT NULL, ADD speed_ul BIGINT UNSIGNED DEFAULT 0 NOT NULL, ADD speed_dl BIGINT UNSIGNED DEFAULT 0 NOT NULL, DROP forum_id, DROP call_seed_time, DROP tor_status, DROP checked_user_id, DROP checked_time, DROP tor_type, DROP speed_up, DROP speed_down, CHANGE info_hash info_hash VARBINARY(20) NOT NULL, CHANGE topic_check_first_fid topic_check_first_fid INT DEFAULT 0 NOT NULL, CHANGE topic_check_double_tid piece_length INT UNSIGNED DEFAULT 0 NOT NULL');
        $this->addSql('CREATE UNIQUE INDEX info_hash ON bb_bt_torrents (info_hash)');
        $this->addSql('ALTER TABLE bb_bt_torrents ADD PRIMARY KEY (torrent_id)');
        $this->addSql('CREATE INDEX topic_check_uid ON bb_bt_torrents (topic_check_uid)');
        $this->addSql('ALTER TABLE bb_bt_torrents_del CHANGE torrent_id torrent_id INT UNSIGNED DEFAULT 0 NOT NULL, CHANGE info_hash info_hash BINARY(20) DEFAULT \'' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '\' NOT NULL');
        $this->addSql('ALTER TABLE bb_bt_tracker MODIFY peer_hash VARCHAR(32) NOT NULL COLLATE utf8mb4_bin');
        $this->addSql('ALTER TABLE bb_bt_tracker DROP PRIMARY KEY');
        $this->addSql('DROP INDEX topic_id ON bb_bt_tracker');
        $this->addSql('DROP INDEX torrent_peer_id ON bb_bt_tracker');
        $this->addSql('ALTER TABLE bb_bt_tracker ADD last_stored_up BIGINT UNSIGNED DEFAULT 0 NOT NULL, ADD last_stored_down BIGINT UNSIGNED DEFAULT 0 NOT NULL, ADD expire_time INT DEFAULT 0 NOT NULL, DROP peer_hash, DROP client, DROP releaser, DROP tor_type, DROP remain, DROP up_add, DROP down_add, CHANGE peer_id peer_id VARCHAR(35) NOT NULL COLLATE utf8_bin, CHANGE ip ip CHAR(8) DEFAULT \'0\' NOT NULL COLLATE utf8_general_ci, CHANGE speed_up speed_up INT UNSIGNED DEFAULT 0 NOT NULL, CHANGE speed_down speed_down INT UNSIGNED DEFAULT 0 NOT NULL, CHANGE complete_percent complete_percent BIGINT UNSIGNED DEFAULT 0 NOT NULL, CHANGE topic_id torrent_id INT UNSIGNED DEFAULT 0 NOT NULL, CHANGE complete stat_last_updated INT DEFAULT 0 NOT NULL');
        $this->addSql('CREATE UNIQUE INDEX torrent_peer_id ON bb_bt_tracker (torrent_id, peer_id)');
        $this->addSql('ALTER TABLE bb_bt_users ADD u_bonus_total BIGINT UNSIGNED DEFAULT 0 NOT NULL, ADD u_bonus_today BIGINT DEFAULT 0 NOT NULL, ADD u_bonus_hourly BIGINT DEFAULT 0 NOT NULL, ADD u_down_today BIGINT DEFAULT 0 NOT NULL, ADD u_up_today BIGINT DEFAULT 0 NOT NULL, ADD u_bonus_yday BIGINT DEFAULT 0 NOT NULL, ADD u_down_yday BIGINT DEFAULT 0 NOT NULL, ADD u_up_yday BIGINT DEFAULT 0 NOT NULL, ADD max_up_speed BIGINT UNSIGNED DEFAULT 0 NOT NULL, ADD max_down_speed BIGINT UNSIGNED DEFAULT 0 NOT NULL, ADD ratio_nulled TINYINT(1) DEFAULT \'0\' NOT NULL, ADD u_up_old BIGINT NOT NULL, ADD u_down_old BIGINT NOT NULL, ADD u_bonus_old BIGINT NOT NULL, ADD max_up_speed_old BIGINT NOT NULL, ADD u_releases INT DEFAULT 0 NOT NULL, ADD can_leech TINYINT(1) DEFAULT \'1\' NOT NULL, DROP u_up_release, DROP u_up_bonus, DROP up_today, DROP down_today, DROP up_release_today, DROP up_bonus_today, DROP points_today, DROP up_yesterday, DROP down_yesterday, DROP up_release_yesterday, DROP up_bonus_yesterday, DROP points_yesterday, CHANGE user_id user_id INT DEFAULT 0 NOT NULL, CHANGE auth_key auth_key CHAR(10) DEFAULT \'\' NOT NULL COLLATE utf8_general_ci');
        $this->addSql('ALTER TABLE bb_categories ADD cat_title_short VARCHAR(100) DEFAULT NULL COLLATE utf8_general_ci, ADD cat_title_hashtag VARCHAR(100) DEFAULT NULL COLLATE utf8_general_ci, ADD cat_url VARCHAR(100) DEFAULT NULL COLLATE utf8_general_ci, ADD cat_desc VARCHAR(100) DEFAULT NULL COLLATE utf8_general_ci, CHANGE cat_title cat_title VARCHAR(100) DEFAULT NULL COLLATE utf8_general_ci, CHANGE cat_order cat_order INT UNSIGNED DEFAULT 0 NOT NULL');
        $this->addSql('ALTER TABLE bb_config CHANGE config_name config_name VARCHAR(255) DEFAULT \'\' NOT NULL COLLATE utf8_general_ci, CHANGE config_value config_value VARCHAR(255) DEFAULT NULL COLLATE utf8_general_ci');
        $this->addSql('ALTER TABLE bb_extension_groups CHANGE group_id group_id INT AUTO_INCREMENT NOT NULL, CHANGE cat_id cat_id TINYINT(1) DEFAULT \'0\' NOT NULL, CHANGE download_mode download_mode TINYINT(1) DEFAULT \'1\' NOT NULL, CHANGE upload_icon upload_icon VARCHAR(100) DEFAULT \'\' COLLATE utf8_general_ci, CHANGE forum_permissions forum_permissions VARCHAR(255) DEFAULT \'\' NOT NULL COLLATE utf8_general_ci');
        $this->addSql('ALTER TABLE bb_extensions CHANGE comment comment VARCHAR(100) DEFAULT NULL COLLATE utf8_general_ci');
        $this->addSql('ALTER TABLE bb_flags CHANGE flag_id flag_id INT AUTO_INCREMENT NOT NULL');
        $this->addSql('ALTER TABLE bb_forbidden_extensions CHANGE ext_id ext_id INT UNSIGNED AUTO_INCREMENT NOT NULL');
        $this->addSql('ALTER TABLE bb_forums ADD prune_next INT DEFAULT NULL, ADD allow_dl_topic TINYINT(1) DEFAULT \'0\' NOT NULL, ADD dl_type_default TINYINT(1) DEFAULT \'0\' NOT NULL, ADD last_dl_topics_synch INT DEFAULT 0 NOT NULL, ADD show_dl_buttons TINYINT(1) DEFAULT \'0\' NOT NULL, ADD move_next INT UNSIGNED DEFAULT 0 NOT NULL, ADD recycle_move_next INT UNSIGNED DEFAULT 0 NOT NULL, ADD move_enable TINYINT(1) DEFAULT \'0\' NOT NULL, DROP forum_tpl_id, DROP prune_days, CHANGE forum_id forum_id SMALLINT UNSIGNED DEFAULT 0 NOT NULL, CHANGE forum_name forum_name VARCHAR(150) DEFAULT NULL COLLATE utf8_general_ci, CHANGE forum_desc forum_desc TEXT DEFAULT NULL COLLATE utf8_general_ci, CHANGE forum_order forum_order INT UNSIGNED DEFAULT 1 NOT NULL, CHANGE forum_parent forum_parent INT DEFAULT 0 NOT NULL, CHANGE allow_porno_topic prune_enable TINYINT(1) DEFAULT \'0\' NOT NULL');
        $this->addSql('ALTER TABLE bb_groups ADD group_order INT DEFAULT 0 NOT NULL, DROP avatar_ext_id, DROP group_time, DROP mod_time, DROP release_group, DROP group_signature, CHANGE group_id group_id INT AUTO_INCREMENT NOT NULL, CHANGE group_name group_name VARCHAR(40) DEFAULT NULL COLLATE utf8_general_ci, CHANGE group_description group_description VARCHAR(255) DEFAULT NULL COLLATE utf8_general_ci');
        $this->addSql('DROP INDEX topic_id ON bb_posts');
        $this->addSql('DROP INDEX forum_id_post_time ON bb_posts');
        $this->addSql('ALTER TABLE bb_posts ADD enable_html TINYINT(1) DEFAULT \'0\' NOT NULL, ADD enable_smilies TINYINT(1) DEFAULT \'1\' NOT NULL, ADD enable_sig TINYINT(1) DEFAULT \'1\' NOT NULL, ADD parsed TINYINT(1) DEFAULT \'0\' NOT NULL, ADD dont_cache TINYINT(1) DEFAULT \'0\' NOT NULL, ADD cache_file_md5 VARCHAR(32) DEFAULT NULL COLLATE utf8_general_ci, DROP poster_rg_id, DROP attach_rg_sig, DROP mc_comment, DROP mc_type, DROP mc_user_id, CHANGE poster_ip poster_ip VARCHAR(32) DEFAULT \'\' NOT NULL COLLATE utf8_general_ci, CHANGE post_username post_username VARCHAR(25) DEFAULT NULL COLLATE utf8_general_ci, CHANGE post_edit_time post_edit_time INT DEFAULT NULL, CHANGE user_post enable_bbcode TINYINT(1) DEFAULT \'1\' NOT NULL');
        $this->addSql('ALTER TABLE bb_posts_edit DROP PRIMARY KEY');
        $this->addSql('ALTER TABLE bb_posts_edit CHANGE post_id post_id INT UNSIGNED DEFAULT 0 NOT NULL');
        $this->addSql('ALTER TABLE bb_posts_text ADD bbcode_uid VARCHAR(10) DEFAULT \'\' NOT NULL COLLATE utf8_general_ci, ADD post_subject VARCHAR(120) DEFAULT NULL COLLATE utf8_general_ci, CHANGE post_id post_id INT UNSIGNED DEFAULT 0 NOT NULL, CHANGE post_text post_text MEDIUMTEXT DEFAULT NULL COLLATE utf8_general_ci');
        $this->addSql('ALTER TABLE bb_privmsgs ADD privmsgs_enable_bbcode TINYINT(1) DEFAULT \'1\' NOT NULL, ADD privmsgs_enable_html TINYINT(1) DEFAULT \'0\' NOT NULL, ADD privmsgs_enable_smilies TINYINT(1) DEFAULT \'1\' NOT NULL, ADD privmsgs_attach_sig TINYINT(1) DEFAULT \'1\' NOT NULL, ADD privmsgs_attachment TINYINT(1) DEFAULT \'0\' NOT NULL, CHANGE privmsgs_subject privmsgs_subject VARCHAR(255) DEFAULT NULL COLLATE utf8_general_ci, CHANGE privmsgs_ip privmsgs_ip VARCHAR(8) DEFAULT \'\' NOT NULL COLLATE utf8_general_ci');
        $this->addSql('ALTER TABLE bb_privmsgs_text ADD privmsgs_bbcode_uid VARCHAR(10) DEFAULT \'0\' NOT NULL COLLATE utf8_general_ci, CHANGE privmsgs_text_id privmsgs_text_id INT UNSIGNED DEFAULT 0 NOT NULL, CHANGE privmsgs_text privmsgs_text TEXT DEFAULT NULL COLLATE utf8_general_ci');
        $this->addSql('ALTER TABLE bb_ranks ADD rank_min INT DEFAULT 0 NOT NULL, ADD rank_special TINYINT(1) DEFAULT \'0\', DROP rank_style, CHANGE rank_title rank_title VARCHAR(50) DEFAULT NULL COLLATE utf8_general_ci, CHANGE rank_image rank_image VARCHAR(255) DEFAULT NULL COLLATE utf8_general_ci, CHANGE rank_group rank_group INT NOT NULL');
        $this->addSql('DROP INDEX search_id ON bb_search_results');
        $this->addSql('ALTER TABLE bb_search_results DROP PRIMARY KEY');
        $this->addSql('ALTER TABLE bb_search_results DROP search_type, DROP search_time, DROP search_settings, CHANGE session_id session_id VARCHAR(32) DEFAULT \'\' NOT NULL COLLATE utf8_general_ci, CHANGE search_id search_id INT UNSIGNED DEFAULT 0 NOT NULL');
        $this->addSql('CREATE INDEX session_id ON bb_search_results (session_id)');
        $this->addSql('ALTER TABLE bb_search_results ADD PRIMARY KEY (search_id)');
        $this->addSql('ALTER TABLE bb_search_wordlist CHANGE word_text word_text VARCHAR(50) DEFAULT \'\' NOT NULL COLLATE utf8_general_ci, CHANGE word_id word_id INT UNSIGNED AUTO_INCREMENT NOT NULL, CHANGE word_common word_common TINYINT(1) DEFAULT \'0\' NOT NULL');
        $this->addSql('ALTER TABLE bb_search_wordmatch DROP PRIMARY KEY');
        $this->addSql('ALTER TABLE bb_search_wordmatch CHANGE post_id post_id INT UNSIGNED DEFAULT 0 NOT NULL, CHANGE word_id word_id INT UNSIGNED DEFAULT 0 NOT NULL');
        $this->addSql('ALTER TABLE bb_sessions ADD session_page INT DEFAULT 0 NOT NULL, CHANGE session_id session_id CHAR(32) DEFAULT \'\' NOT NULL COLLATE utf8_general_ci, CHANGE session_ip session_ip CHAR(32) DEFAULT \'0\' NOT NULL COLLATE utf8_general_ci');
        $this->addSql('CREATE INDEX session_user_id ON bb_sessions (session_user_id)');
        $this->addSql('CREATE INDEX session_id_ip_user_id ON bb_sessions (session_id, session_ip, session_user_id)');
        $this->addSql('CREATE INDEX session_time ON bb_sessions (session_time)');
        $this->addSql('ALTER TABLE bb_smilies CHANGE code code VARCHAR(50) DEFAULT NULL COLLATE utf8_general_ci, CHANGE smile_url smile_url VARCHAR(100) DEFAULT NULL COLLATE utf8_general_ci, CHANGE emoticon emoticon VARCHAR(75) DEFAULT NULL COLLATE utf8_general_ci');
        $this->addSql('DROP INDEX topic_last_post_time ON bb_topics');
        $this->addSql('DROP INDEX topic_title ON bb_topics');
        $this->addSql('ALTER TABLE bb_topics ADD topic_dl_status TINYINT(1) DEFAULT \'0\' NOT NULL, ADD topic_type_gold TINYINT(1) DEFAULT \'0\' NOT NULL, ADD call_seed_time INT DEFAULT 0, ADD topic_cache_lock TINYINT(1) DEFAULT \'0\' NOT NULL, DROP topic_last_post_time, CHANGE topic_title topic_title VARCHAR(255) DEFAULT NULL COLLATE utf8_general_ci, CHANGE topic_show_first_post topic_show_first_post TINYINT(1) DEFAULT \'1\' NOT NULL');
        $this->addSql('CREATE INDEX topic_cache_lock ON bb_topics (topic_cache_lock)');
        $this->addSql('DROP INDEX user_id ON bb_topics_watch');
        $this->addSql('DROP INDEX notify_status ON bb_topics_watch');
        $this->addSql('ALTER TABLE bb_topics_watch DROP PRIMARY KEY');
        $this->addSql('ALTER TABLE bb_topics_watch CHANGE topic_id topic_id INT UNSIGNED DEFAULT 0 NOT NULL, CHANGE user_id user_id INT DEFAULT 0 NOT NULL');
        $this->addSql('CREATE INDEX topic_id ON bb_topics_watch (topic_id)');
        $this->addSql('ALTER TABLE bb_topics_watch ADD PRIMARY KEY (user_id, topic_id)');
        $this->addSql('ALTER TABLE bb_user_group DROP PRIMARY KEY');
        $this->addSql('ALTER TABLE bb_user_group DROP user_time, CHANGE group_id group_id INT DEFAULT 0 NOT NULL, CHANGE user_id user_id INT DEFAULT 0 NOT NULL, CHANGE user_pending user_pending TINYINT(1) DEFAULT NULL, CHANGE group_moderator group_moderator TINYINT(1) NOT NULL');
        $this->addSql('CREATE INDEX group_id ON bb_user_group (group_id)');
        $this->addSql('ALTER TABLE bb_users ADD user_password2 VARCHAR(60) DEFAULT \'\' NOT NULL COLLATE utf8_general_ci, ADD user_session_page SMALLINT DEFAULT 0 NOT NULL, ADD user_style TINYINT(1) DEFAULT NULL, ADD user_dateformat VARCHAR(14) DEFAULT \'d M Y H:i\' NOT NULL COLLATE utf8_general_ci, ADD user_emailtime INT DEFAULT NULL, ADD user_allowhtml TINYINT(1) DEFAULT \'1\', ADD user_allowbbcode TINYINT(1) DEFAULT \'1\', ADD user_allowsmile TINYINT(1) DEFAULT \'1\', ADD user_allowavatar TINYINT(1) DEFAULT \'1\' NOT NULL, ADD user_allow_pm TINYINT(1) DEFAULT \'1\' NOT NULL, ADD user_aim VARCHAR(255) DEFAULT NULL COLLATE utf8_general_ci, ADD user_yim VARCHAR(255) DEFAULT NULL COLLATE utf8_general_ci, ADD user_msnm VARCHAR(255) DEFAULT NULL COLLATE utf8_general_ci, DROP user_password, DROP user_last_ip, DROP user_reg_ip, DROP user_opt, DROP avatar_ext_id, DROP user_gender, DROP user_birthday, DROP user_twitter, DROP autologin_id, DROP user_newest_pm_id, DROP user_points, DROP tpl_name, CHANGE user_id user_id INT DEFAULT 0 NOT NULL, CHANGE user_active user_active TINYINT(1) DEFAULT \'1\', CHANGE username username VARCHAR(25) DEFAULT NULL COLLATE utf8_general_ci, CHANGE user_level user_level TINYINT(1) DEFAULT \'0\', CHANGE user_lang user_lang VARCHAR(255) DEFAULT NULL COLLATE utf8_general_ci, CHANGE user_rank user_rank INT DEFAULT 0, CHANGE user_email user_email VARCHAR(255) DEFAULT NULL COLLATE utf8_general_ci, CHANGE user_skype user_skype VARCHAR(255) DEFAULT NULL COLLATE utf8_general_ci, CHANGE user_icq user_icq VARCHAR(15) DEFAULT NULL COLLATE utf8_general_ci, CHANGE user_website user_website VARCHAR(100) DEFAULT NULL COLLATE utf8_general_ci, CHANGE user_from user_from VARCHAR(100) DEFAULT NULL COLLATE utf8_general_ci, CHANGE user_sig user_sig TEXT DEFAULT NULL COLLATE utf8_general_ci, CHANGE user_occ user_occ VARCHAR(100) DEFAULT NULL COLLATE utf8_general_ci, CHANGE user_interests user_interests VARCHAR(255) DEFAULT NULL COLLATE utf8_general_ci, CHANGE user_actkey user_actkey VARCHAR(32) DEFAULT NULL COLLATE utf8_general_ci, CHANGE user_newpasswd user_newpasswd VARCHAR(60) DEFAULT NULL COLLATE utf8_general_ci');
        $this->addSql('CREATE INDEX user_session_time ON bb_users (user_session_time)');
        $this->addSql('ALTER TABLE bb_vote_results MODIFY vote_id INT UNSIGNED NOT NULL');
        $this->addSql('ALTER TABLE bb_vote_results DROP PRIMARY KEY');
        $this->addSql('ALTER TABLE bb_vote_results CHANGE vote_id vote_id INT UNSIGNED DEFAULT 0 NOT NULL, CHANGE vote_option_id vote_option_id TINYINT(1) DEFAULT \'0\' NOT NULL');
        $this->addSql('ALTER TABLE bb_vote_voters DROP PRIMARY KEY');
        $this->addSql('ALTER TABLE bb_vote_voters CHANGE vote_id vote_id INT UNSIGNED DEFAULT 0 NOT NULL, CHANGE vote_user_id vote_user_id INT DEFAULT 0 NOT NULL, CHANGE vote_user_ip vote_user_ip CHAR(32) DEFAULT \'\' NOT NULL COLLATE utf8_general_ci');
        $this->addSql('CREATE INDEX vote_id ON bb_vote_voters (vote_id)');
        $this->addSql('ALTER TABLE bb_warnings CHANGE warning_type warning_type TINYINT(1) DEFAULT \'0\' NOT NULL');
        $this->addSql('ALTER TABLE bb_warnings_text CHANGE warning_id warning_id INT UNSIGNED DEFAULT 0 NOT NULL');
        $this->addSql('ALTER TABLE bb_words CHANGE word word CHAR(100) DEFAULT NULL COLLATE utf8_general_ci');
    }
}
