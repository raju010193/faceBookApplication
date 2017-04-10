<%-- 
    Document   : search
    Created on : Mar 13, 2017, 4:20:45 PM
    Author     : Kiran
--%>


<%@include file="dbconnection.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/foundation.css" rel="stylesheet" type="text/css">
        <link href="css/foundation.min.css" rel="stylesheet" type="text/css">
        <link href="css/main.css" rel="stylesheet" type="text/css">
        <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>

        <script src="js/vendor/jquery.js" type="text/javascript"></script>
        <script src="js/foundation/foundation.js" type="text/javascript"></script>
        <meta charset="UTF-8">
        <title></title>
        <style>
            body{
                font-family: 'Roboto', sans-serif;
            }
        </style>
    </head>
    <body>
        <div class="row">
            <div class="large-12 columns left">
                <img src="img/logo.png" width="150" height="150">

            </div>
        </div>
        <div class="row">
            <div class="large-12 columns">
                <nav class="top-bar fixed" data-topbar role="navigation" data-options="sticky_on: large">
                    <ul class="title-area">
                        <li class="name">
                            <h1><a href="#"></a></h1>
                        </li>
                        <!-- Remove the class "menu-icon" to get rid of menu icon. Take out "Menu" to just have icon alone -->
                        <li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a></li>
                    </ul>

                    <section class="top-bar-section">
                        <!-- Left Nav Section -->
                        <ul class="left">
                            <li><a href="userhome.jsp">Home</a></li>
                            <li><a href="addApp.jsp">Add Application</a></li>
                            <li><a href="searchFriend.jsp">Add Friends</a></li>
                            <li><a href="sendMessage.jsp">Messages</a></li>

                            <li><a href="./Logout">Logout</a></li>
                        </ul>
                    </section>

                    <section class="top-bar-section">
                        <ul class="right">
                            <li><a href="#">About Us</a></li>
                        </ul>
                    </section>
                </nav>
            </div>
        </div>
        <div class="row">
            <div class="large-10 large-centered small-4">
                <dl class="sub-nav center">
                    <dt>Friends:</dt>
                    <dd class="active"><a href="searchFriend.jsp"> Search Friends</a></dd>
                    <dd class="active"><a href="friendList.jsp">View Friends</a></dd>
                    <dd class="active"><a href="viewRequest.jsp">View Requests</a></dd>

                </dl>
            </div>
        </div>
        <div class="row">
            <div class="large-8 large-centered columns"style="margin-top: 50px">
                <form action="./SendRequest" method="post">

                    <p class="text-left" style="font-weight: bold;">Send Friend Request</p>
                    <hr style="border: 1px solid green;">

                    <table align="center" width="506"  style=" height:400px;width:400px ;padding-left: 10px;padding-top: 10px">

                        <%
                            String user = session.getAttribute("username").toString();

                            try {
                                String username = request.getParameter("username");
                                boolean isEmpty = true;
                                PreparedStatement ps = con.prepareStatement("select * from register where username=?");
                                ps.setString(1, username);
                                //  ps.setString(2, user);
                                ResultSet rs2 = ps.executeQuery();


                                while (rs2.next()) {
                                    isEmpty = false;
                                    String ss = null;
                                    ss = rs2.getString(2);
                                    System.out.println(ss);

                                    if (ss != null) {
                        %>
                        <tr><td align="center">&nbsp;&nbsp; <td algin="center"> <input type="hidden" name="rfrom" value="<%=user%>" /></td></tr>
                        <tr><td align="center"> User Name: &nbsp;&nbsp;</td><td algin="center"><input type="text" name="rto" value="<%=rs2.getString(2)%>"   placeholder="" readonly="true"/></td></tr>
                        <tr><td align="center">Email:&nbsp;&nbsp;</td><td algin="center"><input type="text" name="email" value="<%=rs2.getString("email")%>"   placeholder="" readonly="true"/></td></tr>
                        <tr><td align="center">Gender&nbsp;&nbsp;</td><td algin="center"><input type="text" name="gender" value="<%=rs2.getString("gender")%>"   placeholder="" readonly="true"/>   </td></tr>
                        <tr><td align="center">Country: &nbsp;&nbsp;</td><td algin="center"><input type="text" name="country" value="<%=rs2.getString("country")%>"   placeholder="" readonly="true"/></td></tr>
                        <tr><td align="center">Profile Pic: &nbsp;&nbsp;</td><td algin="center"><img height="20px"src="./Profile/<%=rs2.getString("file")%>"/></td></tr>
                        <tr><td align="center"></td><td algin="center"> <input type="hidden" name="status" value="Waiting" /></td></tr>
                        <center>  <tr><td align="center"> <input type="submit" value="Send Request"/></td><td algin="center"></td></tr></center> 

                        <%} else {%>
                        <center>  <tr><td align="center">  <p>Friends Not Found!!</p> </td></tr></center> 

                        <% }

                                }
                                if (isEmpty) {

                                    out.println("<script type=\"text/javascript\">");
                                    out.println("alert('We not found any friends insted of this username " + username+"');");
                                    out.println("location='searchFriend.jsp';");
                                    out.println("</script>");
                                }



                            } catch (Exception e) {
                                e.printStackTrace();

                                           out.println(e);
                                       }%>                                      





                    </table>
                </form>  



            </div>
        </div>

        <div class="row footer-section"style="margin-top: 130px">
            <ul class="footer-ul">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="adminLogin.jsp">admin Login</a></li>
                <li><a href="registration.jsp">Registration</a></li>
                <li><a href="#">Applications</a></li>
                <li><a href="UserLogin.jsp">User Login</a></li>

                <li><a href="#">Contact Us</a></li>
                <li><a href="#">Site Map</a></li>
            </ul>
            <p class="text-center" style="font-size: 12px;">
                Copyright ©2017 All Rights Reserved
            </p>
        </div>

    </div>
</body>
</html>
