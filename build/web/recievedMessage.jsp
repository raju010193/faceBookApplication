<%-- 
    Document   : recievedMessage
    Created on : Mar 13, 2017, 7:27:22 PM
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
                    <dt>Messages:</dt>
                    <dd class="active"><a href="sendMessage.jsp"> Send Message</a></dd>
                    <dd class="active"><a href="recievedMessage.jsp">Received Messages</a></dd>


                </dl>
            </div>
        </div>
        <div class="row">
            <div class="large-12 medium-6 small-4 columns large-centered" style="margin-top: 50px;">


                <p class="text-center" style="margin-top: 20px;color: brown;font-weight: bold;font-size: 25px">Received Messages</p>
                <hr class="large-12 columns ">
                <table>
                    <tbody>
                        <tr  ><th width="350">Message From</th><th width="350">Message</th><th width="250">Picture</th></tr>
                        <%
                            String user = session.getAttribute("username").toString();
                            Statement st = null;
                            String messages = "Select * from message where msgto='" + user + "'";

                            st = con.createStatement();
                            ResultSet rs = st.executeQuery(messages);
                            while (rs.next()) {
                                String key = rs.getString("file");
                        %>
                        <tr>


                            <td align="center">  <%=rs.getString("msgfrom")%> </td> 

                            <td align="center">  <%=rs.getString(4)%> </td> 
                            <td align="center">  <img src="./messages/<%=rs.getString("file")%>" height="100px" width="100px"  /></td> 



                        </tr>
                        <%
                            }

                        %>
                    </tbody>
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
