<%-- 
    Document   : studentAssignment
    Created on : Apr 23, 2025, 4:37:29 PM
    Author     : mkros
--%>


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
    </head>
    <body>
        <h2>Assignments</h2>
        <%

            Student student = (Student) session.getAttribute("user");
            List<Assignment> assignments = (List<Assignment>) request.getAttribute("assignments");

            Session hibSession = HibernateUtil.getSessionFactory().openSession();

            for (Assignment a : assignments) {
                Query<StudentSubmission> q = hibSession.createQuery("FROM StudentSubmission WHERE assignmentTitle = :title AND studentId = :sid", StudentSubmission.class).setParameter("title", a.getTitle()).setParameter("sid", student.getId());
                StudentSubmission existingSubmission = q.uniqueResult();
        %>
        <div style="border:1px solid #ccc; padding:10px; margin:10px;">
            <h3><%= a.getTitle()%></h3>
            <p><strong>Instructions:</strong> <%= a.getInstructions()%></p>
            <p><strong>Due Date:</strong> <%= a.getDueDate()%></p>
            <a href="<%= a.getFilePath()%>" download>Download Assignment</a><br/>

            <% if (existingSubmission != null) {%>
            <p style="color: green;">✅ Submitted</p>
            <p>Your file: <a href="<%= existingSubmission.getFilePath()%>" target="_blank">View Submission</a></p>


            <form action="submitAssignment" method="post" enctype="multipart/form-data">
                <input type="hidden" name="assignmentTitle" value="<%= a.getTitle()%>"/>
                <input type="hidden" name="studentId" value="<%= student.getId()%>"/>
                <label>Replace submission:</label>
                <input type="file" name="studentFile" required />
                <button type="submit">Update Submission</button>
            </form>
            <% } else {%>
            <form action="submitAssignment" method="post" enctype="multipart/form-data">
                <input type="hidden" name="assignmentTitle" value="<%= a.getTitle()%>"/>
                <input type="hidden" name="studentId" value="<%= student.getId()%>"/>
                Upload your file: <input type="file" name="studentFile" required />
                <button type="submit">Submit</button>
            </form>
            <% } %>
        </div>
        <%
            }
            hibSession.close();
        %>



    </body>
</html>
