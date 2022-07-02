<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<!DOCTYPE html>
<html>
<head>
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Add Student</title>
	<style type="text/css">
		.outer{
			margin: 3rem;
		}
	</style>
</head>
<body>
	<div class="outer">
	<div class="table-responsive">
	<table class="table">
		<thead>
			<tr>
				<td>Name</td>
				<td>City</td>
				<td>Phone</td>
				<td>Email</td>
				<td>Action</td>
			</tr>
		</thead>
		<tbody>

	<% 
		try {

				String connectionURL = "jdbc:mysql://localhost:3306/tutorial"; 
				Connection connection = null; 
				Class.forName("com.mysql.jdbc.Driver").newInstance(); 
				connection = DriverManager.getConnection(connectionURL, "root", "");
				ResultSet rs=null;

				if(!connection.isClosed())
			 	{
			 		Statement stmt=connection.createStatement();
					String sqlCount="SELECT count(*) as total_count FROM customers;";
			 		rs=stmt.executeQuery(sqlCount);
			 		rs.next();
			 		if(rs.getInt("total_count")==0){
	%>
				<tr>
					<td colspan="10" class="text-center">No Record found</td>
				</tr>
	<%

			 		}
			 		else{
			 			String sql="SELECT * FROM customers;";
			 			rs=null;
			 			rs=stmt.executeQuery(sql);
			 			while(rs.next()){
	%>
							<tr>
								<td><% out.println(rs.getString("name"));%></td>
								<td><% out.println(rs.getString("city"));%></td>
								<td><% out.println(rs.getString("phone"));%></td>
								<td><% out.println(rs.getString("email"));%></td>
								<td><a class="btn btn-primary"href='edit_customer.jsp?id=<%out.println(rs.getString("cid"));%>'>Edit</a></td>
							</tr>
	<%
			 			}
			 		}
					connection.close();
				}
			}
		catch(Exception ex){

			out.println("Unable to connect to database."+ex);
		}
	%>
				
		</tbody>
	</table>
</div>
</div>
</body>
</html>