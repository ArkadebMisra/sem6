<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Dynamic form</title>
</head>
<body>
	<form>
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
	 		String sqlFetch="SELECT * FROM form;";
	 		rs=stmt.executeQuery(sqlFetch);
	 		while(rs.next()){
	 		%>
	 		<label><% out.println(rs.getString("label"));%></label><br>
	 		<input type='<% out.println(rs.getString("type"));%>' name='<% out.println(rs.getString("field_name"));%>' placeholder='<% out.println(rs.getString("placeholder"));%>' value='<% out.println(rs.getString("default_value"));%>'><br>
	 		<%
	 		}
	 		connection.close();
	 	}
	 }
	 	catch(Exception e){
	 		out.println(e);
	 	}
	 %>
	 </form>
</body>
</html>