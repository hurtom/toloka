<?php

namespace Database\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Migration: Update TorrentPier to v2.2.0
 *
 * This one is to reflect changes applied during update of TP database to v2.2.0
 * @see https://github.com/hurtom/toloka/blob/master/install/upgrade/changes.txt#L5-L30
 *
 * - Drop bb_ads table
 * - At this point all `*_ip` columns are being reset to '0'
 */
class Version20170612033139 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        $this->addSql('UPDATE bb_config SET config_value = ? WHERE config_name = ?',
            ['http://whatismyipaddress.com/ip/', 'whois_info']);

        $this->addSql('DELETE FROM bb_smilies WHERE code = ?',
            [':ad:']);

        $emojiExists = $this->connection->fetchAssoc('SELECT 1 FROM bb_smilies WHERE code = ? LIMIT 1',
            [':сd:']);
        if (!$emojiExists) {
            $this->addSql('INSERT INTO bb_smilies VALUES (?, ?, ?, ?)',
                [null, ':сd:', 'сd.gif', 'сd']);
        }

        $this->addSql('DROP TABLE IF EXISTS bb_ads');
        $this->addSql('DELETE FROM bb_config WHERE config_name = ?',
            ['active_ads']);

        if ($schema->getTable('bb_log')->hasColumn('log_username')) {
            $this->addSql('ALTER TABLE bb_log DROP COLUMN log_username');
        }

        $this->addSql('DELETE FROM bb_config WHERE config_name = ?',
            ['new_tpls']);

        /*
         * Change format of `*_ip` columns and reset to '0'
         */
        $this->addSql('UPDATE bb_posts SET poster_ip = ?', ['0']);
        /* Same changes will be applied during charset conversion
        $this->addSql('ALTER TABLE bb_posts
            CHANGE poster_ip poster_ip varchar(42) NOT NULL DEFAULT \'0\' COLLATE utf8_bin'); */

        $this->addSql('UPDATE bb_bt_tracker SET ip = ?', ['0']);
        /* Same changes will be applied during charset conversion
        $this->addSql('ALTER TABLE bb_bt_tracker
            CHANGE ip ip varchar(42) NOT NULL DEFAULT \'0\' COLLATE utf8_bin'); */

        $this->addSql('UPDATE bb_users
            SET user_last_ip = ?,
                user_reg_ip = ?',
            ['0', '0']);
        /* Same changes will be applied during charset conversion
        $this->addSql('ALTER TABLE bb_users
            CHANGE user_last_ip user_last_ip varchar(42) NOT NULL DEFAULT \'0\' COLLATE utf8_bin,
            CHANGE user_reg_ip user_reg_ip varchar(42) NOT NULL DEFAULT \'0\' COLLATE utf8_bin'); */

        $this->addSql('UPDATE bb_log SET log_user_ip = ?', ['0']);
        /* Same changes will be applied during charset conversion
        $this->addSql('ALTER TABLE bb_log
            CHANGE log_user_ip log_user_ip varchar(42) NOT NULL DEFAULT \'0\' COLLATE utf8_bin'); */

        $this->addSql('UPDATE bb_poll_users SET vote_ip = ?', ['0']);
        /* Same changes will be applied during charset conversion
        $this->addSql('ALTER TABLE bb_poll_users
            CHANGE vote_ip vote_ip varchar(42) NOT NULL DEFAULT \'0\' COLLATE utf8_bin'); */

        $this->addSql('UPDATE bb_privmsgs SET privmsgs_ip = ?', ['0']);
        /* Same changes will be applied during charset conversion
        $this->addSql('ALTER TABLE bb_privmsgs
            CHANGE privmsgs_ip privmsgs_ip varchar(42) NOT NULL DEFAULT \'0\' COLLATE utf8_bin'); */

        $this->addSql('UPDATE bb_sessions SET session_ip = ?', ['0']);
        /* Same changes will be applied during charset conversion
        $this->addSql('ALTER TABLE bb_sessions
            CHANGE session_ip session_ip varchar(42) NOT NULL DEFAULT \'0\' COLLATE utf8_bin'); */

        $this->addSql('UPDATE bb_banlist SET ban_ip = ?', ['0']);
        /* Same changes will be applied during charset conversion
        $this->addSql('ALTER TABLE bb_banlist
            CHANGE ban_ip ban_ip varchar(42) NOT NULL DEFAULT \'0\' COLLATE utf8_bin'); */
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        $this->abortIf(true, 'We do not support downgrade, sorry.');
    }
}
