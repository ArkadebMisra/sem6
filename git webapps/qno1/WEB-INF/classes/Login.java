import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class Login extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		String uname = request.getParameter("uname");
		String pwd = request.getParameter("password");
		PrintWriter pw = response.getWriter();
		if(uname.equals("root") && pwd.equals("rootpass"))
		{
			//pw.println("fuck it!!!!!!!!!!!");
			response.sendRedirect("welcome.html");
		}
		else
		{
			PrintWriter p = response.getWriter();
			p.println("Wrong credentials");
            p.close();
		}
	}
}
