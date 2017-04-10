<%-- 
    Document   : myApps
    Created on : Mar 13, 2017, 3:02:00 PM
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
                    <dt>Add Apps:</dt>
                    <dd class="active"><a href="addApp.jsp">Develop Application</a></dd>
                    <dd class="active"><a href="viewApp.jsp">View Applications</a></dd>
                    <dd class="active"><a href="myApp.jsp">View My Developed Apps</a></dd>
                    <dd class="hide-for-small-only active"><a href="profileApps.jsp">View Profile Apps</a></dd>
                </dl>
            </div>
        </div>
        <div class="row">
            <div class="large-10 large-centered columns">
                <p class="text-center" style="font-weight: bold;margin-top: 50px;font-size: 25px;color: brown">My Developed Applications</p>
                <hr style="border: 1px solid green;">
                <p class="text-center" style="font-weight: bold;font-size: 13px">My developed applications and games in our website.</p>



                <%
                    Statement st = null;

                    String username = session.getAttribute("username").toString();
                    String appss = "Select * from app where username='" + username + "' ";

                    st = con.createStatement();
                    ResultSet rs = st.executeQuery(appss);
                    while (rs.next()) {

                        String appname = rs.getString(3);
                        String appid = rs.getString(2);
                        String appicon = rs.getString(7);

                %>

                <table>
                    <tbody>
                        <tr  ><td width="250">  <a href="./apps/<%=appicon%>" class="b-link-stripe b-animate-go  swipebox" width="100" height="100"  title="Image Title"></a><img src="apps/<%=appicon%>" alt="" width="100" height="100" class="img-responsive"></td><td width="250"><%=appname%></td><td width="250"><img src="apps/<%=appicon%>" alt="" width="100" height="100" class="img-responsive"></td></tr>

                    </tbody>
                </table>
                <%
                    }
                %>  
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
