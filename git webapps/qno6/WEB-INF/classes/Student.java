import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class Student extends HttpServlet{

    public void doPost(HttpServletRequest req, HttpServletResponse res)
    throws IOException, ServletException{
        try{
            String url = "jdbc:mysql://localhost:3308/qno6";
            String user = "root", password = "";
            //String sql = "select * from users";
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection( url, user, password);
            //ResultSet rs = stmt.executeQuery(sql);
            if(!connection.isClosed()){
                Statement stmt = connection.createStatement();
                String roll = req.getParameter("roll");
                String first_name = req.getParameter("first_name");
                String last_name = req.getParameter("last_name");
                String address = req.getParameter("address");
                String sql = "INSERT INTO `student`(`roll`, `first_name`, `last_name`, `address`) VALUES ('"+roll+"','"+first_name+"','"+last_name+"','"+address+"');";
                boolean status = stmt.execute(sql);
            }
            connection.close();
        }
        catch(Exception e){
            PrintWriter pw = res.getWriter();
            pw.println(e);
        }
    }

}
