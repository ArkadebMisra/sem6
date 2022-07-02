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
		String name=request.getParameter("name");
		String city=request.getParameter("city");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		int age = Integer.parseInt(request.getParameter("age"));
		if(!connection.isClosed())
	 	{
	 		Statement stmt=connection.createStatement();
	 		String sql="INSERT INTO users(name, age, email, phone, city) VALUES('"+name+"','"+age+"','"+email+"','"+phone + "','"+city+"');";
	 		boolean status=stmt.execute(sql);
	 		if(!status){
			%>
				<h1 class="text-center text-success">User added successfully.</h1>
				<p><a href="add_user.html">Add another user</p>
			<%
	 		}
	 		else{
	 		%>
	 			<h1 class="text-center text-danger">Faild to add User.</h1>
				<p><a href="add_user.html">Try again</p>
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
