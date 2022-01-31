package Advertisement;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
@WebServlet("/EditCusFiles")
@MultipartConfig(
    fileSizeThreshold   = 1024 * 1024 * 1,  // 1 MB
    maxFileSize         = 1024 * 1024 * 10, // 10 MB
    maxRequestSize      = 1024 * 1024 * 15, // 15 MB
    location            = "D:/UploadCus")
public class EditConsumer extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
            response.setContentType("text/html");
            PrintWriter pw=response.getWriter();
            String Name=request.getParameter("Name");
            String Email=request.getParameter("Email");
            String Phone=request.getParameter("Phone");
            String Gender=request.getParameter("Gender");
            String DOB=request.getParameter("DOB");
            String City=request.getParameter("City");
            String State=request.getParameter("State");
            String Country=request.getParameter("Country");
            String Username=request.getParameter("Username");
            String Password=request.getParameter("Password");
            Part Image=request.getPart("Image");
            InputStream inputStream=Image.getInputStream();
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/advertise","root","");
                PreparedStatement pst=con.prepareStatement("update consumerlogin set Email=?,Phone=?,DOB=?,City=?,State=?,Country=?,Username=?,Password=?,Image=? where Name=?&&Gender=?");
                pst.setString(10,Name);
                pst.setString(11,Gender);
                pst.setString(1,Email);
                pst.setString(2,Phone);
                pst.setString(3,DOB);
                pst.setString(4,City);
                pst.setString(5,State);
                pst.setString(6,Country);
                pst.setString(7,Username);
                pst.setString(8,Password);
                pst.setBlob(9,inputStream);
                int count=pst.executeUpdate();
                con.close();
                if(count>0)
                {
                    pw.println("<h3 style='color:crimson;font-size:30px'>Successfully Changed</h3>");
                    RequestDispatcher rd=request.getRequestDispatcher("ConsumerList.jsp");
                    rd.include(request, response);
                }
                else
                {
                    pw.println("Incorrect Customer Details");
                }
            }
            catch(Exception e)
            {
               pw.println(e.getMessage()); 
            }
    }
}
