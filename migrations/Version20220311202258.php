<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220311202258 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE cliente (id INT AUTO_INCREMENT NOT NULL, nombre VARCHAR(200) NOT NULL, apellidos VARCHAR(200) DEFAULT NULL, telefono VARCHAR(12) NOT NULL, direccion VARCHAR(200) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE usuario (id INT AUTO_INCREMENT NOT NULL, email VARCHAR(180) NOT NULL, roles LONGTEXT NOT NULL COMMENT \'(DC2Type:json)\', password VARCHAR(255) NOT NULL, nombre VARCHAR(200) NOT NULL, apellidos VARCHAR(200) NOT NULL, telefono VARCHAR(12) NOT NULL, foto VARCHAR(200) NOT NULL, UNIQUE INDEX UNIQ_2265B05DE7927C74 (email), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE incidencia ADD CONSTRAINT FK_C7C6728C7EB2C349 FOREIGN KEY (id_usuario_id) REFERENCES usuario (id)');
        $this->addSql('ALTER TABLE incidencia ADD CONSTRAINT FK_C7C6728CDE734E51 FOREIGN KEY (cliente_id) REFERENCES cliente (id)');
        $this->addSql('ALTER TABLE lineas_de_incidencia ADD CONSTRAINT FK_7FA37BA1E1605BE2 FOREIGN KEY (incidencia_id) REFERENCES incidencia (id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE incidencia DROP FOREIGN KEY FK_C7C6728CDE734E51');
        $this->addSql('ALTER TABLE incidencia DROP FOREIGN KEY FK_C7C6728C7EB2C349');
        $this->addSql('DROP TABLE cliente');
        $this->addSql('DROP TABLE usuario');
        $this->addSql('ALTER TABLE lineas_de_incidencia DROP FOREIGN KEY FK_7FA37BA1E1605BE2');
    }
}
