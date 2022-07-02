<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<title>Dynamic form</title>
</head>
<body>


	<div class="container h-100">
		<div class="row h-100 justify-content-center align-items-center">
			<div class="col-10 col-md-8 col-lg-6">

                <h1 align="center">Enter Details</h1>

				<form>
				<%
				try {

					String connectionURL = "jdbc:mysql://localhost:3308/asgmt9";
					Connection connection = null;


					Class.forName("com.mysql.jdbc.Driver").newInstance();
					connection = DriverManager.getConnection(connectionURL, "root", "");
					if(!connection.isClosed())
				 	{
				 		ResultSet rs=null;
				 		Statement stmt=connection.createStatement();
				 		String sql="SELECT * FROM form;";
				 		rs=stmt.executeQuery(sql);
				 		while(rs.next()){
				 		%>

						<div class="form-group">
							<label for="roll" class="form-label"><% out.println(rs.getString("label"));%></label>
							<input type='<% out.println(rs.getString("type"));%>'
							class="form-control"
							id='<% out.println(rs.getString("field_name"));%>'
							name='<% out.println(rs.getString("field_name"));%>'
							placeholder='<% out.println(rs.getString("placeholder"));%>'
							value='<% out.println(rs.getString("default_value"));%>'>
						</div>

				 		<%
				 		}
				 		connection.close();
				 	}
				 }
				 	catch(Exception e){
				 		out.println(e);
				 	}
				 %>
				 <br>
				 <div class="form-group">
					 <button type="submit" class="btn btn-primary">submit</button>
				 </div>
				 </form>
			</div>
		</div>
	</div>
</body>
</html>
