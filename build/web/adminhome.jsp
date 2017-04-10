<%-- 
    Document   : adminhome
    Created on : Mar 13, 2017, 12:34:15 PM
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
                    <li><a href="adminhome.jsp">Home</a></li>
                    <li><a href="adminhome.jsp">Malicious</a></li>
                    <li><a href="frappe.jsp">FrApPE Verification</a></li>
                    <li><a href="users.jsp">View Users</a></li>
                    <li><a href="apps.jsp">View Applications</a></li>
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
    <div class="large-6 medium-4 small-4 columns large-centered" style="margin-top: 50px;">
    <%
    	String status=(String)request.getAttribute("status");
    	if(status!=null){
    	%>
    	<%=status %>
    	<%} %>
          <form id="loginForm" action="./Malicious" method="post">
            <p class="text-left" style="margin-top: 20px;font-weight: bold;">Add Malicious Website</p>
            <hr class="large-10 columns">
            <div class="row">
                <div class="large-10 columns">
                    <label>URL*
                        <input type="text"name="malicious" placeholder="Enter url"required="" />
                    </label>
                </div>
            </div>
        
               <div class="button-field">

                            <div class="row">
                              

                                <div class="large-10 columns">

                                    <button type="submit" class="button radius expand" >ADD</button>

                                </div>
                            </div>
                        </div>

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
