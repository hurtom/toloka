<?php

namespace Database\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema as Schema;

/**
 * Migrate user passwords to password_hash()
 * @see https://github.com/hurtom/toloka/issues/50
 * @see https://github.com/hurtom/toloka/pull/54
 *
 * Preparation is done in Version20170601000000
 * @see Version20170601000000::upPrepareMigrateUserPasswords()
 */
class Version20170822223550 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        if ($schema->hasTable('tmp_migrate_users')) {
            $this->addSql('UPDATE bb_users u, tmp_migrate_users tmp
                SET u.user_password = tmp.password
                WHERE u.user_id = tmp.id');
            $this->addSql('DROP TABLE tmp_migrate_users');
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
