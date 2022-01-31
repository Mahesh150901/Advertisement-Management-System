<%-- 
    Document   : DelEmp
    Created on : Jan 24, 2022, 5:48:56 PM
    Author     : MAHESH MANIKANTA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"language="java"%>
<%@page import="java.util.*,java.io.*,java.sql.*"%>
<html>
    <head>
        <title>Advertise</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="CSS/Admin.css">
    </head>
    <body>
        <%
            String Name=request.getParameter("Name");
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/advertise","root","");
                PreparedStatement pst=con.prepareStatement("Delete from consumerlogin where Name=?");
                pst.setString(1,Name);
                int i=pst.executeUpdate();
                if(i>0)
                {
                    out.println("<h3 style='color:crimson;font-size:30px'>Successfully Deleted</h3>");
                    RequestDispatcher rd=request.getRequestDispatcher("ConsumerList.jsp");
                    rd.include(request, response);
                }
                else
                {
                    out.println("<h3 style='color:crimson;font-size:30px'>Failed to Delete the record</h3>");
                    RequestDispatcher rd=request.getRequestDispatcher("ConsumerList.jsp");
                    rd.include(request, response);
                }
            }
            catch(Exception e)
            {
               out.println(e.getMessage()); 
            }
        %>
    </body>
</html>
