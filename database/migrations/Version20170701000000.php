<?php

namespace Database\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema as Schema;

/**
 * Migration: This one is to adjust stock TorrentPier schema to our custom modifications
 */
class Version20170701000000 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        // new tables
        if (!$schema->hasTable('bb_attachments_rating')) {
            $this->addSql('CREATE TABLE bb_attachments_rating (
                attach_id INT UNSIGNED NOT NULL,
                user_id INT NOT NULL,
                thanked TINYINT(1) DEFAULT \'0\' NOT NULL,
                rating SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
                PRIMARY KEY(attach_id, user_id)
            ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        }
        if (!$schema->hasTable('bb_posts_edit')) {
            $this->addSql('CREATE TABLE bb_posts_edit (
                post_id INT UNSIGNED NOT NULL,
                user_id INT NOT NULL,
                post_edit_count SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
                post_edit_time INT DEFAULT NULL,
                INDEX user_id (user_id),
                PRIMARY KEY(post_id, user_id)
            ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        }
        if (!$schema->hasTable('bb_warnings')) {
            $this->addSql('CREATE TABLE bb_warnings (
                warning_id INT UNSIGNED AUTO_INCREMENT NOT NULL,
                warning_type TINYINT(1) DEFAULT \'0\' NOT NULL,
                warning_post_id INT UNSIGNED DEFAULT 0 NOT NULL,
                warning_user_id INT DEFAULT 0 NOT NULL,
                warning_poster_id INT DEFAULT 0 NOT NULL,
                warning_posted INT DEFAULT 0 NOT NULL,
                warning_expires INT DEFAULT 0 NOT NULL,
                warning_proceed TINYINT(1) DEFAULT \'0\' NOT NULL,
                INDEX warning_user_id (warning_user_id),
                PRIMARY KEY(warning_id)
            ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        }
        if (!$schema->hasTable('bb_warnings_text')) {
            $this->addSql('CREATE TABLE bb_warnings_text (
                warning_id INT UNSIGNED NOT NULL,
                bbcode_uid VARCHAR(10) DEFAULT \'\' NOT NULL,
                warning_text TEXT DEFAULT NULL,
                PRIMARY KEY(warning_id)
            ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        }

        // bb_attachments
        $this->upBbAttachments($schema);
        // bb_attachments_config
        $this->addSql('ALTER TABLE bb_attachments_config
            CHANGE config_name config_name VARCHAR(255) NOT NULL');
        // bb_attachments_desc
        $this->upBbAttachmentsDesc($schema);
        // bb_attach_quota
        $this->upBbAttachQuota($schema);
        // bb_auth_access
        $this->addSql('ALTER TABLE bb_auth_access
            CHANGE group_id group_id INT UNSIGNED DEFAULT 0 NOT NULL');
        // bb_auth_access_snap
        $this->addSql('ALTER TABLE bb_auth_access_snap
            CHANGE user_id user_id INT NOT NULL,
            CHANGE forum_id forum_id SMALLINT UNSIGNED NOT NULL');
        // bb_banlist
        $this->addSql('ALTER TABLE bb_banlist
            CHANGE ban_id ban_id INT UNSIGNED AUTO_INCREMENT NOT NULL,
            CHANGE ban_userid ban_userid INT DEFAULT 0 NOT NULL');
        // bb_bt_dlstatus
        $this->upBbBtDlstatus($schema);
        // bb_bt_dlstatus_snap
        $this->upBbBtDlstatusSnap($schema);
        // bb_bt_last_torstat
        $this->addSql('ALTER TABLE bb_bt_last_torstat
            CHANGE topic_id topic_id INT UNSIGNED NOT NULL,
            CHANGE user_id user_id INT NOT NULL');
        // bb_bt_last_userstat
        $this->addSql('ALTER TABLE bb_bt_last_userstat
            CHANGE user_id user_id INT NOT NULL');
        // bb_bt_tor_dl_stat
        $this->addSql('ALTER TABLE bb_bt_tor_dl_stat
            CHANGE topic_id topic_id INT UNSIGNED NOT NULL,
            CHANGE user_id user_id INT NOT NULL,
            CHANGE attach_id attach_id INT UNSIGNED DEFAULT 0 NOT NULL');
        // bb_bt_torhelp
        $this->addSql('ALTER TABLE bb_bt_torhelp
            CHANGE user_id user_id INT NOT NULL');
        // bb_bt_torrents
        $this->upBbBtTorrents($schema);
        // bb_bt_torstat
        $this->addSql('ALTER TABLE bb_bt_torstat
            CHANGE topic_id topic_id INT UNSIGNED NOT NULL,
            CHANGE user_id user_id INT NOT NULL');
        // bb_bt_tracker
        $this->addSql('ALTER TABLE bb_bt_tracker
            CHANGE topic_id topic_id INT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE user_id user_id INT DEFAULT 0 NOT NULL,
            CHANGE tor_type tor_type SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE speed_up speed_up BIGINT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE speed_down speed_down BIGINT UNSIGNED DEFAULT 0 NOT NULL');
        // bb_bt_tracker_snap
        $this->addSql('ALTER TABLE bb_bt_tracker_snap
            CHANGE topic_id topic_id INT UNSIGNED NOT NULL,
            CHANGE seeders seeders INT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE leechers leechers INT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE speed_up speed_up BIGINT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE speed_down speed_down BIGINT UNSIGNED DEFAULT 0 NOT NULL');
        // bb_bt_users
        $this->upBbBtUsers($schema);
        // bb_bt_user_settings
        $this->addSql('ALTER TABLE bb_bt_user_settings
            CHANGE user_id user_id INT NOT NULL');
        // bb_categories
        $this->addSql('ALTER TABLE bb_categories
            CHANGE cat_id cat_id INT UNSIGNED AUTO_INCREMENT NOT NULL');
        // bb_config
        $this->addSql('ALTER TABLE bb_config
            CHANGE config_name config_name VARCHAR(255) NOT NULL');
        // bb_cron
        $this->addSql('ALTER TABLE bb_cron
            CHANGE cron_active cron_active TINYINT(1) DEFAULT 1 NOT NULL,
            CHANGE log_sql_queries log_sql_queries TINYINT(1) DEFAULT 0 NOT NULL,
            -- CHANGE schedule schedule ENUM(\'hourly\',\'daily\',\'weekly\',\'monthly\',\'interval\') DEFAULT \'daily\' NOT NULL COMMENT \'(DC2Type:enumcronschedule)\',
            -- CHANGE run_day run_day ENUM(\'1\',\'2\',\'3\',\'4\',\'5\',\'6\',\'7\',\'8\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'24\',\'25\',\'26\',\'27\',\'28\') DEFAULT NULL COMMENT \'(DC2Type:enumcronrunday)\',
            CHANGE run_order run_order SMALLINT UNSIGNED DEFAULT 0 NOT NULL');
        // bb_extension_groups
        $this->addSql('ALTER TABLE bb_extension_groups
            CHANGE group_id group_id INT UNSIGNED AUTO_INCREMENT NOT NULL,
            CHANGE cat_id cat_id INT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE download_mode download_mode SMALLINT UNSIGNED DEFAULT 1 NOT NULL');
        // bb_extensions
        $this->addSql('ALTER TABLE bb_extensions
            CHANGE ext_id ext_id INT UNSIGNED AUTO_INCREMENT NOT NULL,
            CHANGE group_id group_id INT UNSIGNED DEFAULT 0 NOT NULL');
        // bb_forums
        $this->upBbForums($schema);
        // bb_groups
        $this->upBbGroups($schema);
        // bb_log
        $this->upBbLog($schema);
        // bb_poll_votes
        $this->addSql('ALTER TABLE bb_poll_votes
            CHANGE vote_id vote_id SMALLINT UNSIGNED NOT NULL,
            CHANGE vote_result vote_result INT UNSIGNED NOT NULL');
        // bb_posts
        $this->upBbPosts($schema);
        // bb_posts_html
        $this->addSql('ALTER TABLE bb_posts_html
            CHANGE post_id post_id INT UNSIGNED NOT NULL');
        // bb_posts_search
        $this->addSql('ALTER TABLE bb_posts_search
            CHANGE post_id post_id INT UNSIGNED NOT NULL');
        // bb_posts_text
        $this->addSql('ALTER TABLE bb_posts_text
            CHANGE post_id post_id INT UNSIGNED NOT NULL');
        // bb_privmsgs
        $this->addSql('ALTER TABLE bb_privmsgs
            CHANGE privmsgs_id privmsgs_id INT UNSIGNED AUTO_INCREMENT NOT NULL');
        // bb_privmsgs_text
        $this->addSql('ALTER TABLE bb_privmsgs_text
            CHANGE privmsgs_text_id privmsgs_text_id INT UNSIGNED NOT NULL');
        // bb_ranks
        $this->upBbRanks($schema);
        // bb_search_rebuild
        $this->addSql('ALTER TABLE bb_search_rebuild
            CHANGE rebuild_session_id rebuild_session_id INT UNSIGNED AUTO_INCREMENT NOT NULL,
            CHANGE start_post_id start_post_id INT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE end_post_id end_post_id INT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE session_posts session_posts INT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE session_cycles session_cycles INT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE rebuild_session_status rebuild_session_status SMALLINT UNSIGNED DEFAULT 0 NOT NULL');
        // bb_search_results
        $this->addSql('ALTER TABLE bb_search_results
            CHANGE search_type search_type SMALLINT DEFAULT 0 NOT NULL');
        // index creation is delayed after charset conversion
        // $this->addSql('CREATE INDEX search_id ON bb_search_results (search_id)');

        // bb_sessions
        /* Same changes will be applied during charset conversion
        $this->addSql('ALTER TABLE bb_sessions
            CHANGE session_id session_id CHAR(20) NOT NULL COLLATE utf8mb4_bin,
            CHANGE session_ip session_ip VARCHAR(42) DEFAULT \'0\' NOT NULL COLLATE utf8mb4_bin'); */

        // bb_topics
        $this->upBbTopics($schema);
        // bb_topics_watch
        $this->upBbTopicsWatch($schema);
        // bb_user_group
        $this->upBbUserGroup($schema);
        // bb_users
        $this->upBbUsers($schema);
        // bb_words
        $this->addSql('ALTER TABLE bb_words
            CHANGE word_id word_id INT UNSIGNED NOT NULL');
        // buf_last_seeder
        $this->addSql('ALTER TABLE buf_last_seeder
            CHANGE topic_id topic_id INT UNSIGNED NOT NULL');
        // buf_topic_view
        $this->addSql('ALTER TABLE buf_topic_view
            CHANGE topic_id topic_id INT UNSIGNED NOT NULL,
            CHANGE topic_views topic_views INT UNSIGNED DEFAULT 0 NOT NULL');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        $this->abortIf(true, 'We do not support downgrade, sorry.');
    }

    /**
     * Create new tables
     *
     * @param Schema $schema
     */
    private function addNewTables(Schema $schema) {
        //
    }

    /**
     * Update bb_attachments
     *
     * @param Schema $schema
     */
    private function upBbAttachments(Schema $schema) {
        $bbAttachments = $schema->getTable('bb_attachments');
        $recreatePK = $bbAttachments->hasPrimaryKey() &&
                      $bbAttachments->getPrimaryKey()->getColumns() != ['attach_id', 'post_id', 'privmsgs_id'];

        if ($bbAttachments->hasPrimaryKey() && $recreatePK) {
            $this->addSql('ALTER TABLE bb_attachments DROP PRIMARY KEY');
        }

        $this->addSql('ALTER TABLE bb_attachments ' .
            (!$bbAttachments->hasColumn('privmsgs_id')
                ? 'ADD privmsgs_id INT UNSIGNED DEFAULT 0 NOT NULL AFTER post_id, ' : '') .
            (!$bbAttachments->hasColumn('user_id_2')
                ? 'ADD user_id_2 INT DEFAULT 0 NOT NULL AFTER user_id_1, ' : '') .
            'CHANGE attach_id attach_id INT UNSIGNED NOT NULL,
            CHANGE post_id post_id INT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE user_id_1 user_id_1 INT DEFAULT 0 NOT NULL');

        if (!$bbAttachments->hasIndex('attach_id_privmsgs_id')) {
            $this->addSql('CREATE INDEX attach_id_privmsgs_id ON bb_attachments (attach_id, privmsgs_id)');
        }

        if (!$bbAttachments->hasIndex('post_id')) {
            $this->addSql('CREATE INDEX post_id ON bb_attachments (post_id)');
        }

        if (!$bbAttachments->hasIndex('privmsgs_id')) {
            $this->addSql('CREATE INDEX privmsgs_id ON bb_attachments (privmsgs_id)');
        }

        if ($recreatePK) {
            $this->addSql('ALTER TABLE bb_attachments ADD PRIMARY KEY (attach_id, post_id, privmsgs_id)');
        }
    }

    /**
     * Update bb_attachments_desc
     *
     * @param Schema $schema
     */
    private function upBbAttachmentsDesc(Schema $schema) {
        $bbAttachmentsDesc = $schema->getTable('bb_attachments_desc');
        $this->addSql('ALTER TABLE bb_attachments_desc ' .
            (!$bbAttachmentsDesc->hasColumn('rating_sum')
                ? 'ADD rating_sum INT DEFAULT 0 NOT NULL, ' : '') .
            (!$bbAttachmentsDesc->hasColumn('rating_count')
                ? 'ADD rating_count INT DEFAULT 0 NOT NULL, ' : '') .
            (!$bbAttachmentsDesc->hasColumn('force_private')
                ? 'ADD force_private TINYINT(1) DEFAULT \'0\' NOT NULL, ' : '') .
            'CHANGE attach_id attach_id INT UNSIGNED AUTO_INCREMENT NOT NULL');
    }

    /**
     * Update bb_attach_quota
     *
     * @param Schema $schema
     */
    private function upBbAttachQuota(Schema $schema) {
        $this->addSql('ALTER TABLE bb_attach_quota
            CHANGE user_id user_id INT DEFAULT 0 NOT NULL,
            CHANGE group_id group_id INT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE quota_limit_id quota_limit_id INT UNSIGNED NOT NULL' .
            (!$schema->getTable('bb_attach_quota')->hasPrimaryKey()
                ? ', ADD PRIMARY KEY (quota_limit_id)' : ''));
    }

    /**
     * Update bb_bt_dlstatus
     *
     * @param Schema $schema
     */
    private function upBbBtDlstatus(Schema $schema) {
        $this->addSql('ALTER TABLE bb_bt_dlstatus ' .
            (!$schema->getTable('bb_bt_dlstatus')->hasColumn('compl_count')
                ? 'ADD compl_count SMALLINT UNSIGNED DEFAULT 0 NOT NULL AFTER user_status, ' : '') .
            'CHANGE user_id user_id INT NOT NULL,
            CHANGE topic_id topic_id INT UNSIGNED NOT NULL,
            CHANGE user_status user_status SMALLINT DEFAULT 0 NOT NULL');
    }

    /**
     * Update bb_bt_dlstatus_snap
     *
     * @param Schema $schema
     */
    private function upBbBtDlstatusSnap(Schema $schema) {
        $bbBtDlstatusSnap = $schema->getTable('bb_bt_dlstatus_snap');

        if ($bbBtDlstatusSnap->hasIndex('topic_id')) {
            $this->addSql('DROP INDEX topic_id ON bb_bt_dlstatus_snap');
        }

        $this->addSql('ALTER TABLE bb_bt_dlstatus_snap
            CHANGE topic_id topic_id INT UNSIGNED NOT NULL,
            CHANGE dl_status dl_status SMALLINT NOT NULL' .
            (!$bbBtDlstatusSnap->hasPrimaryKey()
                ? ', ADD PRIMARY KEY (topic_id, dl_status)' : ''));
    }

    /**
     * Update bb_bt_torrents
     *
     * @param SChema $schema
     */
    private function upBbBtTorrents(Schema $schema) {
        $bbBtTorrents = $schema->getTable('bb_bt_torrents');

        $this->addSql('ALTER TABLE bb_bt_torrents ' .
            (!$bbBtTorrents->hasColumn('topic_check_orig_fid')
                ? 'ADD topic_check_orig_fid SMALLINT UNSIGNED DEFAULT 0 NOT NULL, ' : '') .
            (!$bbBtTorrents->hasColumn('topic_check_dup_tid')
                ? 'ADD topic_check_dup_tid INT UNSIGNED DEFAULT 0 NOT NULL, ' : '') .
            'CHANGE info_hash info_hash VARBINARY(20) NOT NULL,
            CHANGE post_id post_id INT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE poster_id poster_id INT DEFAULT 0 NOT NULL,
            CHANGE topic_id topic_id INT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE attach_id attach_id INT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE tor_status tor_status SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE checked_user_id checked_user_id INT DEFAULT 0 NOT NULL,
            CHANGE tor_type tor_type SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE speed_up speed_up BIGINT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE speed_down speed_down BIGINT UNSIGNED DEFAULT 0 NOT NULL');

        if (!$bbBtTorrents->hasIndex('size')) {
            $this->addSql('CREATE INDEX size ON bb_bt_torrents (size)');
        }
        if (!$bbBtTorrents->hasIndex('checked_user_id')) {
            $this->addSql('CREATE INDEX checked_user_id ON bb_bt_torrents (checked_user_id)');
        }
    }

    /**
     * Update bb_bt_users
     *
     * @param Schema $schema
     */
    private function upBbBtUsers(Schema $schema) {
        $this->addSql('ALTER TABLE bb_bt_users
            CHANGE user_id user_id INT NOT NULL');

        if (!$schema->getTable('bb_bt_users')->hasIndex('user_id_down')) {
            $this->addSql('CREATE INDEX user_id_down ON bb_bt_users (user_id, u_down_total)');
        }
    }

    /**
     * Update bb_forums
     *
     * @param Schema $schema
     */
    private function upBbForums(Schema $schema) {
        $bbForums = $schema->getTable('bb_forums');

        $this->addSql('ALTER TABLE bb_forums
            CHANGE forum_id forum_id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
            CHANGE cat_id cat_id INT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE forum_order forum_order SMALLINT UNSIGNED DEFAULT 1 NOT NULL,
            CHANGE forum_last_post_id forum_last_post_id INT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE forum_display_order forum_display_order SMALLINT DEFAULT 0 NOT NULL');

        if (!$bbForums->hasIndex('auth_view')) {
            $this->addSql('CREATE INDEX auth_view ON bb_forums (auth_view)');
        }
        if (!$bbForums->hasIndex('auth_read')) {
            $this->addSql('CREATE INDEX auth_read ON bb_forums (auth_read)');
        }
    }

    /**
     * Update bb_groups
     *
     * @param Schema $schema
     */
    private function upBbGroups(Schema $schema) {
        $this->addSql('ALTER TABLE bb_groups
            CHANGE group_id group_id INT UNSIGNED AUTO_INCREMENT NOT NULL,
            CHANGE avatar_ext_id avatar_ext_id INT DEFAULT 0 NOT NULL');

        if (!$schema->getTable('bb_groups')->hasIndex('group_name')) {
            $this->addSql('CREATE INDEX group_name ON bb_groups (group_name)');
        }
    }

    /**
     * Update bb_log
     *
     * @param Schema $schema
     */
    private function upBbLog(Schema $schema) {
        $bbLog = $schema->getTable('bb_log');

        $this->addSql('ALTER TABLE bb_log ' .
            (!$bbLog->hasColumn('id')
                ? 'ADD id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL FIRST, ' : '') .
            (!$bbLog->hasPrimaryKey()
                ? 'ADD PRIMARY KEY (id), ' : '') .
            'CHANGE log_type_id log_type_id INT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE log_user_id log_user_id INT DEFAULT 0 NOT NULL,
            CHANGE log_forum_id log_forum_id SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE log_forum_id_new log_forum_id_new SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE log_topic_id log_topic_id INT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE log_topic_id_new log_topic_id_new INT UNSIGNED DEFAULT 0 NOT NULL');
    }

    /**
     * Update bb_posts
     *
     * @param Schema $schema
     */
    private function upBbPosts(Schema $schema) {
        $bbPosts = $schema->getTable('bb_posts');

        $this->addSql('ALTER TABLE bb_posts ' .
            (!$bbPosts->hasColumn('post_created')
                ? 'ADD post_created INT DEFAULT 0 NOT NULL AFTER post_time, ' : '') .
            'CHANGE post_id post_id INT UNSIGNED AUTO_INCREMENT NOT NULL,
            CHANGE topic_id topic_id INT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE poster_id poster_id INT DEFAULT 0 NOT NULL,
            CHANGE poster_rg_id poster_rg_id INT DEFAULT 0 NOT NULL,
            CHANGE attach_rg_sig attach_rg_sig TINYINT(1) DEFAULT 0 NOT NULL,
            CHANGE mc_user_id mc_user_id INT DEFAULT 0 NOT NULL');

        if (!$bbPosts->hasIndex('forum_id')) {
            $this->addSql('CREATE INDEX forum_id ON bb_posts (forum_id)');
        }
        if (!$bbPosts->hasIndex('topic_time')) {
            $this->addSql('CREATE INDEX topic_time ON bb_posts (topic_id, post_time)');
        }
    }

    /**
     * Update bb_ranks
     *
     * @param Schema $schema
     */
    private function upBbRanks(Schema $schema) {
        if (!$schema->getTable('bb_ranks')->hasColumn('rank_group')) {
            $this->addSql('ALTER TABLE bb_ranks ADD rank_group INT UNSIGNED NOT NULL');
        }
    }

    /**
     * Update bb_topics
     *
     * @param Schema $schema
     */
    private function upBbTopics(Schema $schema) {
        $bbTopics = $schema->getTable('bb_topics');
        $rebuildTopicLastPostIdUqIdx = !(
            $bbTopics->hasIndex('topic_last_post_id') &&
            $bbTopics->getIndex('topic_last_post_id')->isUnique() &&
            $bbTopics->getIndex('topic_last_post_id')->getColumns() == ['topic_last_post_id']
        );

        if ($bbTopics->hasIndex('topic_last_post_id') && $rebuildTopicLastPostIdUqIdx) {
            $this->addSql('DROP INDEX topic_last_post_id ON bb_topics');
        }

        $this->addSql('ALTER TABLE bb_topics
            CHANGE topic_id topic_id INT UNSIGNED AUTO_INCREMENT NOT NULL,
            CHANGE forum_id forum_id SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE topic_type topic_type SMALLINT DEFAULT 0 NOT NULL,
            CHANGE topic_first_post_id topic_first_post_id INT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE topic_last_post_id topic_last_post_id INT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE topic_dl_type topic_dl_type SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE topic_show_first_post topic_show_first_post SMALLINT UNSIGNED DEFAULT 0 NOT NULL');

        if (!$bbTopics->hasIndex('topic_type')) {
            $this->addSql('CREATE INDEX topic_type ON bb_topics (topic_type)');
        }
        if (!$bbTopics->hasIndex('topic_status')) {
            $this->addSql('CREATE INDEX topic_status ON bb_topics (topic_status)');
        }
        if (!$bbTopics->hasIndex('topic_moved_id')) {
            $this->addSql('CREATE INDEX topic_moved_id ON bb_topics (topic_moved_id)');
        }
        if (!$bbTopics->hasIndex('topic_poster')) {
            $this->addSql('CREATE INDEX topic_poster ON bb_topics (topic_poster)');
        }
        if ($rebuildTopicLastPostIdUqIdx) {
            $this->addSql('CREATE UNIQUE INDEX topic_last_post_id ON bb_topics (topic_last_post_id)');
        }
    }

    /**
     * Update bb_topics_watch
     *
     * @param Schema $schema
     */
    private function upBbTopicsWatch(Schema $schema) {
        $bbTopicsWatch = $schema->getTable('bb_topics_watch');

        if ($bbTopicsWatch->hasIndex('topic_id')) {
            $this->addSql('DROP INDEX topic_id ON bb_topics_watch');
        }

        $this->addSql('ALTER TABLE bb_topics_watch
            CHANGE topic_id topic_id INT UNSIGNED NOT NULL,
            CHANGE user_id user_id INT NOT NULL' .
            (!$bbTopicsWatch->hasPrimaryKey()
                ? ', ADD PRIMARY KEY (topic_id, user_id)' : '')
        );
    }

    /**
     * Update bb_user_group
     *
     * @param Schema $schema
     */
    private function upBbUserGroup(Schema $schema) {
        $this->addSql('ALTER TABLE bb_user_group ' .
            (!$schema->getTable('bb_user_group')->hasColumn('group_moderator')
                ? 'ADD group_moderator INT DEFAULT 0 NOT NULL AFTER user_time, ' : '') .
            'CHANGE group_id group_id INT UNSIGNED NOT NULL,
            CHANGE user_id user_id INT NOT NULL');
    }

    /**
     * Update bb_users
     *
     * @param Schema $schema
     */
    private function upBbUsers(Schema $schema) {
        $bbUsers = $schema->getTable('bb_users');

        $this->addSql('ALTER TABLE bb_users ' .
            (!$bbUsers->hasColumn('user_timer')
                ? 'ADD user_timer INT NOT NULL, ' : '') .
            (!$bbUsers->hasColumn('user_login_tries')
                ? 'ADD user_login_tries SMALLINT DEFAULT 0 NOT NULL, ' : '') .
            (!$bbUsers->hasColumn('user_last_login_try')
                ? 'ADD user_last_login_try INT DEFAULT 0 NOT NULL, ' : '') .
            (!$bbUsers->hasColumn('user_viewemail')
                ? 'ADD user_viewemail TINYINT(1) DEFAULT NULL, ' : '') .
            (!$bbUsers->hasColumn('user_attachsig')
                ? 'ADD user_attachsig TINYINT(1) DEFAULT NULL, ' : '') .
            (!$bbUsers->hasColumn('user_allow_viewonline')
                ? 'ADD user_allow_viewonline TINYINT(1) DEFAULT \'1\' NOT NULL, ' : '') .
            (!$bbUsers->hasColumn('user_notify')
                ? 'ADD user_notify TINYINT(1) DEFAULT \'1\' NOT NULL, ' : '') .
            (!$bbUsers->hasColumn('user_notify_pm')
                ? 'ADD user_notify_pm TINYINT(1) DEFAULT \'0\' NOT NULL, ' : '') .
            (!$bbUsers->hasColumn('user_popup_pm')
                ? 'ADD user_popup_pm TINYINT(1) DEFAULT \'0\' NOT NULL, ' : '') .
            (!$bbUsers->hasColumn('user_avatar')
                ? 'ADD user_avatar VARCHAR(100) DEFAULT NULL, ' : '') .
            (!$bbUsers->hasColumn('user_avatar_type')
                ? 'ADD user_avatar_type TINYINT(1) DEFAULT \'0\' NOT NULL, ' : '') .
            (!$bbUsers->hasColumn('user_sig_bbcode_uid')
                ? 'ADD user_sig_bbcode_uid VARCHAR(10) DEFAULT NULL, ' : '') .
            (!$bbUsers->hasColumn('user_allow_passkey')
                ? 'ADD user_allow_passkey TINYINT(1) DEFAULT \'1\' NOT NULL, ' : '') .
            (!$bbUsers->hasColumn('user_from_flag')
                ? 'ADD user_from_flag VARCHAR(25) DEFAULT NULL, ' : '') .
            (!$bbUsers->hasColumn('user_allowdefaultavatar')
                ? 'ADD user_allowdefaultavatar TINYINT(1) DEFAULT \'1\' NOT NULL, ' : '') .
            (!$bbUsers->hasColumn('user_warnings')
                ? 'ADD user_warnings TINYINT(1) DEFAULT \'0\' NOT NULL, ' : '') .
            (!$bbUsers->hasColumn('user_banned')
                ? 'ADD user_banned TINYINT(1) DEFAULT \'0\' NOT NULL, ' : '') .
            (!$bbUsers->hasColumn('bt_tor_browse_set')
                ? 'ADD bt_tor_browse_set TEXT DEFAULT NULL, ' : '') .
            (!$bbUsers->hasColumn('user_unread_topics')
                ? 'ADD user_unread_topics TEXT DEFAULT NULL, ' : '') .
            (!$bbUsers->hasColumn('user_hide_bt_stats')
                ? 'ADD user_hide_bt_stats TINYINT(1) DEFAULT \'0\' NOT NULL, ' : '') .
            (!$bbUsers->hasColumn('user_hide_bt_history')
                ? 'ADD user_hide_bt_history TINYINT(1) DEFAULT \'1\' NOT NULL, ' : '') .
            (!$bbUsers->hasColumn('user_hide_bt_activity')
                ? 'ADD user_hide_bt_activity TINYINT(1) DEFAULT \'0\' NOT NULL, ' : '') .
            (!$bbUsers->hasColumn('user_hide_bt_topics')
                ? 'ADD user_hide_bt_topics TINYINT(1) DEFAULT \'0\' NOT NULL, ' : '') .
            (!$bbUsers->hasColumn('user_bt_ssl')
                ? 'ADD user_bt_ssl TINYINT(1) DEFAULT \'0\' NOT NULL, ' : '') .
            'CHANGE user_id user_id INT AUTO_INCREMENT NOT NULL,
            CHANGE user_level user_level SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
            CHANGE avatar_ext_id avatar_ext_id INT DEFAULT 0 NOT NULL,
            CHANGE user_newest_pm_id user_newest_pm_id INT UNSIGNED DEFAULT 0 NOT NULL');

        if (!$bbUsers->hasIndex('user_regdate')) {
            $this->addSql('CREATE INDEX user_regdate ON bb_users (user_regdate)');
        }
    }
}
