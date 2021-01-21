-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 07 jan. 2021 à 10:02
-- Version du serveur :  8.0.22-0ubuntu0.20.04.3
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `micro-url`
--

-- --------------------------------------------------------

--
-- Structure de la table `asso-mots-url`
--

CREATE TABLE `asso-mots-url` (
  `id-mots-url` int NOT NULL,
  `id-url` int NOT NULL,
  `id-mot-clé` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `asso-mots-url`
--

INSERT INTO `asso-mots-url` (`id-mots-url`, `id-url`, `id-mot-clé`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `mots-cles`
--

CREATE TABLE `mots-cles` (
  `id-mots-cles` int NOT NULL,
  `nom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `mots-cles`
--

INSERT INTO `mots-cles` (`id-mots-cles`, `nom`) VALUES
(1, 'sport'),
(2, 'loisir'),
(3, 'sorties');

-- --------------------------------------------------------

--
-- Structure de la table `url`
--

CREATE TABLE `url` (
  `id-url` int NOT NULL,
  `url` text NOT NULL,
  `shortcut` varchar(255) NOT NULL,
  `datetime` datetime NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `url`
--

INSERT INTO `url` (`id-url`, `url`, `shortcut`, `datetime`, `description`) VALUES
(1, 'https://www.grimper.com/site-escalade-collias#:~:text=Collias%20comporte%20environ%20200%20voies,du%20dur%20faute%20de%20choix%E2%80%A6', 'es-co', '2021-01-07 09:24:35', 'escalade collias'),
(2, 'https://www.auvieuxcampeur.fr/la-jonte.html?gclid=CjwKCAiA_9r_BRBZEiwAHZ_v15rHjggaEYU0qXMLm0-IQHwmh8CrMHTYK-ufsQiUSo-QZliPOVIYphoCzmIQAvD_BwE#', 'es-jt', '2021-01-07 09:33:19', 'escalade dans la jonte'),
(3, 'https://www.allocine.fr/film/fichefilm_gen_cfilm=178014.html', 'ci-av', '2021-01-07 09:40:06', 'avatar 2');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `asso-mots-url`
--
ALTER TABLE `asso-mots-url`
  ADD PRIMARY KEY (`id-mots-url`),
  ADD KEY `id-mot-clé` (`id-mot-clé`),
  ADD KEY `id-url` (`id-url`);

--
-- Index pour la table `mots-cles`
--
ALTER TABLE `mots-cles`
  ADD PRIMARY KEY (`id-mots-cles`);

--
-- Index pour la table `url`
--
ALTER TABLE `url`
  ADD PRIMARY KEY (`id-url`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `asso-mots-url`
--
ALTER TABLE `asso-mots-url`
  MODIFY `id-mots-url` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `mots-cles`
--
ALTER TABLE `mots-cles`
  MODIFY `id-mots-cles` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `url`
--
ALTER TABLE `url`
  MODIFY `id-url` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `asso-mots-url`
--
ALTER TABLE `asso-mots-url`
  ADD CONSTRAINT `asso-mots-url_ibfk_1` FOREIGN KEY (`id-mot-clé`) REFERENCES `mots-cles` (`id-mots-cles`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `asso-mots-url_ibfk_2` FOREIGN KEY (`id-url`) REFERENCES `url` (`id-url`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
