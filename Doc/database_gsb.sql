-- phpMyAdmin SQL Dump
-- version 3.3.9.1
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Dim 04 Novembre 2012 à 16:38
-- Version du serveur: 5.5.9
-- Version de PHP: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `gsb_ticket`
--
CREATE DATABASE `gsb_ticket` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `gsb_ticket`;

-- --------------------------------------------------------

--
-- Structure de la table `gsb_avoir`
--

CREATE TABLE IF NOT EXISTS `gsb_avoir` (
  `id_ticket` int(10) NOT NULL DEFAULT '0',
  `id_etat` int(10) NOT NULL DEFAULT '0',
  `date_etat` date DEFAULT NULL,
  PRIMARY KEY (`id_ticket`,`id_etat`),
  KEY `id_ticket` (`id_ticket`),
  KEY `id_etat` (`id_etat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `gsb_categorie`
--

CREATE TABLE IF NOT EXISTS `gsb_categorie` (
  `id_categorie` int(10) NOT NULL AUTO_INCREMENT,
  `nom_categorie` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `gsb_categorie`
--

INSERT INTO `gsb_categorie` (`id_categorie`, `nom_categorie`) VALUES
(1, 'Poste'),
(2, 'Imprimante'),
(3, 'Autres'),
(4, 'Windows'),
(5, 'Bureautique'),
(6, 'Autres');

-- --------------------------------------------------------

--
-- Structure de la table `gsb_etat`
--

CREATE TABLE IF NOT EXISTS `gsb_etat` (
  `id_etat` int(10) NOT NULL AUTO_INCREMENT,
  `nom_etat` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_etat`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `gsb_etat`
--

INSERT INTO `gsb_etat` (`id_etat`, `nom_etat`) VALUES
(1, 'En attente'),
(2, 'En cours de traitement'),
(3, 'Traité');

-- --------------------------------------------------------

--
-- Structure de la table `gsb_priorite`
--

CREATE TABLE IF NOT EXISTS `gsb_priorite` (
  `id_priorite` int(10) NOT NULL AUTO_INCREMENT,
  `nom_priorite` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_priorite`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `gsb_priorite`
--

INSERT INTO `gsb_priorite` (`id_priorite`, `nom_priorite`) VALUES
(1, 'Basse'),
(2, 'Normal'),
(3, 'Haute');

-- --------------------------------------------------------

--
-- Structure de la table `gsb_ticket`
--

CREATE TABLE IF NOT EXISTS `gsb_ticket` (
  `id_ticket` int(10) NOT NULL AUTO_INCREMENT,
  `titre_ticket` varchar(255) DEFAULT NULL,
  `contenu_ticket` text,
  `date_creation_ticket` datetime DEFAULT NULL,
  `id_categorie` int(10) DEFAULT NULL,
  `id_priorite` int(10) DEFAULT NULL,
  `id_utilisateur` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_ticket`),
  KEY `id_categorie` (`id_categorie`),
  KEY `id_priorite` (`id_priorite`),
  KEY `id_utilisateur` (`id_utilisateur`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Structure de la table `gsb_utilisateur`
--

CREATE TABLE IF NOT EXISTS `gsb_utilisateur` (
  `id_utilisateur` int(10) NOT NULL AUTO_INCREMENT,
  `nom_utilisateur` varchar(100) DEFAULT NULL,
  `prenom_utilisateur` varchar(100) DEFAULT NULL,
  `mail_utilisateur` varchar(100) DEFAULT NULL,
  `mdp_utilisateur` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_utilisateur`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `gsb_avoir`
--
ALTER TABLE `gsb_avoir`
  ADD CONSTRAINT `id_etat_fk1` FOREIGN KEY (`id_etat`) REFERENCES `gsb_etat` (`id_etat`),
  ADD CONSTRAINT `id_ticket_fk2` FOREIGN KEY (`id_ticket`) REFERENCES `gsb_ticket` (`id_ticket`);

--
-- Contraintes pour la table `gsb_ticket`
--
ALTER TABLE `gsb_ticket`
  ADD CONSTRAINT `id_categorie_fk1` FOREIGN KEY (`id_categorie`) REFERENCES `gsb_categorie` (`id_categorie`),
  ADD CONSTRAINT `id_priorite_fk1` FOREIGN KEY (`id_priorite`) REFERENCES `gsb_priorite` (`id_priorite`),
  ADD CONSTRAINT `id_utilisateur_fk2` FOREIGN KEY (`id_utilisateur`) REFERENCES `gsb_utilisateur` (`id_utilisateur`);
