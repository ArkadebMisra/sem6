import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Login extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse res)
    throws IOException, ServletException{
        //assume that some kind ov validation is done
        //and the useris valid so set valid = true
        boolean valid_user = true;
        if(valid_user){
            RequestDispatcher rd = req.getRequestDispatcher("MyResponse.jsp");
            rd.forward(req, res);
        }
    }
}
