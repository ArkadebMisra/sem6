<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html> 
<head> 
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Connection with mysql database</title> 
</head> 
<body>
	<% 
	try {

		String connectionURL = "jdbc:mysql://localhost:3306/tutorial"; 
		Connection connection = null; 
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		connection = DriverManager.getConnection(connectionURL, "root", "");
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String city=request.getParameter("city");
		String age=request.getParameter("age");

		if(!connection.isClosed())
	 	{
	 		ResultSet rs=null;
	 		Statement stmt=connection.createStatement();
	 		String sql="UPDATE customers SET name='"+name+"',city='"+city+"',age="+age+" WHERE cid="+id+";";
	 		boolean status=stmt.execute(sql);
	 		if(!status)
	 		{
	 		%>
	 			<p class="text-center text-success">Result Updated successfully.</p>
	 		<%
	 		}
	 		else{
	 		%>
	 			<p class="text-center text-danger">Result not updated.</p>

	 		<%
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