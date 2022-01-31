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
                PreparedStatement pst=con.prepareStatement("Select * from feedback");
                ResultSet rs=pst.executeQuery();
                out.println("<h3 style='font-family:TimesNewRoman;font-size:30px;color:crimson'>FeedBack Report</h3>");
                out.println("<table width='100%' style='color:coral;font-family:TimesNewRoman;font-size:30px;border:1px solid black;border-collapse:collapse'>"
                        + "<tr><th style='border:1px solid black;border:collapse:collapse'>Sl.No</th>"
                        + "<th style='border:1px solid black;border:collapse:collapse'>From</th>"
                        + "<th style='border:1px solid black;border:collapse:collapse'>Message</th>"
                        + "<th style='border:1px solid black;border:collapse:collapse'>Action</th></tr>");
                int i=1;
                while(rs.next())
                {
                    out.println("<tr><td style='border:1px solid black;border:collapse:collapse'>"+i+"</td>");
                    out.println("</td><td style='border:1px solid black;border:collapse:collapse'>"+rs.getString("ToName")+"</td>"
                            + "<td style='border:1px solid black;border:collapse:collapse'>"+rs.getString("Message")+"</td>"
                            + "<td style='border:1px solid black;border:collapse:collapse'>"
                            + "<a href='AdminFeedback.html' style='color:Green;'>Reply</a>"
                            +"</td></tr>");
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
