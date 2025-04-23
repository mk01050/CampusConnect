<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            background-color: #fff;
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
        
        h2 {
            font-size: 2.5em;
            font-weight: bold;
            color: #222;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 12px;
            width: 300px;
            text-align: left;
        }
        input[type="text"],
        input[type="password"] {
            padding: 12px;
            border-radius: 25px;
            border: 1px solid #6f6fff;
            outline: none;
        }
        input[type="submit"] {
            padding: 12px;
            border: 2px solid #6f6fff;
            border-radius: 25px;
            background-color: #6f6fff;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #5544dd;
        }
        label {
            font-weight: bold;
            margin-left: 10px;
        }
        .radio-group {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-left: 10px;
        }
        .radio-wrapper {
            display: flex;
            align-items: center;
            gap: 5px;
        }
        p {
            margin-top: 10px;
        }
        a {
            color: #6f6fff;
            text-decoration: none;
        }
    </style>
</head>
<body>
    
    <h2>User Registration</h2>
    <form action="register" method="post">
        <label for="name">Name:</label>
        <input type="text" name="name" required />

        <label for="email">Email:</label>
        <input type="text" name="email" required />

        <label for="password">Password:</label>
        <input type="password" name="password" required />

        <label>Role:</label>
        <div class="radio-group">
            <div class="radio-wrapper">
                <input type="radio" name="role" value="teacher" required>
                <label for="role">Teacher</label>
            </div>
            <div class="radio-wrapper">
                <input type="radio" name="role" value="student" required>
                <label for="role">Student</label>
            </div>
        </div>

        <input type="submit" value="Register"/>
    </form>

    <p>Already registered? <a href="login.jsp">Login here</a></p>
</body>
</html>
