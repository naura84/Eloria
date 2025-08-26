<!DOCTYPE html>
   <html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">

      <!--=============== REMIXICONS ===============-->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.2.0/remixicon.css">

   </head>
   <style>
    @import url("https://fonts.googleapis.com/css2?family=Nunito+Sans:opsz,wght@6..12,200..1000&display=swap");
    @import url('https://fonts.googleapis.com/css2?family=Lavishly+Yours&display=swap');
/*=============== VARIABLES CSS ===============*/
:root {
  --header-height: 3.5rem;

  /*========== Colors ==========*/
  /*Color mode HSL(hue, saturation, lightness)*/
  --first-color: #090a49ff; /* bleu principal */
  --title-color: hsl(228, 18%, 16%);
  --text-color: hsl(228, 8%, 56%);
  --body-color: hsl(228, 100%, 99%);
  --shadow-color: hsla(228, 80%, 4%, .1);

  /*========== Font and typography ==========*/
  /*.5rem = 8px | 1rem = 16px ...*/
  --body-font: "Nunito Sans", system-ui;
  --normal-font-size: .938rem;
  --smaller-font-size: .75rem;
  --tiny-font-size: .75rem;

  /*========== Font weight ==========*/
  --font-regular: 400;
  --font-semi-bold: 600;

  /*========== z index ==========*/
  --z-tooltip: 10;
  --z-fixed: 100;
}

/*========== Responsive typography ==========*/
@media screen and (min-width: 1150px) {
  :root {
    --normal-font-size: 1rem;
    --smaller-font-size: .813rem;
  }
}

/*=============== BASE ===============*/
* {
  box-sizing: border-box;
  padding: 0;
  margin: 0;
}

body {
  font-family: var(--body-font);
  font-size: var(--normal-font-size);
  background-color: var(--body-color);
  color: var(--text-color);
  transition: background-color .4s;
}

a {
  text-decoration: none;
}

img {
  display: block;
  max-width: 100%;
  height: auto;
}

button {
  all: unset;
}

/*=============== VARIABLES DARK THEME ===============*/
body.dark-theme {
  --first-color: #090a49ff; /* bleu principal */
  --title-color: hsl(228, 18%, 96%);
  --text-color: hsl(228, 12%, 61%);
  --body-color: hsl(228, 24%, 16%);
  --shadow-color: hsla(228, 80%, 4%, .3);
}

/*========== 
	Color changes in some parts of 
	the website, in dark theme
==========*/
.dark-theme .sidebar__content::-webkit-scrollbar {
  background-color: hsl(228, 16%, 30%);
}

.dark-theme .sidebar__content::-webkit-scrollbar-thumb {
  background-color: hsl(228, 16%, 40%);
}

/*=============== REUSABLE CSS CLASSES ===============*/
.container {
  margin-inline: 1.5rem;
}

.main {
  padding-top: 5rem;
}

/*=============== HEADER ===============*/
.header {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: var(--z-fixed);
  margin: .75rem;
}

.header__container {
  width: 100%;
  height: var(--header-height);
  background-color: var(--body-color);
  box-shadow: 0 2px 24px var(--shadow-color);
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-inline: 1.5rem;
  border-radius: 1rem;
  transition: background-color .4s;
}

.header__logo span {
  color: var(--title-color);
  font-weight: var(--font-semi-bold);
}

.lavishly-yours-regular {
  font-family: "Lavishly Yours", cursive;
  font-weight: 400;
  font-style: normal;
}

.header__toggle {
  font-size: 1.5rem;
  color: var(--title-color);
  cursor: pointer;
}

/*=============== SIDEBAR ===============*/
.sidebar {
  position: fixed;
  left: -120%;
  top: 0;
  bottom: 0;
  z-index: var(--z-fixed);
  width: 240px; /* largeur fixée à 240px */
  background-color: var(--body-color);
  box-shadow: 2px 0 24px var(--shadow-color);
  padding-block: 1.5rem;
  margin: .75rem;
  border-radius: 1rem;
  transition: left .4s, background-color .4s, width .4s;
}

.sidebar__container, 
.sidebar__content {
  display: flex;
  flex-direction: column;
  row-gap: 3rem;
}

.sidebar__container {
  height: 100%;
  overflow: hidden;
}

.sidebar__user {
  display: flex;
  align-items: center;
  padding-left: 2rem;
  margin-bottom: 1.5rem;
}

.sidebar__img {
  position: relative;
  width: 50px;
  height: 50px;
  background-color: #090a49ff; /* bleu principal */
  border-radius: 50%;
  overflow: hidden;
  display: grid;
  justify-items: center;
}

.sidebar__img img {
  position: absolute;
  width: 36px;
  bottom: -1px;
}

.sidebar__info {
  display: flex;
  flex-direction: column;
  gap: 2px; /* rapproche nom et email */
}

.sidebar__info h3 {
  font-size: var(--normal-font-size);
  color: var(--title-color);
  transition: color .4s;
}

.sidebar__info span {
  font-size: var(--smaller-font-size);
}

.sidebar__content {
  overflow: hidden auto;
}

.sidebar__content::-webkit-scrollbar {
  width: .4rem;
  background-color: hsl(228, 8%, 85%);
}

.sidebar__content::-webkit-scrollbar-thumb {
  background-color: hsl(228, 8%, 75%);
}

.sidebar__title {
  width: max-content;
  font-size: var(--tiny-font-size);
  font-weight: var(--font-semi-bold);
  padding-left: 2rem;
  margin-bottom: 1.5rem;
}

.sidebar__list, 
.sidebar__actions {
  display: grid;
  row-gap: 1.5rem;
}

.sidebar__link {
  position: relative;
  display: grid;
  grid-template-columns: repeat(2, max-content);
  align-items: center;
  column-gap: 1rem;
  color: var(--text-color);
  padding-left: 2rem;
  transition: color .4s, opacity .4s;
}

.sidebar__link i {
  font-size: 1.25rem;
}

.sidebar__link span {
  font-weight: var(--font-semi-bold);
}

.sidebar__link:hover {
  color: #090a49ff; /* bleu principal */
}

.sidebar__actions {
  margin-top: auto;
}

.sidebar__actions button {
  cursor: pointer;
}

.sidebar__theme {
  width: 100%;
  font-size: 1.25rem;
}

.sidebar__theme span {
  font-size: var(--normal-font-size);
  font-family: var(--body-font);
}

/* Show sidebar */
.show-sidebar {
  left: 0;
}

/* Active link */
.active-link {
  color: #090a49ff; /* bleu principal */
}

.active-link::after {
  content: "";
  position: absolute;
  left: 0;
  width: 3px;
  height: 20px;
  background-color: #090a49ff; /* bleu principal */
}

/*=============== BREAKPOINTS ===============*/
/* For small devices */
@media screen and (max-width: 360px) {
  .header__container {
    padding-inline: 1rem;
  }

  .sidebar {
    width: max-content;
  }
  .sidebar__info, 
  .sidebar__link span {
    display: none;
  }
  .sidebar__user, 
  .sidebar__list, 
  .sidebar__actions {
    justify-content: center;
  }
  .sidebar__user, 
  .sidebar__link {
    grid-template-columns: max-content;
  }
  .sidebar__user {
    padding: 0;
  }
  .sidebar__link {
    padding-inline: 2rem;
  }
  .sidebar__title {
    padding-inline: .5rem;
    margin-inline: auto;
  }
}

/* For large devices */
@media screen and (min-width: 1150px) {
  .header {
    margin: 1rem;
    padding-left: 260px;
    transition: padding .4s;
  }
  .header__container {
    height: calc(var(--header-height) + 2rem);
    padding-inline: 2rem;
  }
  .header__logo {
    order: 1;
  }

  .sidebar {
    left: 0;
    width: 240px; /* largeur fixée à 240px */
    margin: 1rem;
  }
  .sidebar__info, 
  .sidebar__link span {
    transition: opacity .4s;
  }
  .sidebar__user, 
  .sidebar__title {
    transition: padding .4s;
  }

  /* Reduce sidebar */
  .show-sidebar {
    width: 90px;
  }
  .show-sidebar .sidebar__user {
    padding-left: 1.25rem;
  }
  .show-sidebar .sidebar__title {
    padding-left: 0;
    margin-inline: auto;
  }
  .show-sidebar .sidebar__info, 
  .show-sidebar .sidebar__link span {
    opacity: 0;
  }

  .main {
    padding-left: 340px;
    padding-top: 8rem;
    transition: padding .4s;
  }

  /* Add padding left */
  .left-pd {
    padding-left: 114px;
  }
}

.sidebar__user i.ri-account-circle-line {
  font-size: 3rem; /* encore plus grande */
  color: #090a49ff;
  margin-right: 0.5rem; /* rapproche les écritures */
  vertical-align: middle;
  display: inline-block;
}
   </style>
   <body>
      <!--=============== HEADER ===============-->
      <header class="header" id="header">
         <div class="header__container">
            <a href="#" class="header__logo">
               <span class="lavishly-yours-regular" style="font-size:3.2rem; letter-spacing:0.12em; font-weight:400; width:230px; display:inline-block; margin-left:-70px;">Eloria</span>
            </a>
            
            <button class="header__toggle" id="header-toggle">
               <i class="ri-menu-line"></i>
            </button>
         </div>
      </header>

      <!--=============== SIDEBAR ===============-->
      <nav class="sidebar" id="sidebar">
         <div class="sidebar__container">
            
            <div class="sidebar__content">
               <div>
                  <h3 class="sidebar__title">MANAGE</h3>

                  <div class="sidebar__list">
                     <a href="#" class="sidebar__link active-link">
                       <i class="ri-home-8-line"></i>
                        <span>Home</span>
                     </a>
                     
                     <a href="#" class="sidebar__link">
                        <i class="ri-vip-crown-line"></i>
                        <span>Collections</span>
                     </a>

                     <a href="#" class="sidebar__link">
                        <i class="ri-team-line"></i>
                        <span>About us</span>
                     </a>

                     <a href="#" class="sidebar__link">
                        <i class="ri-heart-2-line"></i>
                        <span>Favorites</span>
                     </a>

                     <a href="#" class="sidebar__link">
                        <i class="ri-bar-chart-box-fill"></i>
                        <span>Statistics</span>
                     </a>
                  </div>
               </div>

               <div>
                  <h3 class="sidebar__title">SETTINGS</h3>

                  <div class="sidebar__list">
                     <a href="#" class="sidebar__link">
                        <i class="ri-settings-3-fill"></i>
                        <span>Settings</span>
                     </a>

                     <a href="#" class="sidebar__link">
                        <i class="ri-notification-2-fill"></i>
                        <span>Notifications</span>
                     </a>
                     <div class="sidebar__actions">
               <button>
                  <i class="ri-moon-clear-fill sidebar__link sidebar__theme" id="theme-button">
                     <span>Theme</span>
                  </i>
               </button>
            </div>
                  </div>
               </div>
            </div>
            
            <div class="sidebar__user">
                 <i class="ri-account-circle-line"></i>
               <div class="sidebar__info">
                  <h3>Rix Methil</h3>
                  <span>rix123@email.com</span>
               </div>
            </div>

         </div>
      </nav>

      <!--=============== MAIN ===============-->
      <main class="main container" id="main">
      </main>
      
      <!--=============== MAIN JS ===============-->
      <script>
        const showSidebar = (toggleId, sidebarId, headerId, mainId) =>{
   const toggle = document.getElementById(toggleId),
         sidebar = document.getElementById(sidebarId),
         header = document.getElementById(headerId),
         main = document.getElementById(mainId)

   if(toggle && sidebar && header && main){
       toggle.addEventListener('click', ()=>{
           /* Show sidebar */
           sidebar.classList.toggle('show-sidebar')
           /* Add padding header */
           header.classList.toggle('left-pd')
           /* Add padding main */
           main.classList.toggle('left-pd')
       })
   }
}
showSidebar('header-toggle','sidebar', 'header', 'main')

/*=============== LINK ACTIVE ===============*/
const sidebarLink = document.querySelectorAll('.sidebar__list a')

function linkColor(){
    sidebarLink.forEach(l => l.classList.remove('active-link'))
    this.classList.add('active-link')
}

sidebarLink.forEach(l => l.addEventListener('click', linkColor))

/*=============== DARK LIGHT THEME ===============*/ 
const themeButton = document.getElementById('theme-button')
const darkTheme = 'dark-theme'
const iconTheme = 'ri-sun-fill'

// Previously selected topic (if user selected)
const selectedTheme = localStorage.getItem('selected-theme')
const selectedIcon = localStorage.getItem('selected-icon')

// We obtain the current theme that the interface has by validating the dark-theme class
const getCurrentTheme = () => document.body.classList.contains(darkTheme) ? 'dark' : 'light'
const getCurrentIcon = () => themeButton.classList.contains(iconTheme) ? 'ri-moon-clear-fill' : 'ri-sun-fill'

// We validate if the user previously chose a topic
if (selectedTheme) {
  // If the validation is fulfilled, we ask what the issue was to know if we activated or deactivated the dark
  document.body.classList[selectedTheme === 'dark' ? 'add' : 'remove'](darkTheme)
  themeButton.classList[selectedIcon === 'ri-moon-clear-fill' ? 'add' : 'remove'](iconTheme)
}

// Activate / deactivate the theme manually with the button
themeButton.addEventListener('click', () => {
    // Add or remove the dark / icon theme
    document.body.classList.toggle(darkTheme)
    themeButton.classList.toggle(iconTheme)
    // We save the theme and the current icon that the user chose
    localStorage.setItem('selected-theme', getCurrentTheme())
    localStorage.setItem('selected-icon', getCurrentIcon())
})

      </script>
   </body>
</html>