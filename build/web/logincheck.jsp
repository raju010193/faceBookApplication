

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="dbconnection.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"   />
        <title> Hybrid Approach for Detecting Malicious Facebook Applications Using Frappe</title>
    </head>

    <body>
        <%

            String username = request.getParameter("username");

            String password = request.getParameter("password");
  HttpSession session1=request.getSession();
            session1.setAttribute("username", username);
        %>
        <%
            try {

                if (username.equals("admin") && password.equals("admin")) {
                    response.sendRedirect("adminhome.jsp");
                    return;
                } else if (!(username.equals("")) && !(password.equals(""))) {
                    PreparedStatement pst = con.prepareStatement("select * from register where username=? and password=? ");

                    pst.setString(1, username);

                    pst.setString(2, password);
                    ResultSet rs = pst.executeQuery();
                    if ((rs.next())) {


                        String s = rs.getString("username");
                        session.setAttribute("username", s);
                        session.setAttribute("uid", rs.getString("uid"));

                        response.sendRedirect("userhome.jsp");
                        return;
                    } else {

        %>

        <%
               System.out.println("last" + st);
           }%>
        <script language="javascript" type="text/javascript">
            alert('Login Failed...User Not Available in the Group');

            window.location = "index.jsp";
        </script>
        <%
            }%>

        <script language="javascript" type="text/javascript">
            alert('Login Failed...');

            window.location = "index.jsp";
        </script>



        <%

            } catch (Exception e) {
                e.printStackTrace();

            }

        %>
    </body>
</html>