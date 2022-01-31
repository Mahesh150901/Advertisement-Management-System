package Advertisement;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
@WebServlet("/uploadCusFiles")
@MultipartConfig(
    fileSizeThreshold   = 1024 * 1024 * 3,  // 3 MB
    maxFileSize         = 1024 * 1024 * 30, // 30 MB
    maxRequestSize      = 1024 * 1024 * 40, // 40 MB
    location            = "D:/UploadsCus")
public class ConsumerRegister extends HttpServlet 
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
                PreparedStatement pst=con.prepareStatement("insert into consumerlogin values(?,?,?,?,?,?,?,?,?,?,?)");
                pst.setString(1,Name);
                pst.setString(2,Email);
                pst.setString(3,Phone);
                pst.setString(4,Gender);
                pst.setString(5,DOB);
                pst.setString(6,City);
                pst.setString(7,State);
                pst.setString(8,Country);
                pst.setString(9,Username);
                pst.setString(10,Password);
                pst.setBlob(11,inputStream);
                int count=pst.executeUpdate();
                con.close();
                if(count>0)
                {
                    pw.println("<h3 style='color:crimson;font-size:30px;text-align:center'>Successfully Registered</h3>");
                    RequestDispatcher rd=request.getRequestDispatcher("ConsumerLog.html");
                    rd.include(request, response);
                }
                else
                {
                    pw.println("Failed");
                }
            }
            catch(Exception e)
            {
               pw.println(e.getMessage()); 
            }
    }
}
