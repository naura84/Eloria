<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Inter', Arial, sans-serif;
            background: #f6f7fb;
            overflow-x: hidden;
        }
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 280px;
            background: #fff;
            color: #090a49ff;
            box-shadow: 2px 0 16px rgba(44, 62, 80, 0.08);
            padding: 0;
            transform: translateX(-100%);
            transition: transform 0.3s cubic-bezier(.4,0,.2,1);
            z-index: 1000;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .sidebar.open {
            transform: translateX(0);
        }
        .sidebar-header {
            padding-top: 44px;
            padding-left: 32px;
            padding-right: 32px;
        }
        .brand-name {
            font-size: 32px;
            font-weight: 700;
            letter-spacing: 1px;
            color: #23272f;
        }
        .search-bar {
            margin-top: 16px;
            width: 100%;
            height: 32px;
            border-radius: 8px;
            border: 1px solid #e3e6ee;
            background: #f6f7fb;
            padding: 0 12px;
            font-size: 15px;
            color: #090a49ff;
            outline: none;
        }
        .sidebar-section {
            margin-top: 32px;
            padding-left: 32px;
            padding-right: 32px;
        }
        .section-title {
            font-size: 16px;
            font-weight: 600;
            color: #090a49ff;
            margin-bottom: 4px;
        }
        .sidebar-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .sidebar-list li {
            display: flex;
            align-items: center;
            height: 40px;
            margin-bottom: 4px;
        }
        .sidebar-list li a {
            display: flex;
            align-items: center;
            text-decoration: none;
            color: #090a49ff;
            font-size: 16px;
            font-weight: 500;
            width: 100%;
            height: 100%;
            border-radius: 8px;
            padding: 0 12px;
            transition: background 0.2s;
        }
        .sidebar-list li a:hover {
            background: #f0f2f7;
        }
        .sidebar-list .icon {
            font-size: 20px;
            margin-right: 12px;
            color: #090a49ff;
            width: 24px;
            text-align: center;
        }
        .sidebar-section.communication {
            margin-top: 24px;
        }
        .sidebar-profile {
            padding-left: 32px;
            padding-right: 32px;
            margin-bottom: 44px;
            display: flex;
            align-items: center;
        }
        .profile-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #e3e6ee;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
            color: #090a49ff;
            margin-right: 12px;
        }
        .profile-info {
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .profile-name {
            font-size: 20px;
            font-weight: 600;
            color: #23272f;
            line-height: 20px;
        }
        .profile-email {
            font-size: 15px;
            color: #090a49ff;
            line-height: 20px;
        }
        .sidebar-divider {
            margin: 16px 32px;
            border: none;
            border-top: 1px solid #e3e6ee;
        }
        .sidebar-help {
            padding-left: 32px;
            padding-right: 32px;
            margin-bottom: 16px;
        }
        .sidebar-help .sidebar-list li {
            margin-bottom: 0;
        }
        .toggle-btn {
            position: fixed;
            top: 50%;
            left: 0;
            transform: translateY(-50%);
            z-index: 1001;
            background-color: #23272f;
            color: #fff;
            border: none;
            padding: 10px 5px;
            cursor: pointer;
            border-radius: 0 5px 5px 0;
            transition: transform 0.3s cubic-bezier(.4,0,.2,1);
        }
        .sidebar.open + .toggle-btn {
            transform: translateY(-50%) translateX(280px);
        }
        .toggle-btn .icon {
            font-size: 18px;
            transition: transform 0.3s;
        }
        .sidebar.open .toggle-btn .icon {
            transform: rotate(180deg);
        }
    </style>
</head>
<body>
<div class="sidebar-container">
    <aside id="sidebar" class="sidebar">
        <div>
            <div class="sidebar-header">
                <div class="brand-name">Eloria</div>
                <input type="text" class="search-bar" placeholder="Search...">
            </div>
            <div class="sidebar-section">
                <div class="section-title">Main</div>
                <ul class="sidebar-list">
                    <li>
                        <a href="accueil.php">
                            <span class="icon"><i class="fas fa-home"></i></span>
                            Home
                        </a>
                    </li>
                    <li>
                        <a href="collection.php">
                            <span class="icon"><i class="fas fa-th-large"></i></span>
                            Collections
                        </a>
                    </li>
                    <li>
                        <a href="aboutus.php">
                            <span class="icon"><i class="fas fa-users"></i></span>
                            About us
                        </a>
                    </li>
                    <li>
                        <a href="favorites.php">
                            <span class="icon"><i class="fas fa-heart"></i></span>
                            Favorites
                        </a>
                    </li>
                    <li>
                        <a href="statistic.php">
                            <span class="icon"><i class="fas fa-chart-bar"></i></span>
                            Statistics
                        </a>
                    </li>
                </ul>
            </div>
            <div class="sidebar-section communication">
                <div class="section-title">Communication</div>
                <ul class="sidebar-list">
                    <li>
                        <a href="Notification.php">
                            <span class="icon"><i class="fas fa-bell"></i></span>
                            Notifications
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div>
            <div class="sidebar-profile">
                <span class="profile-icon"><i class="fas fa-user"></i></span>
                <div class="profile-info">
                    <span class="profile-name">John Doe</span>
                    <span class="profile-email">john.doe@email.com</span>
                </div>
            </div>
            <hr class="sidebar-divider">
            <div class="sidebar-help">
                <ul class="sidebar-list">
                    <li>
                        <a href="#">
                            <span class="icon"><i class="fas fa-question-circle"></i></span>
                            Help
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </aside>
    <button id="toggle-btn" class="toggle-btn">
        <span class="icon">&gt;</span>
    </button>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function() {
  const sidebar = document.getElementById('sidebar');
  const toggleBtn = document.getElementById('toggle-btn');
  const triggerZone = 50; // Zone de déclenchement en pixels depuis le bord gauche

  // Événement pour la zone de survol
  document.addEventListener('mousemove', (e) => {
    // Si la souris est dans la zone de déclenchement et la sidebar est fermée
    if (e.clientX < triggerZone && !sidebar.classList.contains('open')) {
      sidebar.classList.add('open');
    }
  });

  // Événement pour cacher la sidebar quand la souris s'éloigne
  sidebar.addEventListener('mouseleave', () => {
    sidebar.classList.remove('open');
  });

  // Événement pour basculer avec le bouton
  toggleBtn.addEventListener('click', () => {
    sidebar.classList.toggle('open');
  });
});
</script>
</body>
</html>