<%-- 
    Document   : teacherAssignmentReview
    Created on : Apr 24, 2025, 1:06:42 AM
    Author     : mkros
--%>

<%@page import="java.util.Optional"%>
<%@page import="in.mk.model.StudentGrade"%>
<%@page import="in.mk.model.Student"%>
<%@page import="java.util.List"%>
<%@page import="in.mk.model.StudentSubmission"%>
<%@page import="in.mk.main.util.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f8f9fa;
                
            }
            .submission-card {
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 10px;
                padding: 20px;
                margin-bottom: 20px;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            }

            .submission-card h4 {
                color: #6f6fff;;
                margin-top: 0;
            }

            .submission-card p {
                margin: 8px 0;
                font-weight: 500;
            }

            .submission-card a {
                display: inline-block;
                margin-top: 5px;
                text-decoration: none;
                color: #333;
                background-color: #f1f1f1;
                padding: 8px 14px;
                border-radius: 6px;
                transition: background-color 0.3s ease;
            }

            .submission-card a:hover {
                background-color: #ddd;
            }

            .form-group {
                margin-top: 10px;
                margin-bottom: 10px;
            }

            .form-group input[type="number"] {
                padding: 10px;
                width: 80px;
                font-size: 1rem;
                border-radius: 8px;
                border: 1px solid #ddd;
            }

            input:focus {
                border: 1px solid #6f6fff;
                outline: none;
            }

            .form-group button {
                background-color: #5b6ef5;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                font-size: 1rem;
                margin-left: 10px;
            }

            .form-group button:hover {
                background-color: #6f6fff;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Submitted Assignments!</h1>
        <%
            Session hibSession = HibernateUtil.getSessionFactory().openSession();
            List<StudentSubmission> submissions = hibSession.createQuery("FROM StudentSubmission", StudentSubmission.class).list();

            for (StudentSubmission sub : submissions) {
                Student student = hibSession.get(Student.class, sub.getStudentId());

                Optional<StudentGrade> gradeQuery = hibSession.createQuery("FROM StudentGrade WHERE assignmentTitle = :title AND studentId = :id", StudentGrade.class).setParameter("title", sub.getAssignmentTitle()).setParameter("id", sub.getStudentId()).uniqueResultOptional();
                        
                StudentGrade gradeObj = null;
                if(gradeQuery.isPresent() ){
                gradeObj = gradeQuery.get();
            }

        %>
        <div class="submission-card">
            <h4>Assignment: <%= sub.getAssignmentTitle()%></h4>
            <p>Student: <%= student.getName()%></p>
            <a href="<%= sub.getFilePath()%>" target="_blank">📄 View Submitted File</a>

            <form action="grade" method="post" style="margin-top: 10px;">
                <input type="hidden" name="assignmentTitle" value="<%= sub.getAssignmentTitle()%>" />
                <input type="hidden" name="studentId" value="<%= sub.getStudentId()%>" />
                
                <div class="form-group">
                    
                Grade (out of 10): <input type="number" name="grade" min="0" max="10" value="<%= gradeObj != null ? gradeObj.getGrade() : ""%>" required />
                <button type="submit">Submit Grade</button>
                </div>
            </form>

        </div>
        <%
            }
            hibSession.close();
        %>
    </body>
</html>
