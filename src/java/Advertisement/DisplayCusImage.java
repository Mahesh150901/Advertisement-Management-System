package Advertisement;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class DisplayCusImage extends HttpServlet 
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
       response.setContentType("image/jpeg");
       //PrintWriter pw=response.getWriter();
       String name=request.getParameter("Name");
       try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/advertise","root","");
                PreparedStatement pst=con.prepareStatement("Select Image from consumerlogin where Name=?");
                pst.setString(1,name);
                ResultSet rs=pst.executeQuery();
                rs.next();
                Blob blob=rs.getBlob("Image");
                byte image[]=blob.getBytes(1, (int)blob.length());
                OutputStream os=response.getOutputStream();
                os.write(image);
                os.flush();
                os.close();
            }
            catch(Exception e)
            {
                throw new RuntimeException(e.getMessage());
            }
    }
}
