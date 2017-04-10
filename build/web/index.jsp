<%-- 
    Document   : index
    Created on : Mar 13, 2017, 12:05:23 PM
    Author     : kiran
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="css/foundation.css" rel="stylesheet" type="text/css">
        <link href="css/foundation.min.css" rel="stylesheet" type="text/css">
        <link href="css/main.css" rel="stylesheet" type="text/css">
        <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>

        <script src="js/vendor/jquery.js" type="text/javascript"></script>
        <script src="js/foundation/foundation.js" type="text/javascript"></script>
        <meta charset="UTF-8">
        <title>FaceBookApps.com</title>
        <style>
            body, a{
                font-family: 'Open Sans', sans-serif;
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
                            <li><a href="#.jsp">Applications </a></li>
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
            <div class="large-12 medium-6 small-4 columns" style="margin-top:20px;">
                <p class="text-center" style="font-size:20px;color: red;font-weight: bold">Welcome to Hybrid Approach for Detecting Malicious Facebook Applications Using Frappe</p>
                <p class="text-justify" style="font-size:14px;">Hackers have completed the potential of exploitation apps for spreading spam and malware. The matter is already important, as we discover that a minimum of 20% of apps in our dataset square measure malicious. So far, the analysis community has centered on police investigation malicious posts and campaigns.</p>
                <ul class="small-block-grid-3">
                    <li><img src="img/logo.png"></li>
                </ul>
                <p class="text-justify" style="font-size:14px;">
                    Given a Facebook application, will we tend to verify if it's malicious? To develop FRAppE, we tend to use info gathered by perceptive the posting behavior of 222K Facebook apps seen across a pair of.1.65 billion monthly active users on Facebook.</p>
                <div class="row">
                    <div class="large-6 columns">
                        <img src="img/friends.jpg" class="left-align">
                    </div>
                    <div class="large-6 columns">
                        <p class="text-left" style="font-size: 14px;">As an instance, we discover that malicious apps usually share names with different apps, and that they usually request fewer permissions than benign apps, second we provide the messaging, find friends, each and every user interact with one other using our application, play facebook games in our application using facebook api. This application is used to find out the malicious apps from the all facebook apps.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row footer-section">
            <ul class="footer-ul">
                <li><a href="">Home</a></li>
                <li><a href="">User Login</a></li>
                <li><a href="">Registration</a></li>
                <li><a href="">Applications</a></li>
                <li><a href="">Admin Login</a></li>
                <li><a href="">Refer Your Friends</a></li>
                <li><a href="">More Apps</a></li>
                <li><a href="">Contact Us</a></li>
                <li><a href="">Site Map</a></li>
            </ul>
            <p class="text-center" style="font-size: 12px;">
                Copyright © 2017 All Rights Reserved
            </p>
        </div>
    </body>
</html>

