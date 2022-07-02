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
		if(!connection.isClosed())
	 	{
	 		ResultSet rs=null;
	 		Statement stmt=connection.createStatement();
	 		String sql="SELECT * FROM customers WHERE cid="+id+";";
	 		rs=stmt.executeQuery(sql);
	 		rs.next();

%>
<div class="card">
	<div class="card-body">
			<form method="post" action="process_update.jsp">
				<input type="hidden" name="id" value='<% out.println(rs.getString("cid"));%>'>
			  <div class="form-group">
			    <label for="name">Name</label>
			    <input type="text" class="form-control" id="name" name="name" value='<% out.println(rs.getString("name"));%>'>  
			  </div>
			  <div class="form-group">
			    <label for="city">City</label>
			    <input type="text" class="form-control" id="city" name="city" value='<% out.println(rs.getString("city"));%>'>  
			  </div>
			  <div class="form-group">
			    <label for="age">Age</label>
			    <input type="number" class="form-control" id="age" name="age" value=<% out.println(rs.getString("age"));%>>  
			  </div>
			  <div class="form-group">
			    <label for="phone">Phone</label>
			    <input type="text" class="form-control" id="phone" name="phone" readonly value='<% out.println(rs.getString("phone"));%>'>  
			  </div>
			  <div class="form-group">
			    <label for="email">Email</label>
			    <input type="text" class="form-control" id="email" name="email" readonly value='<% out.println(rs.getString("email"));%>' >  
			  </div>
			  <div class="form-group mt-2">
			  	<input type="submit" value="Update" class="btn btn-primary">
			  </div>
			</form>
		</div>
	</div>
<%	 		

			connection.close();
		}
	}
catch(Exception ex){

	out.println("Unable to connect to database.");
}
%>
</body> 
</html>