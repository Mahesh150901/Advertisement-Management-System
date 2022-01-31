<%-- 
    Document   : Login
    Created on : Jan 21, 2022, 9:35:46 AM
    Author     : MAHESH MANIKANTA
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*,java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <% 
        response.setContentType("text/html");
        PrintWriter pw=response.getWriter();
        String Username=request.getParameter("Username");
        String Password=request.getParameter("Password");
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/advertise","root","");
            PreparedStatement pst=con.prepareStatement("Select * from consumerlogin where Username=?");
            pst.setString(1,Username);
            ResultSet rs=pst.executeQuery();
            rs.next();
            String name=rs.getString("Name");
            String pass=rs.getString("Password");
            if(Password.equals(pass))
            {
             pw.println("<h5 style='color:crimson;text-align:center;font-size:30px'>Login Successful</h5>");
             RequestDispatcher rd=request.getRequestDispatcher("ConsumerHome.html");
             rd.include(request,response);   
            }
            else
            {
             pw.println("<h5 style='color:crimson;text-align:center;font-size:30px'>Invalid Credentials</h5>");
             RequestDispatcher rd=request.getRequestDispatcher("ConsumerLog.html");
             rd.include(request,response);
             
            }
        }
        catch(Exception e)
        {
            out.println(e.getMessage());
        }
        %>
    </body>
</html>
