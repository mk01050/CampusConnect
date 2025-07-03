<%-- 
    Document   : studentAssignment
    Created on : Apr 23, 2025, 4:37:29 PM
    Author     : mkros
--%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Optional"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="in.mk.model.StudentSubmission"%>
<%@page import="in.mk.main.util.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%@page import="in.mk.model.Assignment"%>
<%@page import="in.mk.model.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>

            .submission-card {
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 10px;
                padding: 20px;
                margin-bottom: 20px;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            }

            .submission-card h4 {
                color: #5b6ef5;
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
            }

            .form-group input[type="file"] {
                padding: 8px;
                font-size: 14px;
                border-radius: 6px;
                border: 1px solid #ccc;
                width: 75%;
                margin-bottom: 10px;
            }

            .form-group button {
                display:block;
                background-color: #5b6ef5;
                color: white;
                padding: 10px 16px;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                font-size: 1rem;
            }

            .form-group button:hover {
                background-color: #6f6fff;
            }

            .submitted {
                color: green;
                font-weight: bold;
            }
        </style>

    </head>
    <body>
        <h2>Assignments</h2>


        <%

            Student student = (Student) session.getAttribute("user");
            List<Assignment> assignments = (List<Assignment>) request.getAttribute("assignments");

            Session hibSession = HibernateUtil.getSessionFactory().openSession();

            for (Assignment a : assignments) {
                Optional<StudentSubmission> q = hibSession.createQuery("FROM StudentSubmission WHERE assignmentTitle = :title AND studentId = :sid", StudentSubmission.class).setParameter("title", a.getTitle()).setParameter("sid", student.getId()).uniqueResultOptional();
                StudentSubmission existingSubmission = null;
                if (q.isPresent()) {
                    existingSubmission = q.get();
                }
                SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy");
                String formattedDate = sdf.format(a.getDueDate());
        %>
        <div class="content-box" style="margin-bottom: 15px">
            <div class="submission-card" >
                <h3><%= a.getTitle()%></h3>
                <p><strong>Instructions:</strong> <%= a.getInstructions()%></p>
                <p><strong>Due Date:</strong> <%= formattedDate%></p>
                <a href="<%= a.getFilePath()%>" download>Download Assignment</a><br/>

                <% if (existingSubmission != null) {%>
                <p style="color: green;">✅ Submitted</p>
                <p>Your file: <a href="<%= existingSubmission.getFilePath()%>" target="_blank">View Submission</a></p>


                <form action="submitAssignment" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="assignmentTitle" value="<%= a.getTitle()%>"/>
                    <input type="hidden" name="studentId" value="<%= student.getId()%>"/>
                    <div class="form-group">
                        <label>Replace submission:</label>
                        <input type="file" name="studentFile" required />
                        <button type="submit">Update Submission</button>
                    </div>
                </form>
                <% } else {%>
                <form action="submitAssignment" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="assignmentTitle" value="<%= a.getTitle()%>"/>
                    <in put type="hidden" name="studentId" value="<%= student.getId()%>"/>
                    <div class="form-group">
                        <label>Upload your file:</label>
                        <input type="file" name="studentFile" required />
                        <button type="submit">Submit</button>
                    </div>
                </form>
                <% } %>
            </div>
        </div>
        <%
            }
            hibSession.close();
        %>



    </body>
</html>
