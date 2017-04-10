<%-- 
    Document   : viewRequest
    Created on : Mar 13, 2017, 4:08:01 PM
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
            <div class="large-10 large-centered columns">
                <p class="text-center" style="font-weight: bold;margin-top: 50px;font-size: 25px;color: brown">Friend Requests</p>
                <hr style="border: 1px solid green;">

                <%
                    try {
                        String user = session.getAttribute("username").toString();
                        if (request.getParameter("yes").equals("ok")) {%>
                <p class="text-center" style="font-weight: bold;margin-top: 50px;font-size: 25px;color: brown">Accept/Reject Requests</p>

                <form action="./FriendAccept" method="post" >

                    <%

                        String rfrom = request.getParameter("rfrom");
                        String friendList = "Select * from frndlist where rfrom='" + rfrom + "' and rto='" + user + "' ";
                        PreparedStatement pstmt = con.prepareStatement(friendList);

                        ResultSet rs2 = pstmt.executeQuery();
                        while (rs2.next()) {
                    %>
                    <div class="row">
                        <div class="large-6 large-centered columns">
                            <label>User
                                <input type="text"name="rfrom"value="<%=rs2.getString("rfrom")%>" readonly="true"required="" />
                            </label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="large-6 large-centered columns">
                            <label>Status
                                <select name="status">
                                    <option id="status" name="status" selected="selected">Select</option>
                                    <option id="status" name="status" >Accept</option>
                                    <option id="status" name="status" >Reject</option>
                                </select>
                            </label>
                        </div>
                    </div>

                    <div class="row">



                        <div class="small-6 columns small-centered">
                            <button type="submit" class="button radius expand" >SUBMIT</button>

                        </div>
                    </div>
                </form>
                <%
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>




                <p class="text-center" style="font-weight: bold;font-size: 13px">Requested Users</p>
                <table>
                    <tbody><tr><th width="370">S.No</th><th width="370">User Name</th><th>Picture</th><th width="370" style="text-align: center">Status</th></tr> 
                        <%   String user = session.getAttribute("username").toString();
                            Statement st = null;
                            String list = "Select * from frndlist where rto='" + user + "'";

                            st = con.createStatement();
                            ResultSet rs = st.executeQuery(list);
                            int count=0;
                            boolean isEmpy=true;
                            while (rs.next()) {
                                isEmpy=false;
                                String file="";
                                String key = rs.getString("rfrom");
                               // out.print("alert(key);");
                                
                             
                                
                                PreparedStatement pstmt=con.prepareStatement("select* from register where username=?");
                                pstmt.setString(1, key);
                                ResultSet resultSet=pstmt.executeQuery();
                                while(resultSet.next()){
                                    file=resultSet.getString("file");
                                }
                                
                        %>
                       

                        <tr>
                            
                            <td align="center">  <%=++count%> </td> 
                            <td align="center">  <%=rs.getString("rfrom")%> </td> 
                             <td align="center"><img src="./Profile/<%=file%>" /></td>  
                            <td align="center"><a href="viewRequest.jsp?yes=ok&rfrom=<%=key%>" ><%=rs.getString("status")%></a></td>  
                           

                        </tr>
                        <%
                            }
                               if(isEmpy){
                                    
                                     out.println("<script type=\"text/javascript\">");
            out.println("alert('You dont have any Friend Requests At');");
            out.println("location='searchFriend.jsp';");
            out.println("</script>");

                                                                       }
                        %>  
                    </tbody>
                </table>

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
