/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 10.4.32-MariaDB : Database - joga
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`joga` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `joga`;

/*Table structure for table `instruktor` */

DROP TABLE IF EXISTS `instruktor`;

CREATE TABLE `instruktor` (
  `idInstruktor` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ime` varchar(255) DEFAULT NULL,
  `prezime` varchar(255) DEFAULT NULL,
  `brojTelefona` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sifra` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idInstruktor`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `brojTelefona` CHECK (`brojTelefona` like '+381%'),
  CONSTRAINT `sifra` CHECK (octet_length(`sifra`) > 8)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `instruktor` */

insert  into `instruktor`(`idInstruktor`,`ime`,`prezime`,`brojTelefona`,`email`,`sifra`) values 
(1,'Kristina','Ivankovic','+381658755518','ivankovickristinaa@gmail.com','kikakika10'),
(2,'Milica','Matovic','+381990345627','milicamatovic@gmail.com','milicamatovic1'),
(3,'Hristina','Vidakovic','+381679364434','hristinadjordjevic@gmail.com','hristina123');

/*Table structure for table `instruktorsertifikat` */

DROP TABLE IF EXISTS `instruktorsertifikat`;

CREATE TABLE `instruktorsertifikat` (
  `idInstruktor` int(11) unsigned NOT NULL,
  `idSertifikat` int(10) unsigned NOT NULL,
  `datumSticanja` date NOT NULL,
  KEY `idSertifikat` (`idSertifikat`),
  KEY `idInstruktor` (`idInstruktor`),
  CONSTRAINT `idInstruktor` FOREIGN KEY (`idInstruktor`) REFERENCES `instruktor` (`idInstruktor`),
  CONSTRAINT `idSertifikat` FOREIGN KEY (`idSertifikat`) REFERENCES `sertifikat` (`idSertifikat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `instruktorsertifikat` */

insert  into `instruktorsertifikat`(`idInstruktor`,`idSertifikat`,`datumSticanja`) values 
(1,3,'2023-07-11'),
(1,4,'2022-10-25'),
(2,4,'2020-02-19'),
(2,5,'2017-08-20'),
(3,1,'2024-06-04'),
(3,2,'2019-05-12');

/*Table structure for table `jogacas` */

DROP TABLE IF EXISTS `jogacas`;

CREATE TABLE `jogacas` (
  `idJogaCas` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `opisCasa` varchar(255) NOT NULL,
  `trajanje` int(11) NOT NULL,
  `cena` int(11) NOT NULL,
  PRIMARY KEY (`idJogaCas`),
  CONSTRAINT `cena` CHECK (`cena` > 0),
  CONSTRAINT `trajanje` CHECK (`trajanje` >= 40)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `jogacas` */

insert  into `jogacas`(`idJogaCas`,`opisCasa`,`trajanje`,`cena`) values 
(1,'Senior joga',40,1300),
(2,'Joga za trudnice',60,1700),
(3,'Joga za decu',45,1200),
(4,'Pocetnicka joga',50,1350),
(5,'Napredna joga',80,1800),
(6,'Joga za srednji nivo',65,1600),
(7,'Power joga',70,1800),
(8,'Yin joga',75,1850);

/*Table structure for table `kategorijapolaznika` */

DROP TABLE IF EXISTS `kategorijapolaznika`;

CREATE TABLE `kategorijapolaznika` (
  `idKategorijaPolaznika` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `naziv` varchar(255) DEFAULT NULL,
  `opis` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idKategorijaPolaznika`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `kategorijapolaznika` */

insert  into `kategorijapolaznika`(`idKategorijaPolaznika`,`naziv`,`opis`) values 
(1,'Pocetnik','Pocetnici ostvaruju 10% popusta.'),
(2,'Dete','Deca ostvaruju popust od 15%.'),
(3,'Srednji nivo','Srednji nivo polaznika ne ostvaruje popust.'),
(4,'Napredni nivo','Napredni nivo polaznika ne ostvaruje popust.'),
(5,'Senior','Senior polaznici ostvaruju popust od 8%.'),
(6,'Trudnica','Popust za trudnice iznosi 12%.');

/*Table structure for table `polaznik` */

DROP TABLE IF EXISTS `polaznik`;

CREATE TABLE `polaznik` (
  `idPolaznik` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ime` varchar(255) NOT NULL,
  `prezime` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `idKategorijaPolaznika` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idPolaznik`),
  KEY `idKategorijaPolaznika` (`idKategorijaPolaznika`),
  CONSTRAINT `idKategorijaPolaznika` FOREIGN KEY (`idKategorijaPolaznika`) REFERENCES `kategorijapolaznika` (`idKategorijaPolaznika`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `polaznik` */

insert  into `polaznik`(`idPolaznik`,`ime`,`prezime`,`email`,`idKategorijaPolaznika`) values 
(1,'Mila','Ristic','milaristic@gmail.com',6),
(2,'Dusan ','Petrovic','dusanpetrovic@gmail.com',2),
(3,'Dragica','Ostojic','dragicaostojic@gmail.com',5),
(4,'Tamara','Dragicevic','tamaradrag@gmail.com',3),
(7,'Milica','Jokic','milicajokic@gmail.com',4),
(8,'Jovana','Jakovljevic','jovanajakovljevic@gmail.com',1),
(11,'student','studentic','student@gmail.com',4);

/*Table structure for table `priznanica` */

DROP TABLE IF EXISTS `priznanica`;

CREATE TABLE `priznanica` (
  `idPriznanica` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `datumIzdavanja` date NOT NULL,
  `popust` int(11) NOT NULL,
  `ukupanIznos` int(11) NOT NULL,
  `idInstruktor` int(11) unsigned NOT NULL,
  `idPolaznik` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idPriznanica`),
  KEY `idPolaznikk` (`idPolaznik`),
  KEY `idInstruktorr` (`idInstruktor`),
  CONSTRAINT `idInstruktorr` FOREIGN KEY (`idInstruktor`) REFERENCES `instruktor` (`idInstruktor`),
  CONSTRAINT `idPolaznikk` FOREIGN KEY (`idPolaznik`) REFERENCES `polaznik` (`idPolaznik`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `priznanica` */

insert  into `priznanica`(`idPriznanica`,`datumIzdavanja`,`popust`,`ukupanIznos`,`idInstruktor`,`idPolaznik`) values 
(1,'0000-00-00',0,0,1,1);

/*Table structure for table `sertifikat` */

DROP TABLE IF EXISTS `sertifikat`;

CREATE TABLE `sertifikat` (
  `idSertifikat` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `naziv` varchar(255) NOT NULL,
  `jogaAkademija` varchar(255) NOT NULL,
  PRIMARY KEY (`idSertifikat`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `sertifikat` */

insert  into `sertifikat`(`idSertifikat`,`naziv`,`jogaAkademija`) values 
(1,'Sertifikat za instruktora Joge za seniore','Eternal yoga'),
(2,'Sertifikat za instruktora Joge za decu','Kids Yoga Sparkle'),
(3,'Sertifikat za instruktora Joge za trudnice','Integral Yoga Institute'),
(4,'Sertifikat za instruktora Power joge','CorePower Yoga'),
(5,'Sertifikat za instruktora Yin joge','Yoga Medicine');

/*Table structure for table `stavkapriznanice` */

DROP TABLE IF EXISTS `stavkapriznanice`;

CREATE TABLE `stavkapriznanice` (
  `idPriznanica` int(10) unsigned NOT NULL,
  `rb` int(11) NOT NULL DEFAULT 1,
  `brojCasova` int(11) NOT NULL,
  `cena` int(11) NOT NULL,
  `iznosStavke` int(11) NOT NULL,
  `datumPocetka` date NOT NULL,
  `datumZavrsetka` date NOT NULL,
  `napomene` varchar(255) NOT NULL,
  `idJogaCas` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idPriznanica`,`rb`),
  KEY `idJogaCas` (`idJogaCas`),
  CONSTRAINT `idJogaCas` FOREIGN KEY (`idJogaCas`) REFERENCES `jogacas` (`idJogaCas`),
  CONSTRAINT `idPriznanica` FOREIGN KEY (`idPriznanica`) REFERENCES `priznanica` (`idPriznanica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `stavkapriznanice` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
