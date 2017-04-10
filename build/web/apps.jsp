<%-- 
    Document   : apps
    Created on : Mar 13, 2017, 12:48:48 PM
    Author     : kiran
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
            <div class="large-12 medium-6 small-4 columns large-centered" style="margin-top: 50px;">


                <p class="text-center" style="margin-top: 20px;color: brown;font-weight: bold;font-size: 25px">View All Apps</p>
                <hr class="large-12 columns ">
                <table>
                    <tbody>
                        <tr  ><th width="250">App No</th><th width="250">User Name</th><th width="150">App Id</th><th width="250">App Name</th><th width="150">Access Token</th><th width="150">App URL</th><th width="150">Status</th><th width="250">App Icon</th></tr>
                        <%                Statement st = null;

                            String all = "Select * from app ";

                            st = con.createStatement();
                            ResultSet rs = st.executeQuery(all);
                            while (rs.next()) {
                        %>
                        <tr>
                            <td><%=rs.getString("aid")%> </td>
                            <td><%=rs.getString("username")%> </td>
                            <td><%=rs.getString("appid")%></td>
                            <td><%=rs.getString("appname")%></td>
                            <td><%=rs.getString("licenseno")%> </td>
                            <td><%=rs.getString("appurl")%> </td>
                            <td><b><%=rs.getString("status")%></b> </td>
                            <td> <img src="./apps/<%=rs.getString("appicon")%>" width="200" height="100"/></td>



                        </tr>
                        <%
                            }

                        %>
                    </tbody>
                </table>
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
