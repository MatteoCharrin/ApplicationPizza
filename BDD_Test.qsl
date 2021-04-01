SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

INSERT INTO `T_CAL` (`Jour_Ouvrable`) VALUES
('2021-03-31 22:00:00');

INSERT INTO `T_CLIENT` (`C_Telephone`, `C_nom`, `C_prenom`, `numero`, `rue`, `ville`, `etage`) VALUES
(981845784,	'Sayo',	'CHA',	4,	'De la rue',	'St etienne',	34);

INSERT INTO `T_DETAIL_LIVRAISON` (`REF_Pizza`, `REF_Taille`, `REF_Date_Livraison`, `REF_Numero_Ordre`, `Quantite`) VALUES
('Chorizo',	'Petite',	'2021-04-01 12:46:22',	2,	2);

INSERT INTO `T_GARNITURE` (`REF_Ingredient`, `REF_Pizza`) VALUES
('Chorizo',	'Chorizo');

INSERT INTO `T_INGREDIENT` (`LIB_Ingredient`) VALUES
('Chorizo'),
('Fromage'),
('Poivron'),
('Tomate');

INSERT INTO `T_LIVRAISON` (`Date`, `Numero_Ordre`, `Heure`, `REF_Livreur`, `REF_Client`) VALUES
('2021-04-01 12:46:22',	2,	21,	1234567892,	981845784);

INSERT INTO `T_LIVREUR` (`L_Telephone`, `L_Nom`, `L_Prenom`) VALUES
(658357,	'Tom',	'CHI'),
(1234567892,	'Kevin',	'LO');

INSERT INTO `T_PIZZA` (`Nom`) VALUES
('Caviar'),
('Chorizo'),
('Margarita');

INSERT INTO `T_TAILLE` (`LIB_Taille`) VALUES
('grande'),
('moyenne'),
('petite');

INSERT INTO `T_TARIFS` (`REF_Pizza`, `REF_Taille`, `Prix`) VALUES
('Chorizo',	'Moyenne',	12),
('Chorizo',	'Petite',	10),
('Margarita',	'Moyenne',	10),
('Margarita',	'Petite',	9);
