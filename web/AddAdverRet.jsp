<%-- 
    Document   : Advertise
    Created on : Jan 25, 2022, 1:56:30 PM
    Author     : MAHESH MANIKANTA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*,java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Advertise</title>
        <link rel="stylesheet" type="text/css" href="CSS/Admin.css">
    </head>
    <body>
        <table id="Heading">
                <tr>
                    <td>Online Advertisement</td>
                </tr>
            </table>
            <table id="Gap"></table>
            <table id="navigation">
                <tr>
                    <td>
                        <a href="RetailerHome.html" id="Home">Home</a>
                    </td>
                    <td>
                        <span id="dropdown2">
                            <button id="cus">Advertisement</button>
                            <span id="cus1">
                                <a href="AddAdverRet.jsp" id="Addadver">Add Advertisement</a>
                                <a href="AdverRet.jsp" id="adver">Advertisement Report</a>
                            </span>
                        </span>
                    </td>
                    <td>
                        <span id="dropdown2">
                            <button id="cus">Feedback</button>
                            <span id="cus1">
                                <a href="RetailerFeedback.html" id="adver">Add Feedback</a>
                                <a href="FeedbacklistRet.jsp" id="adver">Feedback Report</a>
                            </span>
                        </span>
                    </td>
                    <td>
                        <a href="RetailerLog.html" id="logout">Logout</a>
                    </td>
                </tr>
            </table>
        <table id="Conte">
            <tr>
                <td id="Conte_da1">
                    <table id="Empform">
                        <tr>
                            <td id="EmpFormlist">
                                <h3>Add Advertisement</h3>
                                <%Class.forName("com.mysql.jdbc.Driver");
                                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/advertise","root","");
                                                    PreparedStatement pst=con.prepareStatement("Select Name from retailerlogin");
                                                    ResultSet rs=pst.executeQuery();
                                %>
                                <form action="AddAdverRet" method="post" enctype="Multipart/form-data">
                                    Customer  <select name="Name" id="sel">
                                            <%while(rs.next()) {%>
                                            <option id="Op"><%out.println(rs.getString("Name"));}%></option>
                                    </select><br><br>
                                    Place <input type="text" name="Place" id="Place" required><br><br>
                                    From Date <input type="date" name="From" id="From" required><br><br>
                                    To Date <input type="date" name="To" id="To"><br><br>
                                    Cost <input type="text" name="Cost" id="Cost" required><br><br>
                                    Description <input type="text" name="Desc" id="Desc"><br><br>
                                    Image <input type="file" name="Image" id="Image" accept="image/gif, image/jpeg, image/png"><br><br>
                                    <input type="submit" name="Sub" value="Add" id="Sub">
                                </form>
                            </td>
                        </tr>
                    </table>
                </td>
                <td id="Conte_da2"><img src="Images/advertise.jpg" alt="Image" id="Admimg"></td>
            </tr>
        </table>
    </body>
</html>
