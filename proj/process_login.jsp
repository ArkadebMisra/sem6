<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Login Process</title>
</head>
<body>
	<% 
	try {
		
		String connectionURL = "jdbc:mysql://localhost:3306/tutorial"; 
		Connection connection = null; 
		
		
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		connection = DriverManager.getConnection(connectionURL, "root", "");
		String email=request.getParameter("email");
		String pass=request.getParameter("password");
		long ctime=new java.util.Date().getTime();
		if(!connection.isClosed())
	 	{
	 		ResultSet rs=null;
	 		Statement stmt=connection.createStatement();
	 		String sqlFetch="SELECT * FROM user WHERE email='"+email+"';";
	 		rs=stmt.executeQuery(sqlFetch);
	 		if(rs.next()){
	 			if (!rs.getString("password").equals(pass)) {
	 				out.println("Password is Incorrect!");
	 			}
	 			else{
	 				session.setAttribute("uid",rs.getString("id"));
	 				session.setAttribute("uemail",rs.getString("email"));
	 				// session.setMaxInactiveInterval(1);
	 				response.sendRedirect("home.jsp");
	 			}
	 		}
	 		else{
	 			out.println("Incorrect email provided!");
	 		}
	 		connection.close();
	 	}
	 }
	 	catch(Exception e){
	 		out.println(e);
	 	}
	 %>
</body>
</html>