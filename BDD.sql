SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;

CREATE DATABASE `Pizza` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `Pizza`;

DROP TABLE IF EXISTS `T_CAL`;
CREATE TABLE `T_CAL` (
  `Jour_Ouvrable` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`Jour_Ouvrable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `T_CLIENT`;
CREATE TABLE `T_CLIENT` (
  `C_Telephone` int(11) NOT NULL,
  `C_nom` varchar(100) NOT NULL,
  `C_prenom` varchar(100) NOT NULL,
  `numero` int(11) NOT NULL,
  `rue` varchar(100) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `etage` int(11) NOT NULL,
  PRIMARY KEY (`C_Telephone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `T_DETAIL_LIVRAISON`;
CREATE TABLE `T_DETAIL_LIVRAISON` (
  `REF_Pizza` varchar(100) NOT NULL,
  `REF_Taille` varchar(100) NOT NULL,
  `REF_Date_Livraison` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `REF_Numero_Ordre` int(11) NOT NULL,
  `Quantite` int(11) NOT NULL,
  PRIMARY KEY (`REF_Pizza`,`REF_Taille`,`REF_Date_Livraison`,`REF_Numero_Ordre`),
  KEY `REF_Pizza` (`REF_Pizza`),
  KEY `REF_Taille` (`REF_Taille`),
  KEY `REF_Date_Livraison` (`REF_Date_Livraison`),
  KEY `REF_Numero_Ordre` (`REF_Numero_Ordre`),
  KEY `REF_Date_Livraison_2` (`REF_Date_Livraison`,`REF_Numero_Ordre`),
  CONSTRAINT `T_DETAIL_LIVRAISON_ibfk_1` FOREIGN KEY (`REF_Date_Livraison`, `REF_Numero_Ordre`) REFERENCES `T_LIVRAISON` (`Date`, `Numero_Ordre`),
  CONSTRAINT `T_DETAIL_LIVRAISON_ibfk_2` FOREIGN KEY (`REF_Pizza`, `REF_Taille`) REFERENCES `T_TARIFS` (`REF_Pizza`, `REF_Taille`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `T_GARNITURE`;
CREATE TABLE `T_GARNITURE` (
  `REF_Ingredient` varchar(100) NOT NULL,
  `REF_Pizza` varchar(100) NOT NULL,
  PRIMARY KEY (`REF_Ingredient`,`REF_Pizza`),
  KEY `REF_Ingredient` (`REF_Ingredient`),
  KEY `REF_Pizza` (`REF_Pizza`),
  CONSTRAINT `T_GARNITURE_ibfk_1` FOREIGN KEY (`REF_Ingredient`) REFERENCES `T_INGREDIENT` (`LIB_Ingredient`),
  CONSTRAINT `T_GARNITURE_ibfk_2` FOREIGN KEY (`REF_Pizza`) REFERENCES `T_PIZZA` (`Nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `T_INGREDIENT`;
CREATE TABLE `T_INGREDIENT` (
  `LIB_Ingredient` varchar(100) NOT NULL,
  PRIMARY KEY (`LIB_Ingredient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `T_LIVRAISON`;
CREATE TABLE `T_LIVRAISON` (
  `Date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Numero_Ordre` int(11) NOT NULL,
  `Heure` int(11) NOT NULL,
  `REF_Livreur` int(11) NOT NULL,
  `REF_Client` int(11) NOT NULL,
  PRIMARY KEY (`Date`,`Numero_Ordre`),
  KEY `Date` (`Date`),
  KEY `REF_Livreur` (`REF_Livreur`),
  KEY `REF_Client` (`REF_Client`),
  CONSTRAINT `T_LIVRAISON_ibfk_1` FOREIGN KEY (`REF_Client`) REFERENCES `T_CLIENT` (`C_Telephone`),
  CONSTRAINT `T_LIVRAISON_ibfk_2` FOREIGN KEY (`REF_Livreur`) REFERENCES `T_LIVREUR` (`L_Telephone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `T_LIVREUR`;
CREATE TABLE `T_LIVREUR` (
  `L_Telephone` int(11) NOT NULL,
  `L_Nom` varchar(100) NOT NULL,
  `L_Prenom` varchar(100) NOT NULL,
  PRIMARY KEY (`L_Telephone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `T_PIZZA`;
CREATE TABLE `T_PIZZA` (
  `Nom` varchar(100) NOT NULL,
  PRIMARY KEY (`Nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `T_TAILLE`;
CREATE TABLE `T_TAILLE` (
  `LIB_Taille` varchar(100) NOT NULL,
  PRIMARY KEY (`LIB_Taille`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `T_TARIFS`;
CREATE TABLE `T_TARIFS` (
  `REF_Pizza` varchar(100) NOT NULL,
  `REF_Taille` varchar(100) NOT NULL,
  `Prix` int(11) NOT NULL,
  PRIMARY KEY (`REF_Pizza`,`REF_Taille`),
  KEY `REF_Pizza` (`REF_Pizza`),
  KEY `REF_Taile` (`REF_Taille`),
  CONSTRAINT `T_TARIFS_ibfk_1` FOREIGN KEY (`REF_Pizza`) REFERENCES `T_PIZZA` (`Nom`),
  CONSTRAINT `T_TARIFS_ibfk_2` FOREIGN KEY (`REF_Taille`) REFERENCES `T_TAILLE` (`LIB_Taille`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
