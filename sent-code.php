<?php
require_once "database.php";
require "src/PHPMailer.php";
require "src/Exception.php";
require "src/SMTP.php";

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $email = trim($_POST["email"]);

    // Vérifier si l'utilisateur existe
    $stmt = $pdo->prepare("SELECT id FROM users WHERE email = :email");
    $stmt->execute([":email" => $email]);
    $user = $stmt->fetch();

    if ($user) {
        // Générer un token
        $token = bin2hex(random_bytes(32)); // token brut
        $tokenHash = hash("sha256", $token); // hash pour stocker en DB
        $expires = date("Y-m-d H:i:s", time() + 3600); // expire dans 1h

        // Sauvegarder en DB
        $update = $pdo->prepare("UPDATE users 
            SET reset_token_hash = :hash, reset_token_expires_at = :expires 
            WHERE email = :email");
        $update->execute([
            ":hash" => $tokenHash,
            ":expires" => $expires,
            ":email" => $email
        ]);

        // Envoyer le mail avec le token brut
        $resetLink = "http://localhost/Eloria/reset_password.php?token=" . $token;

        $mail = new PHPMailer(true);

        try {
            // Configuration de SMTP gmail

            $mail->isSMTP();
            $mail->Host = 'smtp.gmail.com';
            $mail->SMTPAuth = true;
            $mail->Username = "dskmelvin@gmail.com";
            $mail->Password = "ssph qnto ehfm tcib";
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS; 
            $mail->Port = 587;

            $mail->SMTPOptions = [
                'ssl' => [
                    'verify_peer' => false,
                    'verify_peer_name' => false,
                    'allow_self_signed' => true
                ]
            ];

            $mail->setFrom("dskmelvin@gmail.com", "Eloria");
            $mail->addAddress($email);

            $mail->isHTML(true);
            $mail->Subject = "Réinitialisation de mot de passe";
            $mail->Body = "Cliquez ici pour réinitialiser : <a href='$resetLink'>$resetLink</a>";

            $mail->send();
            echo "Un email de réinitialisation vous a été envoyé.";
        } catch (Exception $e) {
            echo "Erreur lors de l'envoi de l'email : " . $e->getMessage();
        }
    } else {
        echo "Aucun utilisateur trouvé avec cet email.";
    }
}

