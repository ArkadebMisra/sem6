
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Welcome</title>
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
		
		if(!connection.isClosed())
	 	{
	 		ResultSet rs=null;
	 		Statement stmt=connection.createStatement();
	 		String sqlFetch="SELECT * FROM user WHERE email='"+session.getAttribute("uemail")+"';";
	 		rs=stmt.executeQuery(sqlFetch);
	 		rs.next();
	 %>
	 		<p>Welcome <% out.println(rs.getString("first_name")); %></p>
	 <%
	 		connection.close();
	 	}
	 }
	 	catch(Exception e){
	 		out.println(e);
	 	}
	 %>
</body>
</html>