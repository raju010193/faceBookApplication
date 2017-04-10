<%-- 
    Document   : appDetails
    Created on : Mar 13, 2017, 1:49:48 PM
    Author     : Kiran
--%>


<%@include file="dbconnection.jsp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
                            <li><a href="index.jsp">Logout</a></li>
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
                <p class="text-center" style="font-weight: bold;margin-top: 50px;font-size: 25px;color: brown">Application Details</p>
                <hr style="border: 1px solid green;">
                <!--                     <p class="text-center" style="font-weight: bold;font-size: 13px">The list of applications and games in our website.</p>-->
                <%
                    Statement st = null;
                    String appid = request.getParameter("appid");
                    String Query = "Select * from app where appid='" + appid + "' ";

                    st = con.createStatement();
                    ResultSet rs = st.executeQuery(Query);
                    while (rs.next()) {

                        String appname = rs.getString(3);
                        appid = rs.getString(2);
                        String appicon = rs.getString(7);

                %>

                <table class="center">
                    <tbody>
                    <form action="./Verify" method="post">

                        <input type="hidden" name="aid" value="<%=rs.getString("aid")%>" readonly="true"/>

                        <tr>    <td align="center"style="width:400px" ><b>App ID</b></td>               <td align="center"style="width:470px"><%=rs.getString("appid")%> </td>
                        <tr> <td align="center"><b>Username</b></td>    <td align="center"><%=rs.getString("username")%> </td> </tr>   
                        <tr>  <td align="center"><b>App Name</b></td>    <td align="center"><%=rs.getString("appname")%></td> </tr>   
                        <input type="hidden" value="ApLi<%= (int) (Math.random() * 10000)%>no" name="licenseno" />

                        <tr><td align="center"><b>App URL</b></td>    <td align="center"><input type="text" name="appurl" value="<%=rs.getString("appurl")%>" readonly="true"/> </td> </tr>   
                        <tr> <td align="center"><b>App Icon</b></td>  <td align="center"><img src="./apps/<%=rs.getString("appicon")%>"   width="300" height="200"/></td> </tr>   
                        <input type="hidden" name="status" value="<%=rs.getString("status")%>" readonly="true"/>
                        <tr> <td align="center"></td>   <td align="center">  <input type="submit" value="FRAppE Verification"/></td>
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

    </div>
</body>
</html>