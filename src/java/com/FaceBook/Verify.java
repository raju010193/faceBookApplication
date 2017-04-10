/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.FaceBook;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kiran
 */
public class Verify extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            String appURL = request.getParameter("appurl");

            String licenseNo = request.getParameter("licenseno");

            Statement st = null;


            String URL = request.getParameter("appurl");

            PreparedStatement pst = DataBaseConnetion.getconnection().prepareStatement("select * from malicious where malicious=? ");

            pst.setString(1, appURL);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {

                out.println("<script type=\"text/javascript\">");
                out.println("alert('It's declared as Malicious Application');");
                out.println("location='frappe.jsp';");
                out.println("</script>");

            } else {

                String aid = request.getParameter("aid");

                PreparedStatement ps1 = DataBaseConnetion.getconnection().prepareStatement("Update app set status=?, licenseno=? where aid=? ");
                ps1.setString(1, "Licensed");

                ps1.setString(2, licenseNo);
                ps1.setString(3, aid);

                ps1.executeUpdate();

                out.println("<script type=\"text/javascript\">");
                out.println("alert('Verified and License Activated');");
                out.println("location='frappe.jsp';");
                out.println("</script>");

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
