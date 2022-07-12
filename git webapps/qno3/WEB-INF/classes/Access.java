import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Access extends HttpServlet{
    public void doGet(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException{
        res.setContentType("text/html");
        PrintWriter pw = res.getWriter();
        HttpSession hs = req.getSession(true);
        if(hs.getAttribute("no_of_access")==null){
            hs.setAttribute("uname", "root");
            hs.setAttribute("password", "rootpass");
            hs.setAttribute("no_of_access", "0");
        }
        else{
            int at = Integer.parseInt((String)hs.getAttribute("no_of_access"));
            //pw.println(Integer.parseInt((String)hs.getAttribute("no_of_access")));
            hs.setAttribute("no_of_access", Integer.toString(at+1));
        }

        //PrintWriter pw = res.getWriter();
        pw.println("<h1>UserName: "+hs.getAttribute("uname")+"</h1>");
        pw.println("<h1>Password: "+hs.getAttribute("password")+"</h1>");
        pw.println("<h1>Accessed: "+hs.getAttribute("no_of_access")+" times</h1>");
        String form = "<form action='http://localhost:8081/qno3/access' method='post'> inv1<input type='submit' value='subumit'></form>";
        pw.println(form);
        pw.close();
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException{
        HttpSession hs = req.getSession();
        hs.invalidate();
        res.sendRedirect("access");
    }
}
