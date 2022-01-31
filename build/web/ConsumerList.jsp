<%-- 
    Document   : Emp
    Created on : Jan 22, 2022, 12:28:44 PM
    Author     : MAHESH MANIKANTA
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@page import="java.util.*, java.io.*, java.sql.*,javax.servlet.*"%>
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
                    <a href="Admin.html" id="Home">Home</a>
                </td>
                <td>
                    <span id="dropdown1">
                        <button id="Emp">Manage</button>
                        <span id="Emp1">
                            <a href="RetailerList.jsp" id="Addemp">Retailer</a><br>
                            <a href="ConsumerList.jsp" id="emplo">Consumer</a>
                        </span>
                    </span>
                </td>
                <td>
                    <span id="dropdown2">
                        <button id="cus">Advertisement</button>
                        <span id="cus1">
                            <a href="AddAdver.jsp" id="Addadver">Add Advertisement</a>
                            <a href="Adver.jsp" id="adver">Advertisement Report</a>
                        </span>
                    </span>
                </td>
                <td>
                    <span id="dropdown2">
                        <button id="cus">FeedBack</button>
                        <span id="cus1">
                            <a href="AdminFeedback.html" id="Home">Feedback</a>
                            <a href="Feedbacklist.jsp" id="adver">Feedback Report</a>
                        </span>
                    </span>
                </td>
                <td>
                    <a href="Log.html" id="logout">Logout</a>
                </td>
            </tr>
        </table>
        <%
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/advertise","root","");
                PreparedStatement pst=con.prepareStatement("Select * from consumerlogin");
                ResultSet rs=pst.executeQuery();
                out.println("<h3 style='font-family:TimesNewRoman;font-size:30px;color:crimson'>Consumer Report</h3>");
                out.println("<table width='100%' style='color:coral;font-family:TimesNewRoman;font-size:20px;border:1px solid black;border-collapse:collapse'>"
                        + "<tr><th style='border:1px solid black;border:collapse:collapse'>Sl.No</th>"
                        + "<th style='border:1px solid black;border:collapse:collapse'>Image</th>"
                        + "<th style='border:1px solid black;border:collapse:collapse'>Name</th>"
                        + "<th style='border:1px solid black;border:collapse:collapse'>Email</th>"
                        + "<th style='border:1px solid black;border:collapse:collapse'>Phone Number</th>"
                        + "<th style='border:1px solid black;border:collapse:collapse'>Gender</th>"
                        + "<th style='border:1px solid black;border:collapse:collapse'>Date of Birth</th>"
                        + "<th style='border:1px solid black;border:collapse:collapse'>City</th>"
                        + "<th style='border:1px solid black;border:collapse:collapse'>State</th>"
                        + "<th style='border:1px solid black;border:collapse:collapse'>Country</th>"
                        + "<th style='border:1px solid black;border:collapse:collapse'>Action</th></tr>");
                int i=1;
                while(rs.next())
                {
                    String Name=rs.getString("Name");
                    out.println("<tr><td style='border:1px solid black;border:collapse:collapse'>"+i+"</td>"
                            + "<td style='border:1px solid black;border:collapse:collapse';width:170px;height:150px'>"
                            + "<img src='http://localhost:8080/Advertisement/DisplayCusImage?Name="+Name+"' alt='"+Name+"' style='width:150px;height:120px'>");
                    out.println("</td><td style='border:1px solid black;border:collapse:collapse'>"+rs.getString("Name")+"</td>"
                            + "<td style='border:1px solid black;border:collapse:collapse'>"+rs.getString("Email")+"</td>"
                            + "<td style='border:1px solid black;border:collapse:collapse'>"+rs.getString("Phone")+"</td>"
                            + "<td style='border:1px solid black;border:collapse:collapse'>"+rs.getString("Gender")+"</td>"
                            + "<td style='border:1px solid black;border:collapse:collapse'>"+rs.getString("DOB")+"</td>"
                            + "<td style='border:1px solid black;border:collapse:collapse'>"+rs.getString("City")+"</td>"
                            + "<td style='border:1px solid black;border:collapse:collapse'>"+rs.getString("State")+"</td>"
                            + "<td style='border:1px solid black;border:collapse:collapse'>"+rs.getString("Country")+"</td>"
                            + "<td style='border:1px solid black;border:collapse:collapse'>"
                            + "<span style='padding-left:10px'>"
                            + "<a href='EditConsumer.html'>Edit</a></span>"
                            + "<span style='padding-left:10px'>"
                            + "<a href='DelConsumer.html'>Delete</a>"
                            + "</span></td></tr>");
                    i++;
                }
                out.println("</table>");
            }
            catch(Exception e)
            {
                out.println(e.getMessage());
            }
        %>
    </body>
</html>
