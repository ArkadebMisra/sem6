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
		String id=request.getParameter("id");
		if(!connection.isClosed())
	 	{
	 		Statement stmt=connection.createStatement();
	 		String sql="DELETE FROM `users` WHERE id="+ id +";";
	 		boolean status=stmt.execute(sql);
	 		if(!status){
			%>
				<h1 class="text-center text-success">User deleted successfully.</h1>
				<p><a href="user_list.jsp">User list</p>
			<%
	 		}
	 		else{
	 		%>
	 			<h1 class="text-center text-danger">Faild to delete User.</h1>
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
