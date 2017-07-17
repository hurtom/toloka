<?php

namespace Database\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Migration: v2.2.1 to v2.2.2
 */
class Version20170622222213 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        $table = $schema->getTable('bb_ranks');
        if ($table->hasColumn('rank_min')) {
            $table->dropColumn('rank_min');
        }
        if ($table->hasColumn('rank_special')) {
            $table->dropColumn('rank_special');
        }
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE bb_ranks 
          ADD rank_min     MEDIUMINT(8) NOT NULL DEFAULT \'0\' AFTER rank_title, 
          ADD rank_special TINYINT(1)   NOT NULL DEFAULT \'1\' AFTER rank_min');
    }
}
