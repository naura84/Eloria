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
("LUXE", "Des perles qui capturent l’esprit océanique, pour un style frais et naturel aux accents estivaux.
(Inclut : colliers en perles, bracelets en perles – ambiance plage et vacances)", 20.89, 1),
("PEARL WAVE", " Des perles qui capturent l’esprit océanique, pour un style frais et naturel aux accents estivaux.
(Inclut : colliers en perles, bracelets en perles – ambiance plage et vacances)", 25.99, 2),
("URBAN PEARL", "La perle en version contemporaine : minimaliste, chic, et parfaite pour le quotidien.
(Inclut : colliers et bracelets en perles pour le quotidien, look city chic)", 30.8, 3),
("TEMPO", "Des montres au design épuré qui allient style et précision pour rythmer vos journées avec élégance.
(Inclut : montres design, minimalistes, sophistiquées)", 18.90, 4),
("Anaya", "Une immersion dans l’authenticité et la force des racines africaines, avec des bijoux puissants et inspirants.
(Inclut : colliers africains, bracelets ethniques, boucles d’oreilles inspirées d’Afrique)", 40.5, 5),
("BLOOM", "Une immersion dans l’authenticité et la force des racines africaines, avec des bijoux puissants et inspirants.
(Inclut : colliers africains, bracelets ethniques, boucles d’oreilles inspirées d’Afrique)", 39.99, 6),
("ESSENCE", "Des bijoux simples, purs et élégants, pour un style minimaliste qui s’adapte à tout.
(Inclut : colliers fins, bracelets simples, boucles d’oreilles basiques et chic)", 16.25, 7);

INSERT INTO bijoux_photos (bijou_id, photo_url) VALUES
(1, "C:\xampp\htdocs\Eloria\img\Aria.jpg"),
(2, "C:\xampp\htdocs\Eloria\img\Astéria.jpg"),
(3, "C:\xampp\htdocs\Eloria\img\Aurora.jpg"),
(4, "c:\xampp\htdocs\Eloria\img\Axis africaine.jpg"),
(5, "C:\xampp\htdocs\Eloria\img\Caresse de Velour.jpg"),
(6, "C:\xampp\htdocs\Eloria\img\Charme éternel.jpg"),
(7, "C:\xampp\htdocs\Eloria\img\Chloé.jpg"),
(1, "C:\xampp\htdocs\Eloria\img\Collection l'Africaine.jpg"),
(2, "C:\xampp\htdocs\Eloria\img\Collection Noémie.jpg"),
(3, "C:\xampp\htdocs\Eloria\img\Crystal.jpg"),
(4, "C:\xampp\htdocs\Eloria\img\Eclat d'or.jpg"),
(5, "C:\xampp\htdocs\Eloria\img\Eclipse.jpg"),
(6, "C:\xampp\htdocs\Eloria\img\Eméraude.jpg"),
(7, "C:\xampp\htdocs\Eloria\img\Emiliane.jpg"),
(1, "C:\xampp\htdocs\Eloria\img\Emilie.jpg"),
(2, "C:\xampp\htdocs\Eloria\img\Epure.jpg"),
(3, "C:\xampp\htdocs\Eloria\img\Eriyomi.jpg"),
(4, "C:\xampp\htdocs\Eloria\img\Feuille d'or.jpg"),
(5, "C:\xampp\htdocs\Eloria\img\Halo.jpg"),
(6, "C:\xampp\htdocs\Eloria\img\Impériale.jpg"),
(7, "C:\xampp\htdocs\Eloria\img\Jua.jpg"),
(1, "C:\xampp\htdocs\Eloria\img\Layanie.jpg"),
(2, "C:\xampp\htdocs\Eloria\img\Liane d'argent.jpg"),
(3, "C:\xampp\htdocs\Eloria\img\Liane d'or.jpg"),
(4, "C:\xampp\htdocs\Eloria\img\Lili.jpg"),
(5, "C:\xampp\htdocs\Eloria\img\Linéa.jpg"),
(6, "C:\xampp\htdocs\Eloria\img\Maison Auréa.jpg"),
(7, "C:\xampp\htdocs\Eloria\img\Majestée.jpg"),
(1, "C:\xampp\htdocs\Eloria\img\Marianne.jpg"),
(2, "c:\xampp\htdocs\Eloria\img\Mono.jpg"),
(3, "C:\xampp\htdocs\Eloria\img\Naurélie.jpg"),
(4, "C:\xampp\htdocs\Eloria\img\Noémia.jpg"),
(5, "C:\xampp\htdocs\Eloria\img\Nuit Céleste.jpg"),
(6, "C:\xampp\htdocs\Eloria\img\Ondée florale.jpg"),
(7, "C:\xampp\htdocs\Eloria\img\Orée.jpg"),
(1, "C:\xampp\htdocs\Eloria\img\Orion.jpg"),
(2, "C:\xampp\htdocs\Eloria\img\Perle de Lune.jpg"),
(3, "C:\xampp\htdocs\Eloria\img\Pierres d'Axis.jpg"),
(4, "C:\xampp\htdocs\Eloria\img\Point Lumière.jpg"),
(5, "C:\xampp\htdocs\Eloria\img\Racine sacrée.jpg"),
(6, "C:\xampp\htdocs\Eloria\img\Reflet d'Opale.jpg"),
(7, "C:\xampp\htdocs\Eloria\img\Sènan.jpg"),
(1, "C:\xampp\htdocs\Eloria\img\Songe étoilé.jpg"),
(2, "C:\xampp\htdocs\Eloria\img\Songe étoilée.jpg"),
(3, "C:\xampp\htdocs\Eloria\img\Spirale d'or.jpg"),
(4, "C:\xampp\htdocs\Eloria\img\Vert éméraude.jpg");
