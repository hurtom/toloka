<?php

namespace Database\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Thanks button
 * @see https://github.com/hurtom/toloka/issues/23
 * @see https://github.com/hurtom/toloka/pull/53
 */
class Version20170702234405 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        if (!$schema->hasTable('bb_attachments_rating')) {
            $this->addSql('CREATE TABLE bb_attachments_rating (
                attach_id INT UNSIGNED NOT NULL,
                user_id INT NOT NULL,
                thanked TINYINT(1) DEFAULT 0 NOT NULL,
                rating TINYINT(1) DEFAULT 0 NOT NULL,
                PRIMARY KEY (attach_id,user_id)
            ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        } else {
            $this->addSql('ALTER TABLE bb_attachments_rating
                CHANGE attach_id attach_id INT UNSIGNED NOT NULL,
                CHANGE user_id user_id INT NOT NULL,
                CHANGE thanked thanked TINYINT(1) DEFAULT 0 NOT NULL,
                CHANGE rating rating TINYINT(1) DEFAULT 0 NOT NULL,
                ENGINE = InnoDB');
        }
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        $this->abortIf(true, 'We do not support downgrade, sorry.');
    }
}
