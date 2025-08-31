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
    reset_token_hash VARCHAR(64) DEFAULT NULL UNIQUE,
    reset_token_expires_at DATETIME DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table des collections (catégories)
CREATE TABLE collections (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    photo_url VARCHAR(255) NOT NULL,
    description TEXT
);

-- Table des bijoux
CREATE TABLE bijoux (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    photo_url VARCHAR(255) NOT NULL,
    collection_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (collection_id) REFERENCES collections(id) ON DELETE SET NULL
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

INSERT INTO bijoux (name, description, price, collection_id, photo_url) VALUES
("Aria", "Ce bracelet allie force et élégance avec son cordon en métal teinté d'or, symbole de raffinement intemporel. Les pierres blanches aux formes organiques, délicatement séparées par des perles dorée, apportent une touche d'authenticité et de lumière. Une perle centrale, plus généreuse, sert d'ajustement pour épouser parfaitement la courbe du poignet, alliant confort et chic discret.", 19.99, 1, "img/Aria.jpg"),
("Astéria", "ce collier allie force et caractère et a tout pour plaire donc achetez le", 27.99, 1, "img/Astéria.jpg"),
("Aurora", "Laissez le temps se parer d'élégance. Cette pièce unique allie sophistication et symbolisme : un cadran doré qui capte chaque rayon de lumière, sublimé par un intérieur vert éméraude, symbole d'harmonie et de prospérité.", 30.19, 6, "img/Aurora.jpg"),
("Axis africaine", "Un ensemble de bracelet et de manches pour révéler toute l'africanité de votre personne", 39.90, 1, "img/Axis africaine.jpg"),
("Caresse de Velour", "Trois colliers dorés, trois personalités. Une chaîne carrée au design affirmé, une seconde ornée de pendentifs délicats, et une dernière pensée pour la touche finale. Minimalisme et élégance s'entrelacent pour sublimer votre style, sans en faire trop", 26.99, 7, "img/Caresse de Velour.jpg"),
("Charme éternel", "Des perles transluicides rappelant les galets polis par les vagues, traversées de filaments blancs comme l'écume. Un pendentif étoile argenté vient compléter ce bijou, capturant la lumière et l'esprit de l'océan à chaque mouvement.", 9.99, 6, "img/Charme éternel.jpg"),
("Chloé", "Laissez vous envoûter par ce ensemble somptueux, véritable hommage à l'élégance intemporelle. Composé d'un collier, de boucles d'oreilles et de bagues assorties, chaque pièce se pare de pierres dorées et blanches délicates, captant la lumière avec un éclat discret mais irrésistible", 58.25, 2, "img/Chloé.jpg"),
("Magnificat", "Ce bijou qui allie féminité et amours ainsi que rigueur saurait-il vous faire craquer ? Découvrez Magnificat", 39.90, 3, "img/Collection l'Africaine.jpg"),
("Collection Noémie", "Cette collection qui fait chavirer tous les coeurs ! Etes ous prêts pour laisser le votre y succomber ??", 39.90, 3, "img/Collection Noémie.jpg"),
("Crystal", "Un collier aérien qui évoque la douceur de la plage. De délicates pierres blanches, lumineuses comme des gouttes de sable sous le soleil, s'alignent avec harmonie. Chaque groupe de quatre perles rondes en spirale, un subtil détail qui ajoute mouvement et caractère au bijou. Un accessoire qui respire la fraîchaur, la légerté et l'élégance naturelle.", 16.25, 5, "img/Crystal.jpg"),
("Eclat d'Or", "Un ensemble qui joue avec les formes et les symboles : collier, boucles d'oreilles et bagues assortis. Le collier, simple et raffiné, porte un pendentif carré en forme de labyrinthe, captivant et unique, avec une seule issue qui attire le regard. Les boucles d'oreilles et la bague reprennent cette forme singulière, créant une harmonie subtile et mystérieuse. Un bijou pour celles qui aiment le style géométrique, élégant et porteur de sens.", 26.80, 4, "img/Eclat d'Or.jpg"),
("Eclipse", "Des boucles d'oreilles rondes qui captivent par leu délicatesse. Autour du cercleprincipal, de petites formes rondes se superposent avec légerté, créant un jeu de profondeur et de mouvement. Leur teinte dorée, chaude et lumineuse, attire la lumière à chaque mouvement, offrant un éclat subtil et raffiné. Un bijou qui allie sophistication et modernité, pour un style à la fois chic et aérien.", 56.99, 1, "img/Eclipse.jpg"),
("Eméraude", "L'éméraude dont vous avez toujours rêvé. Une pièce unique et qui envoûte", 25.05, 7, "img/Eméraude.jpg"),
("Emiliane", "un bijou qui fait fantasmer. Des perles aussi blanches que le coton parfaitement assortis avec une couleur or qui inspire tout ce qui est précieux", 67.58, 2, "img/Emiliane.jpg"),
("Emilie", "Vous aimez la plage et le soleil? Alors ce collier est fait pour vous. Ses médaillons en forme de soleil et de coquillage rappelle les vagues et les journées ensoleillées", 54.60, 6, "img/Emilie.jpg"),
("Epure", "Renouez avec la simplicité d'un collier de perles assorti à un bracelet dans un style bohème minimaliste", 28.95, 7, "img/Epure.jpg"),
("Eriyomi", "Laissez-vous transporter dans des cultures africaines qui ne disent pas leurs noms mais qui racontent leurs histoires.", 69.99, 5, "img/Eriyomi.jpg"),
("Feuille d'or", "Vous recherchez un ensemble pour briller lors d'une fête ? Feuille d'or est fait pour vous !", 42.22, 3, "img/Feuille d'or.jpg"),
("Halo", "Un collier de perles, aussi beau que divin. Laissez Halo dire un peu plus sur votre personnalité", 41.50, 2, "img/Halo.jpg"),
("Impériale", "Un bracelet minimaliste aux perles blanches, parfait pour vous !", 36.95, 1, "img/Impériale.jpg"),
("Jua", "Envie de capter l'attention pour un évennement important ? Jua vous promet d'être la plus inoubliable de la soirée", 105.99, 7, "img/Jua.jpg"),
("Laura", "Un ensemble de trois bracelets aux perles blanches avec des médaillons rouges qui inspirent la royauté. En la portant vous vous transformerez en ce qu'on appelle une déesse ", 23.25, 2, "img/Laura.jpg"),
("Layanie", "Layanie vous offre un confort et une assurance qui ne faillent pas. A l'acier inoxydable, il est garantit pour 2 ans minimum, le temps qu'il vous faut pour briller plus que jamais", 26.25, 1, "img/Layanie.jpg"),
("Liane d'argent", "Respirez l'élégance, la vie et l'audace !", 45.25, 3, "img/Liane d'argent.jpg"),
("Liane d'or", "Un air de grande dame et un charisme qui cape l'attention", 46.25, 4, "img/Liane d'or.jpg"),
("Lili", "Parfait pour la plage ou une journée piscine ! ", 39.99, 4, "img/Lili.jpg"),
("Linéa", "Sagesse africaine et amour maternel, réunis dans un seul bijou !", 45.95, 6, "img/Linéa.jpg"),
("Maison Auréa", "Des perles qui peuvent vous faire éclater pour milles feux", 26.20, 7, "img/Maison Auréa.jpg"),
("Majestée", "Des perles qui peuvent vous faire briller pendant toute une nuit", 63.95, 3, "img/Majestée.jpg"),
("Marianne", "Des perles qui peuvent vous faire briller et scintiller pendant le restant de vos jours", 25.50, 4, "img/Marianne.jpg"),
("Mono", "Portez  les et vous serez au septieme ciel", 32.29, 4,  "img/Mono.jpg"),
("Naurélie", "Comme son nom l'indique vous ne serez pas décus", 54.95, 3, "img/Naurélie.jpg"),
("Noémia", "Arrêtez de trouver des excuses et achetez !!!", 49.99, 1, "img/Noémia.jpg"),
("Nuit Céleste", "Ne regardez pas à votre portefeuille et achetez !", 58.00, 2, "img/Nuit Céleste.jpg"),
("Ondée Florale", "Telle une fleur qui fleurie vous pouvez fleurir", 25.50, 2, "img/Ondée florale.jpg"),
("Orée", "orée, avez-vous déjà entendu ce  nom une fois??", 39.99, 6, "img/Orée.jpg"),
("Orion", "Restez comme vous êtes mais rajoutez des bijoux", 26.85, 4, "img/Orion.jpg"),
("Perle de Lune", "La lune même s'inclinera pour vous après avoir poré un tel bijou", 36.65, 6, "img/Perle de Lune.jpg"),
("Pierres d'Axis", "Pierres d'Axis, ce nom ne vous plait-il pas?? achetez le", 25.63, 4, "img/Pierres d'Axis.jpg"),
("Point Lumière", "La lumière entrera ddans voitre vie après que vous vus parez de ce bijou divin", 58.88, 7, "img/Point Lumière.jpg"),
("Racine sacrée", "Des fleurs, que demander de plus?", 16.25, 1, "img/Racine sacrée.jpg"),
("Reflet d'Opale", "Des bijoux faits pour être portés. Osez !", 69.99, 2, "img/Reflet d'Opale.jpg"),
("Sènan", "Ressortir toute la richesse d'Afrique, ce bijou a été conçu exactement pour ça", 45.25, 5, "img/Sènan.jpg"),
("Songe étoilé", "Un ensemble vert éméraude, des couleurs or, telle est la réponse à la demande d'une princesse", 75.09, 3, "img/Songe étoilée.jpg"),
("Spirale d'or", "Des bijoux montrant l'originalité et le renouveau, parez-vous de ces bijoux et come pas magie pour tourbillonerez de milles feux", 58.05, 6, "img/Spirale d'or.jpg"),
("Vert éméraude", "Un collier aussi simple que mystique. Un seul pendentif, une chaîne en or pure et une couleur qui ne passe pas inaperçue", 125.99, 2, "img/Vert éméraude.jpg")