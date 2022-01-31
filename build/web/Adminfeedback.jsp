<%-- 
    Document   : Adminfeedback
    Created on : Jan 28, 2022, 10:24:01 AM
    Author     : MAHESH MANIKANTA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.io.*, java.sql.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Advertise</title>
        <link rel="stylesheet" type="text/css" href="CSS/Admin.css">
    </head>
    <body>
        <%
            String To=request.getParameter("To");
            String Message=request.getParameter("Message");
            PrintWriter pw=response.getWriter();
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/advertise","root","");
                PreparedStatement pst=con.prepareStatement("insert into feedback values(?,?)");
                pst.setString(1,To);
                pst.setString(2,Message);
                int i=pst.executeUpdate();
                if(i>0)
                {
                    pw.println("<h3 style='color:crimson;font-size:30px'>Feedback Sent</h3>");
                    RequestDispatcher rd=request.getRequestDispatcher("Feedbacklist.jsp");
                    rd.include(request, response);
                }
                else
                {
                   pw.println("<h3 style='color:crimson;font-size:30px'>Failed to sent Feedback</h3>");
                   RequestDispatcher rd=request.getRequestDispatcher("AdminFeedback.html");
                   rd.include(request, response); 
                }
            }
            catch(Exception e)
            {
                pw.println(e.getMessage());
            }
        %>
    </body>
</html>
