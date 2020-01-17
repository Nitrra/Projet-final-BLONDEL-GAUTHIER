-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 17 jan. 2020 à 07:59
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `biblio`
--

-- --------------------------------------------------------

--
-- Structure de la table `connexion`
--

DROP TABLE IF EXISTS `connexion`;
CREATE TABLE IF NOT EXISTS `connexion` (
  `email` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `connexion`
--

INSERT INTO `connexion` (`email`, `mdp`) VALUES
('durandjp@snir.fr', '*2F55E0C9A84487B9BA32E75728EE4F4D93BA2703'),
('brieuselc@snir.fr', '*2F55E0C9A84487B9BA32E75728EE4F4D93BA2703'),
('riolsj@snir.fr', '*2F55E0C9A84487B9BA32E75728EE4F4D93BA2703'),
('denayh@snir.fr', '*2F55E0C9A84487B9BA32E75728EE4F4D93BA2703'),
('planchona@snir.fr', '*2F55E0C9A84487B9BA32E75728EE4F4D93BA2703'),
('peneg@snir.fr', '*2F55E0C9A84487B9BA32E75728EE4F4D93BA2703'),
('bertjp@snir.fr', '*2F55E0C9A84487B9BA32E75728EE4F4D93BA2703'),
('gonzalesa@snir.fr', '*2F55E0C9A84487B9BA32E75728EE4F4D93BA2703'),
('martinf@snir.fr', '*2F55E0C9A84487B9BA32E75728EE4F4D93BA2703'),
('jourdav@snir.fr', '*2F55E0C9A84487B9BA32E75728EE4F4D93BA2703'),
('ilan@snir.fr', '$2y$10$y7BLXLjrUCiyPwhMxGAme.gFcU6FpZvTtilI4VABqTM818dZfZ742'),
('leffe@blonde.fr', '$2y$10$V/alj3684LQKCOJf0KxJ1urIcXq.93lqQUqmbs96t3HA4dBvmTPRm'),
('putain@p.fr', '$2y$10$/PqoxZmJpPJewvTvWdhEQ.YmHNc/QkE2DWiBLQBJftH/sE4vPupSW'),
('putain@r.fr', '$2y$10$6SDblDpQNYWJO8aqSNRd1e.3FxKBGWoohpwObixkwXN2gxsAlPYk6'),
('aa@a', '$2y$10$BztTx3mZeNilwaFIvUB3Vuxh1zyaIB3yhberEEJL3p5xF7mHGPIaq'),
('regine.julien@euca.fr', '$2y$10$gIUScyJGy8aAXCQIrqG41OMMqN.eMVlAM.cVxQCj3UATYhhCUaV92'),
('il@n.fr', '$2y$10$SVNa04kdTZM9ZDu0sqqi4eWvxecK9wJzqY.VOlgtsBAs2KWIyEM/m'),
('ek@s.fr', '$2y$10$RSmKzUuXdpaO1DgyanOK5OQVQVG32ErC1SIYJ63v7fac6AlUc6Szq'),
('tu@a', '$2y$10$3aIqhml7nGfEmeUdoauDze1L33c1NcUkLQgJgHamxO2FD6H8dqXdy'),
('biblio@biblio.fr', '$2y$10$0G1T5Bk8XyC1OfEdjvrNd.yLBLUXbgxjWKgcqg2l9BuDoKvYBBY9a');

-- --------------------------------------------------------

--
-- Structure de la table `emprunt`
--

DROP TABLE IF EXISTS `emprunt`;
CREATE TABLE IF NOT EXISTS `emprunt` (
  `numpersonne` int(11) NOT NULL,
  `numlivre` int(11) NOT NULL,
  `sortie` date NOT NULL,
  `retour` date DEFAULT NULL,
  PRIMARY KEY (`numpersonne`,`numlivre`,`sortie`),
  KEY `numlivre` (`numlivre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `emprunt`
--

INSERT INTO `emprunt` (`numpersonne`, `numlivre`, `sortie`, `retour`) VALUES
(1, 3, '1999-03-03', '1999-03-30'),
(2, 11, '1999-03-18', NULL),
(3, 3, '1999-03-30', '1999-04-15'),
(3, 4, '1999-03-30', NULL),
(4, 14, '1999-01-01', NULL),
(5, 7, '2020-01-18', NULL),
(7, 7, '2020-01-09', NULL),
(7, 9, '1999-05-03', '1999-03-21'),
(8, 1, '1999-04-02', NULL),
(8, 7, '1999-03-31', '1999-04-18');

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

DROP TABLE IF EXISTS `livre`;
CREATE TABLE IF NOT EXISTS `livre` (
  `numlivre` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) NOT NULL,
  `auteur` varchar(200) NOT NULL,
  `genre` enum('Roman','Poesie','Nouvelles','Autres') NOT NULL DEFAULT 'Roman',
  `prix` int(11) DEFAULT NULL,
  PRIMARY KEY (`numlivre`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livre`
--

INSERT INTO `livre` (`numlivre`, `titre`, `auteur`, `genre`, `prix`) VALUES
(1, 'Les chouans', 'Balzac', 'Roman', 80),
(2, 'Germinal', 'Zola', 'Roman', 75),
(3, 'L\'assommoir', 'Zola', 'Roman', 95),
(4, 'La bête humaine', 'Zola', 'Roman', 70),
(5, 'Les misérables', 'Hugo', 'Roman', 105),
(6, 'La peste', 'Camus', 'Roman', 112),
(7, 'Les lettres persanes', 'Maupassant', 'Roman', 140),
(8, 'Bel ami', 'Maupassant', 'Roman', 76),
(9, 'Les lettres de mon moulin', 'Daudet', 'Roman', 100),
(10, 'César', 'Pagnol', 'Roman', 100),
(11, 'Marius', 'Pagnol', 'Roman', 65),
(12, 'Fanny', 'Pagnol', 'Roman', 72),
(13, 'Les fleurs du mal', 'Baudelaire', 'Poesie', 130),
(14, 'Paroles', 'Prévert', 'Poesie', 120),
(15, 'Les raisins de la colère', 'Steinberck', 'Roman', 135),
(17, 'pass dextension pokemon', 'nintendo', 'Autres', 54),
(18, 'pass dextension pokemon 2', 'nintendo', 'Poesie', 87),
(20, 'pass dextension pokemon 2', 'nintendo', 'Autres', 87),
(21, 'pass dextension pokemon 2', 'nintendo', 'Nouvelles', 87),
(23, 'pass dextension pokemon 4', 'nintendo', 'Autres', 57);

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

DROP TABLE IF EXISTS `personne`;
CREATE TABLE IF NOT EXISTS `personne` (
  `numpersonne` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) NOT NULL,
  `prenom` varchar(200) NOT NULL,
  `ville` varchar(200) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`numpersonne`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`numpersonne`, `nom`, `prenom`, `ville`, `email`) VALUES
(1, 'Durand', 'Jean-Pierre', 'Toulouse', 'durandjp@snir.fr'),
(2, 'Brieusel', 'Chantai', 'Colomiers', 'brieuselc@snir.fr'),
(3, 'Riols', 'Jacques', 'Toulouse', 'riolsj@snir.fr'),
(4, 'Denayville', 'hélêne', 'Toulouse', 'denayh@snir.fr'),
(5, 'Planchon', 'André', 'Muret', 'planchona@snir.fr'),
(6, 'Pêne', 'Gérôme', 'Albi', 'peneg@snir.fr'),
(7, 'Bert', 'Jean-Pierre', 'St Orens', 'bertjp@snir.fr'),
(8, 'Gonzales', 'Alain', 'Toulouse', 'gonzalesa@snir.fr'),
(9, 'Martin', 'François', 'Balma', 'martinf@snir.fr'),
(10, 'Jourda', 'Véronique', 'Colomiers', 'jourdav@snir.fr'),
(19, 'Julien', 'Regine', 'Nice', 'regine.julien@euca.fr'),
(21, 'ilan', 'gaut', 'nike', 'ek@s.fr'),
(23, 'regine', 'julien', 'nice', 'biblio@biblio.fr');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `emprunt`
--
ALTER TABLE `emprunt`
  ADD CONSTRAINT `emprunt_ibfk_1` FOREIGN KEY (`numlivre`) REFERENCES `livre` (`numlivre`),
  ADD CONSTRAINT `emprunt_ibfk_2` FOREIGN KEY (`numpersonne`) REFERENCES `personne` (`numpersonne`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
