<%-- 
    Document   : registration
    Created on : Mar 13, 2017, 12:16:11 PM
    Author     : Kiran
--%>
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
                            <li><a href="home.jsp">Home</a></li>
                            <li><a href="UserLogin.jsp">User Login</a></li>
                            <li><a href="registration.jsp">Registration</a></li>
                            <li><a href="#">Application</a></li>
                            <li><a href="adminLogin.jsp">Admin Login</a></li>
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
            <div class="large-10 medium-6 small-4 columns large-centered" style="margin-top: 50px;">
                <form id="loginForm" action="./Register" method="post"  enctype="multipart/form-data">
                    <p class="text-left" style="font-weight: bold;">Register as a New User</p>
                    <hr style="border: 1px solid red;">
                    <%
                        String status = (String) request.getAttribute("status");
                        if (status != null) {
                    %>
                    <%=status%>
                    <%}%>
                    <!-- future information login table starts here-->
                    <div class="row">
                        <div class="large-10 columns large-centered" style="">
                            <!--                    <p class="text-left" style="font-weight: bold;margin-top: 10px;text-decoration: underline">Future Information Login</p>-->


                            <div class="row">
                                <div class="small-5 columns">
                                    <label class="left inline">User Name*</label>
                                </div>
                                <div class="small-7 columns">
                                    <input type="text" name="username"placeholder="" required>
                                </div>
                            </div>

                            <div class="row">
                                <div class="small-5 columns">
                                    <label class="left inline">Password*</label>
                                </div>
                                <div class="small-7 columns">
                                    <input type="password" name="password"placeholder="" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="small-5 columns">
                                    <label class="left inline">Profile Picture*</label>
                                </div>
                                <div class="small-7 columns">
                                    <input type="file" name="file"placeholder="" required>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Donor Information table starts here-->
                    <div class="row">
                        <div class="large-10 columns large-centered">


                            <div class="row">
                                <div class="small-5 columns">
                                    <label class="left inline">Gender *</label>
                                </div>
                                <div class="small-7 columns">
                                    <input type="radio"  name="sex"value="Male" id="Male" checked required><label for="Male">Male</label>
                                    <input type="radio"  name="sex"value="Female" id="Female"required><label for="Female">Female</label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="small-5 columns">
                                    <label class="left inline">Mobile No*</label>
                                </div>
                                <div class="small-7 columns">
                                    <input type="number" name="phoneno"placeholder=""required>
                                </div>
                            </div>

                            <div class="row">
                                <div class="small-5 columns">
                                    <label class="left inline">Email Id*</label>
                                </div>
                                <div class="small-7 columns">
                                    <input type="email" name="email"placeholder="" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="small-5 columns">
                                    <label class="left inline">Country*</label>
                                </div>
                                <div class="small-7 columns">
                                    <input type="text" name="country"placeholder="" required>
                                </div>
                            </div>

                            <div class="button-bar">
                                <ul class="right button-group radius">
                                    <li><a href="#" class="small button alert">Reset</a></li>
                                    <li><input type="submit" class="small button success" value="Register >>"/></li>
                                </ul>

                            </div>
                        </div>



                        <!-- Register Buttons Section Here-->

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
    </body>
</html>
