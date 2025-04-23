/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package in.mk.controller;

import in.mk.main.util.HibernateUtil;
import in.mk.model.Assignment;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import java.sql.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author mkros
 */
@MultipartConfig
@WebServlet(name = "TeacherAssignment", urlPatterns = {"/uploadAssignment"})
public class TeacherAssignment extends HttpServlet {
    
    private static final String SAVE_DIR = "assignments";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String appPath = request.getServletContext().getRealPath("");
        String savePath = appPath + File.separator + SAVE_DIR;
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) fileSaveDir.mkdir();
        
        Part filePart = request.getPart("file");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String filePath = SAVE_DIR + File.separator + fileName;
        
        
        String title = request.getParameter("title");
        String instructions = request.getParameter("instructions");
        String dueDate = request.getParameter("dueDate");
        
        filePart.write(savePath + File.separator + fileName);
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        
        Assignment assignment = new Assignment();
        assignment.setTitle(title);
        assignment.setInstructions(instructions);
        assignment.setDueDate(Date.valueOf(dueDate));
        assignment.setFilePath(filePath);
        assignment.setCreatedAt(new java.util.Date());
                   
        try{
            session.persist(assignment);
            transaction.commit();
        
        }catch(Exception e){
            e.printStackTrace();
            transaction.rollback();
        }
        finally{
            session.close();
            response.sendRedirect("teacherDashboard.jsp?page=teacherAssignment.jsp");

        }
        
    }

   
}
