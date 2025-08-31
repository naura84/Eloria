<?php

?>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Forgot Password</title>

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

                h1 {
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
            <h1>Forgot Password</h1>
            <form method="post" action="sent-code.php">  
                <label for="email">Eloria</label>
                <input type="email" name="email" id="email" placeholder="type your address email">
                <button>Receive the token</button>
            </form>
        </div>
    </body>
    </html>