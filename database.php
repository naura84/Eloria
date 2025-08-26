<?php
$host = "localhost"; // Hôte de la base de données
$dbname = "eloria"; // Nom de la base de données
$username = "root"; // Nom d'utilisateur de la base de données
$password = ""; // Mot de passe de la base de données

try {
    $dsn = "mysql:host=$host;dbname=$dbname;charset=utf8";
    //Options pour renforcer la sécurité
    $options= [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, // Activer les exceptions d'erreur
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC, // Mode de récupération par défaut
        PDO::ATTR_EMULATE_PREPARES => false, // Désactiver l'émulation des requêtes préparées
    ];
    $pdo = new PDO($dsn, $username, $password, $options);
    
} catch (PDOException $e) {
    die("Erreur de connexion à la base de données : " . $e->getMessage());
}