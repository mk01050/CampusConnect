<%-- 
    Document   : teacherAssignment
    Created on : Apr 23, 2025, 2:51:20 PM
    Author     : mkros
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assignment</title>
    </head>
    <body>
        <h2>Upload Assignment</h2>
        <form action="uploadAssignment" method="post" enctype="multipart/form-data">
            <label for="title">Assignment Title:</label><br>
            <input type="text" name="title" required><br><br>

            <label for="instructions">Instructions:</label><br>
            <textarea name="instructions" rows="4" cols="50" required></textarea><br><br>

            <label for="dueDate">Due Date:</label><br>
            <input type="date" name="dueDate" required><br><br>

            <label for="file">Upload File (PDF, JPG, etc):</label><br>
            <input type="file" name="file" required><br><br>

            <input type="submit" value="Upload Assignment">
        </form>
    </body>
</html>
