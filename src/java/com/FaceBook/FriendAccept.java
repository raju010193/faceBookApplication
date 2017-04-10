/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.FaceBook;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Kiran
 */
public class FriendAccept extends HttpServlet {

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
        try {
            PrintWriter out = response.getWriter();


            HttpSession session = request.getSession();
            String username = session.getAttribute("username").toString();

            Statement st = null;

            String requestFrom = request.getParameter("rfrom");


            String status = request.getParameter("status");


            PreparedStatement pstmt = DataBaseConnetion.getconnection().prepareStatement("Update frndlist set status='" + status + "' where rto='" + username + "' and rfrom='" + requestFrom + "' ");

            pstmt.executeUpdate();

            PreparedStatement pst = DataBaseConnetion.getconnection().prepareStatement("select * from frndlist where rto=? and rfrom=? ");

            pst.setString(1, requestFrom);
            pst.setString(2, username);

            ResultSet res = pst.executeQuery();

            if (!(res.next())) {
                Connection con = DataBaseConnetion.getconnection();
                PreparedStatement psmt = con.prepareStatement("insert into frndlist(rfrom,rto,status) values('" + username + "','" + requestFrom + "','" + status + "')");
                psmt.executeUpdate();

                out.println("<script type=\"text/javascript\">");
                out.println("alert('Accepeted Successfully');");
                out.println("location='userhome.jsp';");
                out.println("</script>");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Done Successfully');");
                out.println("location='userhome.jsp';");
                out.println("</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            System.out.close();
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
