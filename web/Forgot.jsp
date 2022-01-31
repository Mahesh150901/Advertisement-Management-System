<%-- 
    Document   : Forgot
    Created on : Jan 25, 2022, 4:15:40 PM
    Author     : MAHESH MANIKANTA
--%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page import="java.sql.*,javax.mail.*,javax.mail.internet.*,java.util.*,java.io.*,java.lang.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Advertise</title>
    </head>
    <body>
        <%
            String Name=request.getParameter("Username");
            String Email=request.getParameter("Email");
            PrintWriter pw=response.getWriter();
            try
            {
             Class.forName("com.mysql.jdbc.Driver");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/advertise","root","");
             PreparedStatement pst=con.prepareStatement("Select Name,Password from login where Username=?");
             pst.setString(1,Name);
             ResultSet rs=pst.executeQuery();
             rs.next();
             String message="Dear "+rs.getString("Name")+",\nYour Password is "+rs.getString("Password");
             final String User="abczyx1509@gmail.com";
             final String password="abcxyz1509*";
             Properties pro=new Properties();
             pro.put("mail.smtp.host","smtp.gmail.com");
             pro.put("mail.smtp.socketFactory.port", "465");
             pro.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
             pro.put("mail.smtp.auth","true");
             pro.put("mail.user",User);
             pro.put("mail.password",password);
             pro.put("mail.port","465");
             pro.put("mail.smtp.starttls.enable","true");
             Session ses=Session.getInstance(pro, new javax.mail.Authenticator()
             {
                protected PasswordAuthentication getPasswordAuthentication()
                {
                    return new PasswordAuthentication(User,password);
                }
             });
             try
             {
                 MimeMessage mim=new MimeMessage(ses);
                 mim.setFrom(new InternetAddress(User));
                 mim.addRecipient(Message.RecipientType.TO,new InternetAddress(Email));
                 mim.setSubject("Queries by "+Name);
                 mim.setText(message);
                 Transport.send(mim);
                 out.println("<h3 style='color:crimson;text-align:center;font-size:30px'>Username and Password has sent to your mail</h3>");
                 RequestDispatcher rd=request.getRequestDispatcher("Forgot.html");
                 rd.include(request,response);
             }
             catch(Exception e)
             {
                pw.println(e.getMessage());
             }
            }
            catch(Exception e)
            {
                pw.println(e.getMessage());
            } 
        %>
    </body>
</html>
