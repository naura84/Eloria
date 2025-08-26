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
("Astéria", "", 25.99, 2),
("Aurora", "Laissez le temps se parer d'élégance. Cette pièce unique allie sophistication et symbolisme : un cadran doré qui capte chaque rayon de lumière, sublimé par un intérieur vert éméraude, symbole d'harmonie et de prospérité.

Son bracelet, véritable chef d'oeuvre, se compose de pierres éméraudes scintillantes, entrelacées de perles blanches et dorées, formant un délicat trèfle à trois feuilles. Plus qu'une montre, c'est un talisman de chnace et de raffinement, conçu pour celles qui veulent conjuguer style et signification.", 30.8, 3),
("Axis africaine", "Des montres au design épuré qui allient style et précision pour rythmer vos journées avec élégance.
(Inclut : montres design, minimalistes, sophistiquées)", 18.90, 4),
("Caresse de Velour", "Trois colliers dorés, trois personalités. Une chaîne carrée au design affirmé, une seconde ornée de pendentifs délicats, et une dernière pensée pour la touche finale. Minimalisme et élégance s'entrelacent pour sublimer votre style, sans en faire trop", 40.5, 5),
("Charme éternel", "Des perles transluicides rappelant les galets polis par les vagues, traversées de filaments blancs comme l'écume. Un pendentif étoile argenté vient compléter ce bijou, capturant la lumière et l'esprit de l'océan à chaque mouvement.", 39.99, 6),
("Chloé", "", 16.25, 7);
("Collection l'Africaine", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Collection Noémie", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Crystal", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Eclat d'Or", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Eclipse", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Eméraude", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Emiliane", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Emilie", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Epure", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Eriyomi", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Feuille d'or", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Halo", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Impériale", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Jua", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Laura", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Layanie", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Liane d'argent", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Liane d'or", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Lili", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Linéa", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Maison Auréa", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Majestée", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Marianne", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Mono", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Naurélie", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Noémia", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Nuit Céleste", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Ondée Florale", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Orée", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Orion", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Perle de Lune", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Pierres d'Axis", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Point Lumière", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Racine sacrée", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Reflet d'Opale", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Sènan", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Songe étoilé", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Songe étoilée", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Spirale d'or", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);
("Vert éméraude", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);


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
