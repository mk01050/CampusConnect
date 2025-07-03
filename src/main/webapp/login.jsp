<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700&family=Rubik:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Rubik', sans-serif;
            background-color: #fff;
            color: #1a1a1a;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            text-align: center;
        }
        
        header {
            width: 100%;
            position: absolute;
            top: 0;
            left: 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 40px;
            box-sizing: border-box;
        }

        .brand {
            position: absolute;
            top: 20px;
            left: 40px;
            font-weight: bold;
            color: #6c63ff;
            font-family: 'Montserrat', sans-serif;
        }

        h2 {
            font-size: 2.5rem;
            font-weight: bold;
            font-style: italic;
        }

        p.subtitle {
            margin-bottom: 30px;
            font-size: 1rem;
            color: #555;
        }

        form {
            width: 300px;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        input[type="text"],
        input[type="password"] {
            padding: 12px;
            border-radius: 25px;
            border: 1.5px solid #6c63ff;
            font-size: 1rem;
            outline: none;
            padding-left: 20px;
        }

        input[type="submit"] {
            padding: 12px;
            border-radius: 25px;
            border: 2px solid #6c63ff;
            background-color: white;
            color: #6c63ff;
            font-weight: bold;
            font-family: 'Montserrat', sans-serif;
            font-size: 1rem;
            cursor: pointer;
            transition: 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #6c63ff;
            color: white;
        }

        .register {
            margin-top: 20px;
            font-size: 0.9rem;
        }

        .register a {
            color: #6c63ff;
            font-weight: 500;
            text-decoration: none;
        }

        .footer {
            position: absolute;
            bottom: 20px;
            font-size: 0.9rem;
            color: #6c63ff;
            font-weight: bold;
        }

        .footer span {
            color: gold;
        }
    </style>
</head>
<body>
    <div class="brand">Campus Connect</div>

    <h2>Login</h2>
    <p class="subtitle">You're one step away!</p>

    <form method="post" action="login">
        <input type="text" name="email" placeholder="Email" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="submit" value="Submit">
    </form>

    <div class="register">
        Don't have an account? <a href="register.jsp">SignUp</a>
    </div>

    <div class="footer">Created with <span>💛</span></div>
</body>
</html>
