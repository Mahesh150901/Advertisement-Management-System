package Advertisement;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
@WebServlet("/uploadAdverFiles")
@MultipartConfig(
    fileSizeThreshold   = 1024 * 1024 * 1,  // 1 MB
    maxFileSize         = 1024 * 1024 * 10, // 10 MB
    maxRequestSize      = 1024 * 1024 * 15, // 15 MB
    location            = "D:/UploadsAdver")
public class AddAdver extends HttpServlet 
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
            response.setContentType("text/html");
            PrintWriter pw=response.getWriter();
            String Name=request.getParameter("Name");
            String Place=request.getParameter("Place");
            String From=request.getParameter("From");
            String To=request.getParameter("To");
            String Cost=request.getParameter("Cost");
            String Desc=request.getParameter("Desc");
            Part Image=request.getPart("Image");
            InputStream inputStream=Image.getInputStream();
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/advertise","root","");
                PreparedStatement pst=con.prepareStatement("insert into advertisement values(?,?,?,?,?,?,?)");
                pst.setString(1,Name);
                pst.setString(2,Place);
                pst.setString(3,From);
                pst.setString(4,To);
                pst.setString(5,Cost);
                pst.setString(6,Desc);
                pst.setBlob(7,inputStream);
                int count=pst.executeUpdate();
                con.close();
                if(count>0)
                {
                    pw.println("<h3 style='color:crimson;font-size:30px'>Successfully Added</h3>");
                    RequestDispatcher rd=request.getRequestDispatcher("Adver.jsp");
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
