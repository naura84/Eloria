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
