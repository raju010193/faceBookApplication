/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.FaceBook;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Kiran
 */
public class AddAppliction extends HttpServlet {

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

            List<String> message = new ArrayList<String>();
            String finalimage = "";
            boolean isMultipart = ServletFileUpload.isMultipartContent(
                    request);
            List<String> addApp = new ArrayList<String>();
            File savedFile;

            if (!isMultipart) {
            } else {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = null;

                try {

                    items = upload.parseRequest(request);
                } catch (FileUploadException e) {
                }
                Iterator itr = items.iterator();
                while (itr.hasNext()) {

                    List<String> al = new ArrayList<String>();

                    String sss = "";
                    FileItem item = (FileItem) itr.next();
                    String value = "";
                    String abc[];
                    if (item.isFormField()) {

                        String name = item.getFieldName();
                        value = item.getString();
                        al.add(value);
                        for (int i = 0; i < al.size(); i++) {
                            sss += al.get(i);



                        }

                        abc = sss.split("-");
                        for (int i = 0; i < abc.length; i++) {


                            addApp.add(abc[i]);
                        }
                    } else {
                        String itemName = item.getName();
                        Random generator = new Random();
                        int r = Math.abs(generator.nextInt());

                        String reg = "[.*]";
                        String replacingText = "";
                        Pattern pattern = Pattern.compile(reg);
                        Matcher matcher = pattern.matcher(itemName);
                        StringBuffer buffer = new StringBuffer();

                        while (matcher.find()) {
                            matcher.appendReplacement(buffer, replacingText);
                        }
                        int IndexOf = itemName.indexOf(".");
                        int Indexf = itemName.indexOf(".");
                        String domainName = itemName.substring(IndexOf);

                        finalimage = buffer.toString() + domainName;

                        message.add(finalimage);
                         String ipath=request.getRealPath("./apps");

                        savedFile = new File(ipath+"//" + finalimage);

                        item.write(savedFile);


                    }
                }
            }

            HttpSession session1 = request.getSession();
            String username = (String) session1.getAttribute("username");


            String Apps = "";
            System.out.println("" + username + "','" + addApp.get(0) + "','" + addApp.get(1) + " " + addApp.get(2) + " " + addApp.get(3) + "," + message.get(0));

            PreparedStatement ps = DataBaseConnetion.getconnection().prepareStatement(Apps);


            Apps = "insert into app(username,appid,appname,appurl,status,appicon)values('" + username + "','" + addApp.get(0) + "','" + addApp.get(1) + "','" + addApp.get(2) + "','" + addApp.get(3) + "','" + message.get(0) + "')";

            ps.executeUpdate(Apps);

            out.println("<script type=\"text/javascript\">");
            out.println("alert('Added and License Request Sent to Admin');");
            out.println("location='addApp.jsp';");
            out.println("</script>");

        } catch (Exception e) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Added and License Request is failed');");
            out.println("location='addApp.jsp';");
            out.println("</script>");
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
