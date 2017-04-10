<%-- 
    Document   : userhome
    Created on : Mar 13, 2017, 12:33:54 PM
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
            <div class="large-10 large-centered columns">
                <p class="text-center" style="font-weight: bold;margin-top: 50px;font-size: 25px;color: brown">User Details</p>
                <hr style="border: 1px solid green;">
                <!--                     <p class="text-center" style="font-weight: bold;font-size: 13px">The list of applications and games in our website.</p>-->

                <%
                    Statement st = null;

                    String username = session.getAttribute("username").toString();
                    String register = "Select * from register where username='" + username + "' ";

                    st = con.createStatement();
                    ResultSet rs = st.executeQuery(register);
                    while (rs.next()) {
                %>

                <table class="center">
                    <tbody>
                    <form action="./UpdateProfile" method="post">

                        <td align="center"width="300"></td> <td align="center"width="500"> <input type="hidden" name="uid" value="<%=rs.getString(1)%>" /></td></tr><br>
                        <tr><td align="center" >Username</td> <td align="center"> <input type="text" name="username" value="<%=rs.getString(2)%>" readonly="true"/></td></tr>
                        <tr><td align="center">Password</td> <td align="center"> <input type="password" name="password"  value="<%=rs.getString(3)%>"/> </td></tr>
                        <tr><td align="center">Email</td>   <td align="center">   <input type="text" name="email" value="<%=rs.getString(4)%>"/> </td></tr>
                        <tr><td align="center">Gender</td>     <td align="center">  <input type="text" name="sex" value="<%=rs.getString(5)%>"/> </td></tr>
                        <tr><td align="center">Country</td> <td align="center">  <input type="text" name="country" value="<%=rs.getString(6)%>"/> </td></tr>
                        <tr><td align="center">Phone no</td> <td align="center">   <input type="text" name="phoneno" value=" <%=rs.getString(7)%>"/></td></tr>

                        <tr><td align="center">Profile Pic</td><td align="center">  <img src="Profile/<%=rs.getString("file")%>" width="100" height="100"/></td></tr>
                        <tr><td align="center">Update Profile</td> <td align="center">   <input type="submit" value="Update"/></td>
                        </tr>  

                    </form>
                    </tbody>
                </table>
                <%}%>
            </div>
        </div>


        <div class="row footer-section">
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
        <p class="text-center" style="font-size: 12px;">
            Copyright ©2017  All Rights Reserved
        </p>
    </div>
</body>
</html>
