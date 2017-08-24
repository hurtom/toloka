<?php

namespace Database\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Migration: Add Doctrine type hinting for ENUM culumns
 */
class Version20170717000000 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE bb_cron
          CHANGE schedule schedule ENUM(
            \'hourly\', \'daily\', \'weekly\', \'monthly\',
            \'interval\'
          ) DEFAULT \'daily\' NOT NULL COMMENT \'(DC2Type:enumcronschedule)\',
          CHANGE run_day run_day ENUM(
            \'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\',
            \'9\', \'10\', \'11\', \'12\', \'13\', \'14\', \'15\',
            \'16\', \'17\', \'18\', \'19\', \'20\', \'21\',
            \'22\', \'23\', \'24\', \'25\', \'26\', \'27\',
            \'28\'
          ) DEFAULT NULL COMMENT \'(DC2Type:enumcronrunday)\'');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        $this->abortIf(true, 'We do not support downgrade, sorry.');
    }
}
