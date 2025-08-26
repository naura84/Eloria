<?php
require("database.php");
session_start();

$error = "";
$success = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Connexion
    if (isset($_POST['login'])) {
        $email = trim($_POST['login_email']);
        $password = $_POST['login_password'];

        if (empty($email) || empty($password)) {
            $error = "Veuillez remplir tous les champs.";
        } else {
            $stmt = $pdo->prepare("SELECT * FROM users WHERE email = ?");
            $stmt->execute([$email]);
            $user = $stmt->fetch();
            if ($user && password_verify($password, $user['password'])) {
                $_SESSION['user_id'] = $user['id'];
                $_SESSION['user_email'] = $user['email'];
                $_SESSION['user_role'] = $user['role'];
                $success = "Connexion réussie !";
                // Redirection possible : header("Location: index.php");
            } else {
                $error = "Email ou mot de passe incorrect.";
            }
        }
    }

    // Inscription
    if (isset($_POST['register'])) {
        $nom = trim($_POST['register_nom']);
        $prenom = trim($_POST['register_prenom']);
        $email = trim($_POST['register_email']);
        $password = $_POST['register_password'];
        $telephone = trim($_POST['register_telephone']);
		$country_code = $_POST['country_code'];

        if (empty($nom) || empty($prenom) || empty($email) || empty($password) || empty($telephone)) {
            $error = "Veuillez remplir tous les champs.";
        } else {
            $stmt = $pdo->prepare("SELECT id FROM users WHERE email = ?");
            $stmt->execute([$email]);
            if ($stmt->fetch()) {
                $error = "Cet email est déjà utilisé.";
            } else {
                $hashed_password = password_hash($password, PASSWORD_DEFAULT);
                $stmt = $pdo->prepare("INSERT INTO users (nom, prenom, email, password, telephone, pays) VALUES (?, ?, ?, ?, ?, ?)");
                if ($stmt->execute([$nom, $prenom, $email, $hashed_password, $telephone, $country_code])) {
                    $success = "Inscription réussie ! Vous pouvez vous connecter.";
                } else {
                    $error = "Erreur lors de l'inscription.";
                }
            }
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <!-- Bootstrap CDN -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css"/>

    <style>
        @import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');
        @import url('https://fonts.googleapis.com/css2?family=Lavishly+Yours&display=swap');


* {
	box-sizing: border-box;
}

body {
	background: #f6f5f7;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	font-family: 'Montserrat', sans-serif;
	height: 100vh;
	margin: -20px 0 50px;
}

h1 {
	font-weight: bold;
	margin: 0;
}

h3 {
	font-weight: bold;
	margin: 0;
}

h2 {
	text-align: center;
}

p {
	font-size: 14px;
	font-weight: 100;
	line-height: 20px;
	letter-spacing: 0.5px;
	margin: 20px 0 30px;
}

span {
	font-size: 12px;
}

a {
	color: #333;
	font-size: 14px;
	text-decoration: none;
	margin: 15px 0;
}

button {
	border-radius: 20px;
	border: 1px solid #090a49ff;
	background-color: #090a49ff;
	color: #FFFFFF;
	font-size: 12px;
	font-weight: bold;
	padding: 12px 45px;
	letter-spacing: 1px;
	text-transform: uppercase;
	transition: transform 80ms ease-in;
}

button:active {
	transform: scale(0.95);
}

button:focus {
	outline: none;
}

button.ghost {
	background-color: transparent;
	border-color: #FFFFFF;
}

form {
	background-color: #FFFFFF;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 50px;
	height: 100%;
	text-align: center;
}

input {
	background-color: #eee;
	border: none;
	padding: 12px 15px;
	margin: 8px 0;
	width: 100%;
}

.iti {
  width: 100% !important;  /* le conteneur prend toute la largeur */
}

.iti input {
  width: 100% !important;  /* le champ garde toute la largeur */
  box-sizing: border-box;  /* évite débordement */
}

.iti__flag-container {
  height: 100%; /* drapeau aligné */
}

input.contact {
	background-color: #eee;
	border: none;
	padding: 12px 15px;
	margin: 8px 0;
	width: 100%;
}

.container {
	background-color: #fff;
	border-radius: 10px;
  	box-shadow: 0 14px 28px rgba(0,0,0,0.25), 
			0 10px 10px rgba(0,0,0,0.22);
	position: relative;
	overflow: hidden;
	width: 850px;
	max-width: 100%;
	min-height: 540px;
}

.form-container {
	position: absolute;
	top: 0;
	height: 100%;
	transition: all 0.6s ease-in-out;
}

.sign-in-container {
	left: 0;
	width: 50%;
	z-index: 2;
}

.container.right-panel-active .sign-in-container {
	transform: translateX(100%);
}

.sign-up-container {
	left: 0;
	width: 50%;
	opacity: 0;
	z-index: 1;
}

.container.right-panel-active .sign-up-container {
	transform: translateX(100%);
	opacity: 1;
	z-index: 5;
	animation: show 0.6s;
}

@keyframes show {
	0%, 49.99% {
		opacity: 0;
		z-index: 1;
	}
	
	50%, 100% {
		opacity: 1;
		z-index: 5;
	}
}

.overlay-container {
	position: absolute;
	top: 0;
	left: 50%;
	width: 50%;
	height: 100%;
	overflow: hidden;
	transition: transform 0.6s ease-in-out;
	z-index: 100;
}

.container.right-panel-active .overlay-container{
	transform: translateX(-100%);
}

.overlay {
	background: #090a49ff;
	background-size: cover;
	background-position: 0 0;
	color: #FFFFFF;
	position: relative;
	left: -100%;
	height: 100%;
	width: 200%;
  	transform: translateX(0);
	transition: transform 0.6s ease-in-out;
}

.container.right-panel-active .overlay {
  	transform: translateX(50%);
}

.overlay-panel {
	position: absolute;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 40px;
	text-align: center;
	top: 0;
	height: 100%;
	width: 50%;
	transform: translateX(0);
	transition: transform 0.6s ease-in-out;
}

.overlay-left {
	transform: translateX(-20%);
}

.container.right-panel-active .overlay-left {
	transform: translateX(0);
}

.overlay-right {
	right: 0;
	transform: translateX(0);
}

.container.right-panel-active .overlay-right {
	transform: translateX(20%);
}

.social-container {
	margin: 20px 0;
}

.social-container a {
	border: 1px solid #DDDDDD;
	border-radius: 50%;
	display: inline-flex;
	justify-content: center;
	align-items: center;
	margin: 0 5px;
	height: 40px;
	width: 40px;
}

footer {
    background-color: #222;
    color: #fff;
    font-size: 14px;
    bottom: 0;
    position: fixed;
    left: 0;
    right: 0;
    text-align: center;
    z-index: 999;
}

footer p {
    margin: 10px 0;
}

footer i {
    color: red;
}

footer a {
    color: #3c97bf;
    text-decoration: none;
}

.lavishly-yours-regular {
  font-family: "Lavishly Yours", cursive;
  font-weight: 400;
  font-style: normal;
}

.custom-alert {
            position: fixed;
            top: 30px;
            left: 50%;
            transform: translateX(-50%);
            min-width: 320px;
            max-width: 90vw;
            padding: 18px 32px;
            border-radius: 12px;
            font-family: 'Montserrat', sans-serif;
            font-size: 1.1rem;
            font-weight: 500;
            box-shadow: 0 6px 24px rgba(0,0,0,0.13);
            z-index: 9999;
            opacity: 0;
            pointer-events: none;
            transition: opacity 0.5s, top 0.5s;
        }
        .custom-alert.show {
            opacity: 1;
            pointer-events: auto;
            top: 60px;
        }
        .custom-alert.error {
            border: 2px solid #e74c3c;
            background: #fff6f6;
            color: #c0392b;
        }
        .custom-alert.success {
            border: 2px solid #27ae60;
            background: #f6fff6;
            color: #218c4a;
        }
        .custom-alert .close-btn {
            background: none;
            border: none;
            color: inherit;
            font-size: 1.3rem;
            font-weight: bold;
            position: absolute;
            top: 10px;
            right: 18px;
            cursor: pointer;
            opacity: 0.7;
            transition: opacity 0.2s;
        }
        .custom-alert .close-btn:hover {
            opacity: 1;
        }
    </style>
</head>
<body>
    <!-- Alert container -->
    <div id="alertBox" class="custom-alert" style="display:none;">
        <span id="alertMsg"></span>
        <button class="close-btn" onclick="hideAlert()">&times;</button>
    </div>
    <div class="container" id="container">
	<div class="form-container sign-up-container">
		<form action="" method="POST">
			<h1>Join us</h1>
			<div class="social-container">
				<a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
				<a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
				<a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
			</div>
			<span>Or use your email for registration</span>
			<input type="text" name="register_nom" pattern="[A-Za-z\s]+" placeholder="Nom" required/>
			<input type="text" name="register_prenom" pattern="[A-Za-z\s]+" placeholder="Prénom" required/>
			<input type="email" name="register_email" placeholder="Email" required />
			<input type="password" name="register_password" placeholder="Password" required/>
			<input class="contact" id="phone" name="register_telephone" type="tel" placeholder="Number Phone" required/>
			<input type="hidden" name="country_code" id="country"/>
			<input type="hidden" name="dial_code" id="dial_code"/>
			<button type="submit" name="register">Sign Up</button>
		</form>
	</div>
	<div class="form-container sign-in-container">
		<form action="" method="POST">
			<h1>Sign in to </h1>
			<h3>
				<span class="lavishly-yours-regular" style="font-size:3.2rem; letter-spacing:0.12em; font-weight:400; width:230px; display:inline-block;">Eloria</span>
			</h3>
			<div class="social-container">
				<a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
				<a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
				<a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
			</div>
			<span>Or use your account</span>
			<input type="email" name="login_email" placeholder="Email" required/>
			<input type="password" name="login_password" placeholder="Password" required/>
			<a href="#">Forgot your password?</a>
			<button type="submit" name="login">Sign In</button>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>Welcome Back!</h1>
				<p>To keep connected with us please login with your personal info</p>
				<button class="ghost" id="signIn">Sign In</button>
			</div>
			<div class="overlay-panel overlay-right">
				<h1>Hello, Friend!</h1>
				<p>Enter your personal details and start journey with us</p>
				<button class="ghost" id="signUp">Sign Up</button>
			</div>
		</div>
	</div>
</div>
<script>
const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
	container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
	container.classList.remove("right-panel-active");
});

// Transfert des messages PHP vers JS
        const errorMsg = <?php echo json_encode($error); ?>;
        const successMsg = <?php echo json_encode($success); ?>;

        function showAlert(type, message) {
            const alertBox = document.getElementById('alertBox');
            const alertMsg = document.getElementById('alertMsg');
            alertBox.className = 'custom-alert ' + type;
            alertMsg.textContent = message;
            alertBox.style.display = 'block';
            setTimeout(() => {
                alertBox.classList.add('show');
            }, 10);
            // Auto-hide après 5s sauf si fermé manuellement
            window._alertTimeout = setTimeout(hideAlert, 5000);
        }

        function hideAlert() {
            const alertBox = document.getElementById('alertBox');
            alertBox.classList.remove('show');
            setTimeout(() => {
                alertBox.style.display = 'none';
            }, 500);
            if (window._alertTimeout) clearTimeout(window._alertTimeout);
        }

        // Affichage au chargement si message
        window.addEventListener('DOMContentLoaded', function() {
            if (errorMsg) showAlert('error', errorMsg);
            else if (successMsg) showAlert('success', successMsg);
        });
</script>
		<!-- Ajoute juste avant </body> -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>
        <script>
    		const input = document.querySelector("#phone");
    		const iti = window.intlTelInput(input, {
        	initialCountry: "auto",
        	geoIpLookup: function(callback) {
            fetch("https://ipapi.co/json")
                .then(res => res.json())
                .then(data => callback(data.country_code))
                .catch(() => callback("us"));
        	},
        	utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js"
    		});
			//Avant envoi du formulaire
			document.querySelector('form').addEventListener('submit', function() {
				const countryData = iti.getSelectedCountryData();
				document.querySelector("#country").value = countryData.iso2; // Code pays (ex: 'us')
				document.querySelector("#dial_code").value = countryData.dialCode; // Indicatif (ex: '1')
				code = countryData.dialCode;
				input.value = "+" + code.toString() + " " + iti.getNumber().toString(); // Numéro complet plus le code du pays
			});
		</script>
    </body>
    </html>