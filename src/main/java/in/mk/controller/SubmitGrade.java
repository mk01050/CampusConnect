/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package in.mk.controller;

import in.mk.main.util.HibernateUtil;
import in.mk.model.StudentGrade;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Optional;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author mkros
 */
@WebServlet(name = "SubmitGrade", urlPatterns = {"/grade"})
public class SubmitGrade extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String assignmentTitle = request.getParameter("assignmentTitle");
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        int grade = Integer.parseInt(request.getParameter("grade"));

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();

        try {
            Optional<StudentGrade> gradeQuery = session.createQuery("FROM StudentGrade WHERE assignmentTitle = :title AND studentId = :id", StudentGrade.class)
                    .setParameter("title", assignmentTitle)
                    .setParameter("id", studentId)
                    .uniqueResultOptional();
            
            StudentGrade gradeObj = null;
            if(gradeQuery.isPresent()){
                gradeObj = gradeQuery.get();
            }
            if (gradeObj != null) {
                gradeObj.setGrade(grade);
                session.update(gradeObj);

            } else {
                StudentGrade newGrade = new StudentGrade();
                newGrade.setAssignmentTitle(assignmentTitle);
                newGrade.setStudentId(studentId);
                newGrade.setGrade(grade);
                session.save(newGrade);
            }
            transaction.commit();

        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
        } finally {
            session.close();
            response.sendRedirect("teacherDashboard.jsp?page=teacherAssignmentReview.jsp");
        }

    }

}
