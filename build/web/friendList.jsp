<%-- 
    Document   : friendList
    Created on : Mar 13, 2017, 4:07:44 PM
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


                <p class="text-left" style="font-weight: bold;">Friends List Here</p>
                <hr style="border: 1px solid green;">

                <form id="loginForm">    

                    <table align="center" width="200"  style="border: 0px solid #000; height:340px;width: 250px ;padding-top: 10px">
                        <tr>
                            <th width="200px">User Name</th><th width="200px">Profile Picture</th>
                        </tr>

                        <%
                            Statement st = null;
                            String user = session.getAttribute("username").toString();
                            String Query2 = "Select * from frndlist where rto='" + user + "'";
                            PreparedStatement ps2 = con.prepareStatement(Query2);
                            ResultSet rs = ps2.executeQuery();
                            boolean isEmpty=true;

                            while (rs.next()) {
                                isEmpty=false;
                                String status = rs.getString(4);

                                String key = rs.getString("rfrom");
                                PreparedStatement pstmt=con.prepareStatement("select* from register where username=?");
                                pstmt.setString(1, key);
                                
                                ResultSet result=pstmt.executeQuery();
                                String file="";
                                while(result.next()){
                                    file=result.getString("file");
                                }

                                if (status.equals("Accept")) {

                        %>
                        <tr>


                            <td align="center">  <%=key%> </td> 
                              <td align="center"><img height="20px"src="./Profile/<%=file%>"/> </td> 






                        </tr>
                        <%
                                }
                            }
                             if(isEmpty){
                                    
                                     out.println("<script type=\"text/javascript\">");
            out.println("alert('You dont have any Friends At');");
            out.println("location='searchFriend.jsp';");
            out.println("</script>");

                                                                       }
                        %>  
                        %>
                    </table>

                </form>

            </div>
        </div>

        <div class="row footer-section"style="margin-top: 230px">
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
