-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mar 07 Mai 2019 à 06:57
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `sportnew`
--

-- --------------------------------------------------------

--
-- Structure de la table `actualites`
--

CREATE TABLE `actualites` (
  `IDCLIENT` int(11) NOT NULL,
  `IDGENRE` int(11) NOT NULL,
  `DATE` date NOT NULL,
  `TITRE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` text NOT NULL,
  `CONTENUE` text,
  `IMAGE` text NOT NULL,
  `IDACTU` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `actualites`
--

INSERT INTO `actualites` (`IDCLIENT`, `IDGENRE`, `DATE`, `TITRE`, `DESCRIPTION`, `CONTENUE`, `IMAGE`, `IDACTU`) VALUES
(1, 1, '2019-05-15', 'Tix1', 'test1', 'TeestContenue foot', 'azejazklejaklzjelazjelkazje', 1),
(1, 2, '2019-05-24', 'Basket1', 'azejazlkjeazljelaj', 'Test Contenue Basket', 'akzjelkazjelkajekljalkej', 2),
(2, 3, '2019-03-06', 'Tennis1', 'Test tennis 1 ', 'Test Contenue Tennis', 'azoiueioazueioazueioazueoiazueoiazioeuazoieuajsdklsjdnncoiajze a', 3),
(3, 4, '2019-05-16', 'Natation 1', 'Description Natation 1', 'Test Contenue NAtation', 'natation1', 4);

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
-- Contenu de la table `client`
--

INSERT INTO `client` (`NOM`, `USERNAME`, `PASSWORD`, `TOKEN`, `AUTORISATION`, `IDCLIENT`, `genre1`, `genre2`, `genre3`, `couleur`, `Deleted`) VALUES
('Tinasoa', 'rajaotix', 'rajaotix', 'ozeiopazieopazieopiaz', 1, 1, 1, 2, 1, 'red', 1),
('Kenny RAKOTOARIMANANA', 'Kenny', 'Testest', 'iusidalejbwcnox_8291', 1, 2, 3, 4, 1, 'blue', 0),
('Rado RATSIAROVANA', 'Rado', 'radoTest', 'ishahd_2123_90', 1, 3, 3, 1, 4, 'red', 0);

-- --------------------------------------------------------

--
-- Structure de la table `equipe`
--

CREATE TABLE `equipe` (
  `IDEQUIPE` int(11) NOT NULL,
  `IDGENRE` int(11) NOT NULL,
  `NOMEQUIPE` char(255) NOT NULL,
  `Deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Contenu de la table `genre`
--

INSERT INTO `genre` (`NOM`, `IDGENRE`, `Deleted`) VALUES
('Football', 1, 0),
('BasketBall', 2, 0),
('Tennis', 3, 0),
('Natation', 4, 0);

-- --------------------------------------------------------

--
-- Structure de la table `matches`
--

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

--
-- Index pour les tables exportées
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
-- AUTO_INCREMENT pour les tables exportées
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
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `actualites`
--
ALTER TABLE `actualites`
  ADD CONSTRAINT `FK_ACTUALITES` FOREIGN KEY (`IDCLIENT`) REFERENCES `client` (`IDCLIENT`),
  ADD CONSTRAINT `FK_ACTUALITES2` FOREIGN KEY (`IDGENRE`) REFERENCES `genre` (`IDGENRE`);

--
-- Contraintes pour la table `equipe`
--
ALTER TABLE `equipe`
  ADD CONSTRAINT `FK_RELATION_1` FOREIGN KEY (`IDGENRE`) REFERENCES `genre` (`IDGENRE`);

--
-- Contraintes pour la table `matches`
--
ALTER TABLE `matches`
  ADD CONSTRAINT `FK_MATCHES` FOREIGN KEY (`IDEQUIPE1`) REFERENCES `equipe` (`IDEQUIPE`),
  ADD CONSTRAINT `FK_MATCHES2` FOREIGN KEY (`IDEQUIPE2`) REFERENCES `equipe` (`IDEQUIPE`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
