/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.FaceBook;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Kiran
 */
public class SendRequest extends HttpServlet {

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
            HttpSession session = request.getSession();

            String requestFrom = session.getAttribute("username").toString();

            String requestTo = request.getParameter("rto");

            String status = request.getParameter("status");

            PreparedStatement pst = DataBaseConnetion.getconnection().prepareStatement("select * from frndlist where rto=? and rfrom=? ");

            pst.setString(1, requestTo);
            pst.setString(2, requestFrom);

            ResultSet rs = pst.executeQuery();

            if (!(rs.next())) {

                String list = "insert into frndlist (rfrom,rto,status)values('" + requestFrom + "','" + requestTo + "','" + status + "')";

                PreparedStatement ps = DataBaseConnetion.getconnection().prepareStatement(list);

                ps.executeUpdate(list);

                out.println("<script type=\"text/javascript\">");
                out.println("alert('Request sent');");
                out.println("location='userhome.jsp';");
                out.println("</script>");

            } else {

                out.println("<script type=\"text/javascript\">");
                out.println("alert('Already sent');");
                out.println("location='userhome.jsp';");
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
