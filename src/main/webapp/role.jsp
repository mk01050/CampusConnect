<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>What's Your Role</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #fff;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
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
            font-size: 2em;
            color: #222;
            margin-bottom: 20px;
        }

        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            width: 320px;
            text-align: center;
        }

        input[type="radio"] {
            margin: 0 5px 0 15px;
        }

        label {
            font-weight: bold;
        }

        button {
            margin-top: 20px;
            padding: 12px 30px;
            border: none;
            border-radius: 25px;
            background-color: #6f6fff;
            color: white;
            font-weight: bold;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        button:hover {
            background-color: #5544dd;
        }
    </style>
</head>
<body>
    <header>
        <div class="brand">Campus Connect</div>
        <a href="role.jsp" class="roles-link">Roles</a>
    </header>
    <div class="container">
        <h2>Select Your Role</h2>
        <form action="role-handler.jsp" method="post">
            <input type="radio" name="role" value="teacher" required>
            <label>Teacher</label>
            <br>

            <input type="radio" name="role" value="student" required>
            <label>Student</label>
            <br>

            <button type="submit">Done</button>
        </form>
    </div>
</body>
</html>
