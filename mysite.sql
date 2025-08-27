-- Création de la base de données
CREATE DATABASE IF NOT EXISTS eloria CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE eloria;

-- Table des utilisateurs
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    telephone VARCHAR(20),
    adresse VARCHAR(255),
    ville VARCHAR(100),
    pays VARCHAR(100),
    role ENUM('client', 'admin') DEFAULT 'client',
    statut ENUM('actif', 'inactif') DEFAULT 'actif',
    date_naissance DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table des collections (catégories)
CREATE TABLE collections (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Table des bijoux
CREATE TABLE bijoux (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    collection_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (collection_id) REFERENCES collections(id) ON DELETE SET NULL
);

-- Table des photos de bijoux
CREATE TABLE bijoux_photos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    bijou_id INT NOT NULL,
    photo_url VARCHAR(255) NOT NULL,
    FOREIGN KEY (bijou_id) REFERENCES bijoux(id) ON DELETE CASCADE
);

-- Table des inscriptions (historique ou gestion des inscriptions si besoin)
-- Si inscription = enregistrement utilisateur, la table users suffit.
-- Si besoin d'une table pour newsletter ou autre :
CREATE TABLE newsletter_subscriptions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    subscribed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Ajout des collections

-- Ajout des collections

INSERT INTO collections (name, description) VALUES 
("LUXE", "Des perles qui capturent l’esprit océanique, pour un style frais et naturel aux accents estivaux.
(Inclut : colliers en perles, bracelets en perles – ambiance plage et vacances)"),
("PEARL WAVE", " Des perles qui capturent l’esprit océanique, pour un style frais et naturel aux accents estivaux.
(Inclut : colliers en perles, bracelets en perles – ambiance plage et vacances)"),
("URBAN PEARL", "La perle en version contemporaine : minimaliste, chic, et parfaite pour le quotidien.
(Inclut : colliers et bracelets en perles pour le quotidien, look city chic)"),
("TEMPO", "Des montres au design épuré qui allient style et précision pour rythmer vos journées avec élégance.
(Inclut : montres design, minimalistes, sophistiquées)"),
("Anaya", "Une immersion dans l’authenticité et la force des racines africaines, avec des bijoux puissants et inspirants.
(Inclut : colliers africains, bracelets ethniques, boucles d’oreilles inspirées d’Afrique)"),
("BLOOM", "Une immersion dans l’authenticité et la force des racines africaines, avec des bijoux puissants et inspirants.
(Inclut : colliers africains, bracelets ethniques, boucles d’oreilles inspirées d’Afrique)"),
("ESSENCE", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)");

INSERT INTO bijoux (name, description, price, collection_id) VALUES
("Aria", "Ce bracelet allie force et élégance avec son cordon en métal teinté d'or, symbole de raffinement intemporel. Les pierres blanches aux formes organiques, délicatement séparées par des perles dorée, apportent une touche d'authenticité et de lumière. Une perle centrale, plus généreuse, sert d'ajustement pour épouser parfaitement la courbe du poignet, alliant confort et chic discret.", 19.99, 1),
("Astéria", "", 27.99, 2),
("Aurora", "Laissez le temps se parer d'élégance. Cette pièce unique allie sophistication et symbolisme : un cadran doré qui capte chaque rayon de lumière, sublimé par un intérieur vert éméraude, symbole d'harmonie et de prospérité.", 30.19, 3),
("Axis africaine", "", 39.90, 4),
("Caresse de Velour", "Trois colliers dorés, trois personalités. Une chaîne carrée au design affirmé, une seconde ornée de pendentifs délicats, et une dernière pensée pour la touche finale. Minimalisme et élégance s'entrelacent pour sublimer votre style, sans en faire trop", 26.99, 5),
("Charme éternel", "Des perles transluicides rappelant les galets polis par les vagues, traversées de filaments blancs comme l'écume. Un pendentif étoile argenté vient compléter ce bijou, capturant la lumière et l'esprit de l'océan à chaque mouvement.", 9.99, 6),
("Chloé", "Laissez vous envoûter par ce ensemble somptueux, véritable hommage à l'élégance intemporelle. Composé d'un collier, de boucles d'oreilles et de bagues assorties, chaque pièce se pare de pierres dorées et blanches délicates, captant la lumière avec un éclat discret mais irrésistible", 58.25, 7),
("Collection l'Africaine", "", 39.90, 4),
("Collection Noémie", "", 39.90, 4),
("Crystal", "Un collier aérien qui évoque la douceur de la plage. De délicates pierres blanches, lumineuses comme des gouttes de sable sous le soleil, s'alignent avec harmonie. Chaque groupe de quatre perles rondes en spirale, un subtil détail qui ajoute mouvement et caractère au bijou. Un accessoire qui respire la fraîchaur, la légerté et l'élégance naturelle.", 16.25, 7),
("Eclat d'Or", "Un ensemble qui joue avec les formes et les symboles : collier, boucles d'oreilles et bagues assortis. Le collier, simple et raffiné, porte un pendentif carré en forme de labyrinthe, captivant et unique, avec une seule issue qui attire le regard. Les boucles d'oreilles et la bague reprennent cette forme singulière, créant une harmonie subtile et mystérieuse. Un bijou pour celles qui aiment le style géométrique, élégant et porteur de sens.", 26.8, 7),
("Eclipse", "Des boucles d'oreilles rondes qui captivent par leu délicatesse. Autour du cercleprincipal, de petites formes rondes se superposent avec légerté, créant un jeu de profondeur et de mouvement. Leur teinte dorée, chaude et lumineuse, attire la lumière à chaque mouvement, offrant un éclat subtil et raffiné. Un bijou qui allie sophistication et modernité, pour un style à la fois chic et aérien.", 20.90, 7),
("Eméraude", "", 16.25, 7),
("Emiliane", "", 16.25, 7),
("Emilie", "", 16.25, 7),
("Epure", "", 16.25, 7),
("Eriyomi", "", 16.25, 7),
("Feuille d'or", "", 16.25, 7),
("Halo", "", 16.25, 7),
("Impériale", "", 16.25, 7),
("Jua", "", 16.25, 7),
("Laura", "", 16.25, 7),
("Layanie", "", 16.25, 7),
("Liane d'argent", "", 16.25, 7),
("Liane d'or", "", 16.25, 7),
("Lili", "", 16.25, 7),
("Linéa", "", 16.25, 7),
("Maison Auréa", "", 16.25, 7),
("Majestée", "", 16.25, 7),
("Marianne", "", 16.25, 7),
("Mono", "", 16.25, 7),
("Naurélie", "", 16.25, 7),
("Noémia", "", 16.25, 7),
("Nuit Céleste", "", 16.25, 7),
("Ondée Florale", "", 16.25, 7),
("Orée", "", 16.25, 7),
("Orion", "", 16.25, 7),
("Perle de Lune", "", 16.25, 7),
("Pierres d'Axis", "", 16.25, 7),
("Point Lumière", "", 16.25, 7),
("Racine sacrée", "", 16.25, 7),
("Reflet d'Opale", "", 16.25, 7),
("Sènan", "", 16.25, 7),
("Songe étoilé", "", 16.25, 7),
("Spirale d'or", "", 16.25, 7),
("Vert éméraude", "", 16.25, 7);

INSERT INTO bijoux_photos (bijou_id, photo_url) VALUES
(1, "img/Aria.jpg"),
(2, "img/Astéria.jpg"),
(3, "img/Aurora.jpg"),
(4, "img/Axis africaine.jpg"),
(5, "img/Caresse de Velour.jpg"),
(6, "img/Charme éternel.jpg"),
(7, "img/Chloé.jpg"),
(8, "img/Collection l'Africaine.jpg"),
(9, "img/Collection Noémie.jpg"),
(10, "img/Crystal.jpg"),
(11, "img/Eclat d'or.jpg"),
(12, "img/Eclipse.jpg"),
(13, "img/Eméraude.jpg"),
(14, "img/Emiliane.jpg"),
(15, "img/Emilie.jpg"),
(16, "img/Epure.jpg"),
(17, "img/Eriyomi.jpg"),
(18, "img/Feuille d'or.jpg"),
(19, "img/Halo.jpg"),
(20, "img/Impériale.jpg"),
(21, "img/Jua.jpg"),
(22, "img/Laura.jpg"),
(23, "img/Layanie.jpg"),
(24, "img/Liane d'argent.jpg"),
(25, "img/Liane d'or.jpg"),
(26, "img/Lili.jpg"),
(27, "img/Linéa.jpg"),
(28, "img/Maison Auréa.jpg"),
(29, "img/Majestée.jpg"),
(30, "img/Marianne.jpg"),
(31, "img/Mono.jpg"),
(32, "img/Naurélie.jpg"),
(33, "img/Noémia.jpg"),
(34, "img/Nuit Céleste.jpg"),
(35, "img/Ondée florale.jpg"),
(36, "img/Orée.jpg"),
(37, "img/Orion.jpg"),
(38, "img/Perle de Lune.jpg"),
(39, "img/Pierres d'Axis.jpg"),
(40, "img/Point Lumière.jpg"),
(41, "img/Racine sacrée.jpg"),
(42, "img/Reflet d'Opale.jpg"),
(43, "img/Sènan.jpg"),
(44, "img/Songe étoilée.jpg"),
(45, "img/Spirale d'or.jpg"),
(46, "img/Vert éméraude.jpg");
