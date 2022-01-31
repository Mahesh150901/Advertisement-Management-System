<%-- 
    Document   : Contact
    Created on : Jan 20, 2022, 2:19:11 PM
    Author     : MAHESH MANIKANTA
--%>

<%@page import="java.util.*,java.io.*,java.lang.*" %>
<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact</title>
    </head>
    <body>
        <%
            PrintWriter pw=response.getWriter();
            pw.println("Message has sent Sucessfully. They will contact you through mail");
            RequestDispatcher rd=request.getRequestDispatcher("Contact.html");
            rd.include(request,response);
        %>
    </body>
</html>