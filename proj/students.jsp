<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>Roll</th>
				<th>Name</th>
				<th>City</th>
			</tr>
		</thead>
		<tbody>
			
		
		<% 
		try {

			String connectionURL = "jdbc:mysql://localhost:3306/tutorial"; 
			Connection connection = null; 
			Class.forName("com.mysql.jdbc.Driver").newInstance(); 
			connection = DriverManager.getConnection(connectionURL, "root", "");
			if(!connection.isClosed())
		 	{
		 		Statement stmt=connection.createStatement();
		 		ResultSet rs=null;
		 		String sql="SELECT * FROM student;";
		 		rs=stmt.executeQuery(sql);
		 		while(rs.next()){
		 %>
		 		<tr>
		 			<td><% out.print(rs.getString("roll"));%></td>
		 			<td><% out.print(rs.getString("name"));%></td>
		 			<td><% out.print(rs.getString("city"));%></td>
		 		</tr>
		 <%
		 		}
 			}
			connection.close();
		}
	
		catch(Exception ex){

			out.println("Unable to connect to database.");
		}
%>
</tbody>
	</table>
</body>
</html>