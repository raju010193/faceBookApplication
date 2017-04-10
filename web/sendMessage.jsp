<%-- 
    Document   : sendMessage
    Created on : Mar 13, 2017, 6:51:36 PM
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
            <div class="large-8 large-centered columns"style="margin-top: 50px">
                <form action="./SendMessage" method="post" enctype="multipart/form-data" >

                    <p class="text-left" style="font-weight: bold;">Send Message Here</p>
                    <hr style="border: 1px solid green;">


                    <%
                        String user = session.getAttribute("username").toString();
                    %>


                    <div class="row">
                        <div class="large-6 large-centered columns">
                            <label>User
                                <input type="text"name="msgfrom" value="<%=user%>" readonly="true"required="" />
                            </label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="large-6 large-centered columns">
                            <label>Friend
                                <select name="rto">
                                    <option id="status" name="status" selected="selected">Select</option>
                                    <%
                                        Statement st = null;
                                        boolean isEmpty = true;
                                        user = session.getAttribute("username").toString();
                                        String list = "Select * from frndlist where rto='" + user + "'";
                                        PreparedStatement pstmt = con.prepareStatement(list);

                                        ResultSet rs = pstmt.executeQuery();

                                        while (rs.next()) {
                                            isEmpty = false;
                                            String status = rs.getString(4);
                                            String key = rs.getString("rfrom");

                                    %>

                                    <% if (status.equals("Accept")) {


                                    %>  <option>

                                        <%=key%>

                                    </option> 

                                    <%



                                            }
                                        }
                                        if (isEmpty) {
                                            out.println("<script type=\"text/javascript\">");
                                            out.println("alert('You dont have any Friend to Send Messages');");
                                            out.println("location='searchFriend.jsp';");
                                            out.println("</script>");
                                        }
                                    %>

                                </select>
                            </label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="large-6 large-centered columns">
                            <label>Message*
                                <input type="text"name="msg"  placeholder="Enter Messages here"required="" />
                            </label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="large-6 large-centered columns">
                            <label>Select Image
                                <input type="file"name="file"required="" />
                            </label>
                        </div>
                    </div>
                    <div class="row">



                        <div class="small-6 columns small-centered">
                            <button type="submit" class="button radius expand" >SEND</button>

                        </div>
                    </div>

                </form>



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

    </div>
</body>
</html>
