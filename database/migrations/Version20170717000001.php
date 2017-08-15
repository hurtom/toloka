<?php

namespace Database\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Migration: Convert database to CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
 *
 * From the MySQL doc (https://dev.mysql.com/doc/refman/5.7/en/alter-table.html):
 *
 * To avoid data type changes of the type just described, do not use CONVERT TO CHARACTER SET.
 * Instead, use MODIFY to change individual columns.
 *
 * WARNING:
 * The CONVERT TO operation converts column values between the character sets.
 * This is not what you want if you have a column in one character set (like latin1) but the
 * stored values actually use some other, incompatible character set (like utf8). In this case,
 * you have to do the following for each such column:
 *
 *   - ALTER TABLE t1 CHANGE c1 c1 BLOB;
 *   - ALTER TABLE t1 CHANGE c1 c1 TEXT CHARACTER SET utf8;
 *
 * The reason this works is that there is no conversion when you convert to or from BLOB columns.
 */
class Version20170717000001 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER DATABASE DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER DATABASE CHARACTER SET utf8mb4');
        $this->addSql('ALTER DATABASE COLLATE utf8mb4_unicode_ci');

        $this->addSql('ALTER TABLE
            bb_attach_quota CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_attachments CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_attachments_config CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_attachments_desc CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_attachments_rating CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_auth_access CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_auth_access_snap CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');

        // bb_banlist has utf8*_bin columns
        $this->addSql('ALTER TABLE
            bb_banlist DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_banlist DROP INDEX ban_ip_user_id,
            MODIFY ban_ip BLOB,
            MODIFY ban_email BLOB');
        $this->addSql('ALTER TABLE
            bb_banlist MODIFY ban_ip VARCHAR(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT \'0\',
            MODIFY ban_email VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'\',
            ADD KEY ban_ip_user_id (ban_ip,ban_userid)');

        $this->addSql('ALTER TABLE
            bb_bt_dlstatus CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_bt_dlstatus_snap CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_bt_last_torstat CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_bt_last_userstat CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_bt_tor_dl_stat CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_bt_torhelp CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_bt_torrents CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_bt_torstat CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');

        // bb_bt_tracker has utf8*_bin columns
        $this->addSql('ALTER TABLE
            bb_bt_tracker DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_bt_tracker /* DROP PRIMARY KEY, */
            MODIFY peer_hash BLOB,
            MODIFY peer_id BLOB,
            MODIFY ip BLOB,
            MODIFY ipv6 BLOB,
            MODIFY client BLOB');
        $this->addSql('ALTER TABLE
            bb_bt_tracker MODIFY peer_hash VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
            MODIFY peer_id VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT \'0\' NOT NULL,
            MODIFY ip VARCHAR(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT \'0\' NOT NULL,
            MODIFY ipv6 VARCHAR(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
            MODIFY client VARCHAR(51) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT \'Unknown\' NOT NULL,
            ADD PRIMARY KEY (peer_hash)');
        // delayed from Version20170601000000
        $this->addSql('CREATE INDEX topic_id ON bb_bt_tracker (topic_id)');

        $this->addSql('ALTER TABLE
            bb_bt_tracker_snap CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_bt_user_settings CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');

        // bb_bt_users has utf8*_bin columns
        $this->addSql('ALTER TABLE
            bb_bt_users DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_bt_users DROP INDEX auth_key,
            MODIFY auth_key BLOB');
        $this->addSql('ALTER TABLE
            bb_bt_users MODIFY auth_key char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT \'\',
            ADD UNIQUE KEY auth_key (auth_key)');

        $this->addSql('ALTER TABLE
            bb_categories CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_config CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_cron CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_disallow CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_extension_groups CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_extensions CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_forums CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_groups CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');

        // bb_log has utf8*_bin columns
        $this->addSql('ALTER TABLE
            bb_log DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_log DROP INDEX log_topic_title,
            MODIFY log_user_ip BLOB,
            MODIFY log_topic_title BLOB,
            MODIFY log_topic_title_new BLOB,
            MODIFY log_msg BLOB');
        $this->addSql('ALTER TABLE
            bb_log MODIFY log_user_ip varchar(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT \'0\',
            MODIFY log_topic_title varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'\',
            MODIFY log_topic_title_new varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'\',
            MODIFY log_msg text NOT NULL,
            ADD FULLTEXT KEY log_topic_title (log_topic_title)');

        // bb_poll_users has utf8*_bin columns
        $this->addSql('ALTER TABLE
            bb_poll_users DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_poll_users MODIFY vote_ip BLOB');
        $this->addSql('ALTER TABLE
            bb_poll_users MODIFY vote_ip VARCHAR(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT \'0\' NOT NULL');

        $this->addSql('ALTER TABLE
            bb_poll_votes CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');

        // bb_posts has utf8*_bin columns
        $this->addSql('ALTER TABLE
            bb_posts DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_posts MODIFY poster_ip BLOB,
            MODIFY post_username BLOB,
            MODIFY mc_comment BLOB');
        $this->addSql('ALTER TABLE
            bb_posts MODIFY poster_ip VARCHAR(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT \'0\' NOT NULL,
            MODIFY post_username varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT \'\' NOT NULL,
            MODIFY mc_comment text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL');

        $this->addSql('ALTER TABLE
            bb_posts_html CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_posts_search CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_posts_text CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');

        // bb_privmsgs has utf8*_bin columns
        $this->addSql('ALTER TABLE
            bb_privmsgs DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_privmsgs MODIFY privmsgs_subject BLOB,
            MODIFY privmsgs_ip BLOB');
        $this->addSql('ALTER TABLE
            bb_privmsgs MODIFY privmsgs_subject varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT \'0\' NOT NULL,
            MODIFY privmsgs_ip varchar(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT \'0\' NOT NULL');

        $this->addSql('ALTER TABLE
            bb_privmsgs_text CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_quota_limits CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_ranks CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_search_rebuild CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');

        // bb_search_results has utf8*_bin columns
        $this->addSql('ALTER TABLE
            bb_search_results DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_search_results /* DROP PRIMARY KEY, */
            MODIFY session_id BLOB,
            MODIFY search_id BLOB,
            MODIFY search_settings BLOB,
            MODIFY search_array BLOB');
        $this->addSql('ALTER TABLE
            bb_search_results MODIFY session_id char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
            MODIFY search_id varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
            MODIFY search_settings text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
            MODIFY search_array text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
            ADD PRIMARY KEY (session_id,search_type)');
        // delayed from Version20170601000000
        $this->addSql('CREATE INDEX search_id ON bb_search_results (search_id)');

        // bb_sessions has utf8*_bin columns
        $this->addSql('ALTER TABLE
            bb_sessions DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_sessions DROP PRIMARY KEY,
            MODIFY session_id BLOB,
            MODIFY session_ip BLOB');
        $this->addSql('ALTER TABLE
            bb_sessions MODIFY session_id char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
            MODIFY session_ip varchar(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT \'0\' NOT NULL,
            ADD PRIMARY KEY (session_id)');

        $this->addSql('ALTER TABLE
            bb_smilies CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_topic_tpl CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_topics CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_topics_watch CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_user_group CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');

        // bb_users has utf8*_bin columns
        $this->addSql('ALTER TABLE
            bb_users DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            bb_users DROP INDEX username,
            DROP INDEX user_email,
            MODIFY username BLOB,
            MODIFY user_password BLOB,
            MODIFY user_last_ip BLOB,
            MODIFY user_reg_ip BLOB,
            MODIFY user_lang BLOB,
            MODIFY user_email BLOB,
            MODIFY user_skype BLOB,
            MODIFY user_twitter BLOB,
            MODIFY user_icq BLOB,
            MODIFY user_website BLOB,
            MODIFY user_from BLOB,
            MODIFY user_sig BLOB,
            MODIFY user_occ BLOB,
            MODIFY user_interests BLOB,
            MODIFY user_actkey BLOB,
            MODIFY user_newpasswd BLOB,
            MODIFY autologin_id BLOB,
            MODIFY tpl_name BLOB');
        $this->addSql('ALTER TABLE
            bb_users MODIFY username varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
            MODIFY user_password varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
            MODIFY user_last_ip varchar(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT \'0\' NOT NULL,
            MODIFY user_reg_ip varchar(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT \'0\' NOT NULL,
            MODIFY user_lang varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT \'uk\' NOT NULL,
            MODIFY user_email varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT \'\' NOT NULL,
            MODIFY user_skype varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT \'\' NOT NULL,
            MODIFY user_twitter varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT \'\' NOT NULL,
            MODIFY user_icq varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT \'\' NOT NULL,
            MODIFY user_website varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT \'\' NOT NULL,
            MODIFY user_from varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT \'\' NOT NULL,
            MODIFY user_sig text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
            MODIFY user_occ varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT \'\' NOT NULL,
            MODIFY user_interests varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT \'\' NOT NULL,
            MODIFY user_actkey varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT \'\' NOT NULL,
            MODIFY user_newpasswd varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT \'\' NOT NULL,
            MODIFY autologin_id varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT \'\' NOT NULL,
            MODIFY tpl_name varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT \'default\' NOT NULL,
            ADD KEY username (username),
            ADD KEY user_email (user_email)');

        $this->addSql('ALTER TABLE
            bb_words CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            buf_last_seeder CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
        $this->addSql('ALTER TABLE
            buf_topic_view CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');

        // convert migrations table as well
        //$this->addSql('ALTER TABLE
        //    migrations CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        $this->abortIf(true, 'We do not support downgrade, sorry.');
    }
}
