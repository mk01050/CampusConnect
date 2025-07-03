/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package in.mk.controller;

import in.mk.main.util.HibernateUtil;
import in.mk.model.Student;
import in.mk.model.StudentSubmission;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import java.util.Optional;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author mkros
 */
@MultipartConfig
@WebServlet(name = "SubmitAssignment", urlPatterns = {"/submitAssignment"})
public class SubmitAssignment extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String SAVE_DIR = "student_submissions";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession hsession = request.getSession(false);
        Student student = (Student) hsession.getAttribute("user");

        String assignmentTitle = request.getParameter("assignmentTitle");
        int studentId = student.getId();

        Part filePart = request.getPart("studentFile");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String appPath = request.getServletContext().getRealPath("");
        String savePath = appPath + File.separator + SAVE_DIR;

        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }

        String filePath = SAVE_DIR + File.separator + fileName;
        filePart.write(savePath + File.separator + fileName);

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();

        try {

            Optional<StudentSubmission> existing = session.createQuery(
                    "FROM StudentSubmission WHERE assignmentTitle = :title AND studentId = :sid", StudentSubmission.class)
                    .setParameter("title", assignmentTitle)
                    .setParameter("sid", studentId)
                    .uniqueResultOptional();

            if (existing.isPresent()) {

                StudentSubmission exist = existing.get();
                exist.setFilePath(filePath);
                session.update(exist);
                
            } else {
                StudentSubmission submission = new StudentSubmission();
                submission.setAssignmentTitle(assignmentTitle);
                submission.setStudentId(studentId);
                submission.setFilePath(filePath);
                session.save(submission);
                }

            transaction.commit();

        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
        } finally {
            session.close();
            response.sendRedirect("viewAssignment");
        }
    }

}
