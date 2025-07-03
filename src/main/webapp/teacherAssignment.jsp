<%-- 
    Document   : teacherAssignment
    Created on : Apr 23, 2025, 2:51:20 PM
    Author     : mkros
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
       /* General form styling */
       .form-group {
           margin-bottom: 2px;
       }
       
       .form-group label {
           display: block;
           font-weight: 600;
           margin-bottom: 5px;
       }
       
       .form-group input[type="text"],
       .form-group input[type="date"],
       .form-group textarea,
       .form-group input[type="file"] {
           width: 100%;
           padding: 10px;
           border-radius: 8px;
           border: 1px solid #ddd;
           font-size: 1rem;
           /*margin-top: 5  px;*/
       }
       
        
       input:focus{
        border: 1px solid #6f6fff;
       }
       
       .form-group input[type="submit"] {
           background-color: #5b6ef5;
           color: white;
           padding: 12px 24px;
           border: none;
           border-radius: 8px;
           cursor: pointer;
           font-size: 1rem;
       }
       
       .form-group input[type="submit"]:hover {
           background-color: #6f6fff;
       }
       </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assignment</title>
    </head>
    <body>
        <h2>Upload Assignment</h2>
        <form action="uploadAssignment" method="post" enctype="multipart/form-data">
            
            <div class="form-group">    
            <label for="title">Assignment Title:</label>
            <input type="text" name="title" required><br><br>
            </div>

            <div class="form-group">
            <label for="instructions">Instructions:</label>
            <textarea name="instructions" rows="4" cols="50" required></textarea><br><br>
            </div>

            <div class="form-group">
            <label for="dueDate">Due Date:</label>
            <input type="date" name="dueDate" required><br><br>
            </div>

            <div class="form-group">
            <label for="file">Upload File (PDF, JPG, etc):</label>
            <input type="file" name="file" ><br><br>
            </div>

            <div class="form-group">
            <input type="submit" value="Upload Assignment">
            </div>
        </form>
    </body>
</html>
