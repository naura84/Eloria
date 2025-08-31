<?php
require_once "database.php";

if (!isset($_GET["token"])) {
    die("Token manquant.");
}

$token = $_GET["token"];
$tokenHash = hash("sha256", $token);

// Vérifier si le token existe
$stmt = $pdo->prepare("SELECT id, reset_token_expires_at FROM users WHERE reset_token_hash = :hash");
$stmt->execute([":hash" => $tokenHash]);
$user = $stmt->fetch();

if (!$user) {
    die("Token invalide.");
}

if (strtotime($user["reset_token_expires_at"]) < time()) {
    die("Token expiré.");
}

// Si formulaire soumis
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $newPassword = $_POST["password"];
    $newPasswordHash = password_hash($newPassword, PASSWORD_DEFAULT);

    $update = $pdo->prepare("UPDATE users 
        SET password = :password, reset_token_hash = NULL, reset_token_expires_at = NULL 
        WHERE id = :id");
    $update->execute([
        ":password" => $newPasswordHash,
        ":id" => $user["id"]
    ]);

    echo "✅ Mot de passe réinitialisé avec succès. <a href='Access.php'>Connectez-vous</a>";
    exit;
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Nouveau mot de passe</title>
  <style>
      @import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');
      @import url('https://fonts.googleapis.com/css2?family=Lavishly+Yours&display=swap');

      body {
          display: flex;
          align-items: center;
          justify-content: center;
          flex-direction: column;
          font-family: 'Montserrat', sans-serif;
          height: 100vh;
          margin: 0;
      }

      div {
          background: linear-gradient(#9942f6ff, #ccc6dcff, #ccb6eaff);
          width: 350px;
          height: 350px;
          text-align: center;
          box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
          border-radius: 10px;
          justify-content: center;

          h2 {
              margin: 10x;    
          }

          form {
              display: flex;
              flex-direction: column;
              gap: 20px;

              label {
                  margin-left: 60px;
                  margin-right: 60px;
                  font-size:2.5rem;
                  font-family: "Lavishly Yours", cursive;
                  letter-spacing:0.12em;
                  font-weight:400;
                  width:230px;
                  display:inline-block;
              }

              input {
                  padding: 10px;
                  border-radius: 20px;
                  margin-top: 10px;
                  margin: 0px 20px;
                  position: relative;
              }
              button {
                  padding: 10px;
                  margin: 0px 20px;
                  position: end;
                  border: none;
                  border-radius: 20px;
                  background: #35294cff;
                  font-size:1.5rem;
                  font-family: Times New Roman;
              }
          }

      }
    </style>
</head>
<body>
  <div>
    <h2>Définir un nouveau mot de passe</h2>
    <form method="POST">
      <label for="password">Eloria</label>
      <input type="password" name="password" required placeholder="type your new password">
      <button type="submit">Reset Password</button>
    </form>
  </div>
</body>
</html>
