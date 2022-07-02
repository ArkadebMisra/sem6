<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
<title>Connection with mysql database</title>
</head>
<body>
<%
try {

		String connectionURL = "jdbc:mysql://localhost:3308/asgmt78";
		Connection connection = null;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		connection = DriverManager.getConnection(connectionURL, "root", "");
		int id = Integer.parseInt(request.getParameter("id"));
		String name=request.getParameter("name");
		String city=request.getParameter("city");
		int age = Integer.parseInt(request.getParameter("age"));
		if(!connection.isClosed())
	 	{
	 		Statement stmt=connection.createStatement();
	 		String sql="UPDATE users SET name=\""+name+"\",city=\""+city+"\",age="+age+" WHERE id="+id;
	 		boolean status=stmt.execute(sql);
			if(!status){
			%>
				<h1 class="text-center text-success">User updated successfully.</h1>
			<%
	 		}
	 		else{
	 		%>
	 			<h1 class="text-center text-danger">Faild to update User.</h1>
			<%
			}
			connection.close();
		}
	}
catch(Exception ex){
	out.println(ex);
	out.println("Unable to connect to database.");
}
%>
</body>
</html>
