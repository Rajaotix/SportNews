-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Hôte : remotemysql.com
-- Généré le :  mer. 08 mai 2019 à 06:31
-- Version du serveur :  8.0.13-4
-- Version de PHP :  7.0.33-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 1;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `L1ae1OhD41`
--

-- --------------------------------------------------------

--
-- Structure de la table `actualites`
--


DROP TABLE IF EXISTS `actualites`;
DROP TABLE IF EXISTS `client`;
DROP TABLE IF EXISTS `matches`;
DROP TABLE IF EXISTS `equipe`;
DROP TABLE IF EXISTS `genre`;




-- --------------------------------------------------------

--
-- Structure de la table `client`
--


CREATE TABLE `client` (
  `NOM` char(255) NOT NULL,
  `USERNAME` char(255) NOT NULL,
  `PASSWORD` char(255) NOT NULL,
  `TOKEN` text NOT NULL,
  `AUTORISATION` int(11) NOT NULL,
  `IDCLIENT` int(11) NOT NULL,
  `genre1` int(11) NOT NULL,
  `genre2` int(11) NOT NULL,
  `genre3` int(11) NOT NULL,
  `couleur` varchar(16) NOT NULL,
  `Deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`NOM`, `USERNAME`, `PASSWORD`, `TOKEN`, `AUTORISATION`, `IDCLIENT`, `genre1`, `genre2`, `genre3`, `couleur`, `Deleted`) VALUES
('Tinasoa', 'rajaotix', 'rajaotix', 'ozeiopazieopazieopiaz', 1, 1, 1, 2, 1, 'red', 1),
('Kenny RAKOTOARIMANANA', 'Kenny', 'Testest', 'iusidalejbwcnox_8291', 1, 2, 3, 4, 1, 'blue', 0),
('Rado RATSIAROVANA', 'Rado', 'radoTest', 'ishahd_2123_90', 1, 3, 3, 1, 4, 'red', 0);


-- --------------------------------------------------------

--
-- Structure de la table `genre`
--


CREATE TABLE `genre` (
  `NOM` char(255) NOT NULL,
  `IDGENRE` int(11) NOT NULL,
  `Deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`NOM`, `IDGENRE`, `Deleted`) VALUES
('Football', 1, 0),
('BasketBall', 2, 0),
('Tennis', 3, 0),
('Natation', 4, 0);


CREATE TABLE `actualites` (
  `IDCLIENT` int(11) NOT NULL,
  `IDGENRE` int(11) NOT NULL,
  `DATE` date NOT NULL,
  `TITRE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` text NOT NULL,
  `CONTENUE` text,
  `IMAGE` text NOT NULL,
  `IMGDESCRI` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IDACTU` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `actualites`
--

INSERT INTO `actualites` (`IDCLIENT`, `IDGENRE`, `DATE`, `TITRE`, `DESCRIPTION`, `CONTENUE`, `IMAGE`, `IMGDESCRI`, `IDACTU`) VALUES
(1, 1, '2019-05-15', 'Tix1', 'test1', 'TeestContenue foot', 'azejazklejaklzjelazjelkazje', 'Test1', 1),
(1, 2, '2019-05-24', 'Basket1', 'azejazlkjeazljelaj', 'Test Contenue Basket', 'akzjelkazjelkajekljalkej', 'Basket1', 2),
(2, 3, '2019-03-06', 'Tennis1', 'Test tennis 1 ', 'Test Contenue Tennis', 'azoiueioazueioazueioazueoiazueoiazioeuazoieuajsdklsjdnncoiajze a', 'Tennis1', 3),
(3, 4, '2019-05-16', 'Natation 1', 'Description Natation 1', 'Test Contenue NAtation', 'natation1', 'Natation1', 4);


-- --------------------------------------------------------

--
-- Structure de la table `matches`
--

CREATE TABLE `equipe` (
  `IDEQUIPE` int(11) NOT NULL,
  `IDGENRE` int(11) NOT NULL,
  `NOMEQUIPE` char(255) NOT NULL,
  `Deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `matches` (
  `IDEQUIPE1` int(11) NOT NULL,
  `IDEQUIPE2` int(11) NOT NULL,
  `SCOREEQUIPE1` int(11) NOT NULL,
  `SCOREEQUIPE2` int(11) NOT NULL,
  `DATE` date NOT NULL,
  `TERMINEE` int(11) NOT NULL,
  `GAGNANTS` int(11) NOT NULL,
  `IDMATCHES` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `equipe`
--


--
-- Index pour les tables déchargées
--

--
-- Index pour la table `actualites`
--
ALTER TABLE `actualites`
  ADD PRIMARY KEY (`IDACTU`),
  ADD KEY `FK_ACTUALITES` (`IDCLIENT`),
  ADD KEY `FK_ACTUALITES2` (`IDGENRE`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`IDCLIENT`);

--
-- Index pour la table `equipe`
--
ALTER TABLE `equipe`
  ADD PRIMARY KEY (`IDEQUIPE`),
  ADD KEY `FK_RELATION_1` (`IDGENRE`);

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`IDGENRE`);

--
-- Index pour la table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`IDMATCHES`),
  ADD KEY `FK_MATCHES` (`IDEQUIPE1`),
  ADD KEY `FK_MATCHES2` (`IDEQUIPE2`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `actualites`
--
ALTER TABLE `actualites`
  MODIFY `IDACTU` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `IDCLIENT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `equipe`
--
ALTER TABLE `equipe`
  MODIFY `IDEQUIPE` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `genre`
--
ALTER TABLE `genre`
  MODIFY `IDGENRE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `matches`
--
ALTER TABLE `matches`
  MODIFY `IDMATCHES` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `actualites`
--
ALTER TABLE `actualites`
  ADD CONSTRAINT `FK_ACTUALITES` FOREIGN KEY (`IDCLIENT`) REFERENCES `client` (`idclient`),
  ADD CONSTRAINT `FK_ACTUALITES2` FOREIGN KEY (`IDGENRE`) REFERENCES `genre` (`idgenre`);

--
-- Contraintes pour la table `equipe`
--
ALTER TABLE `equipe`
  ADD CONSTRAINT `FK_RELATION_1` FOREIGN KEY (`IDGENRE`) REFERENCES `genre` (`idgenre`);

--
-- Contraintes pour la table `matches`
--
ALTER TABLE `matches`
  ADD CONSTRAINT `FK_MATCHES` FOREIGN KEY (`IDEQUIPE1`) REFERENCES `equipe` (`idequipe`),
  ADD CONSTRAINT `FK_MATCHES2` FOREIGN KEY (`IDEQUIPE2`) REFERENCES `equipe` (`idequipe`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
