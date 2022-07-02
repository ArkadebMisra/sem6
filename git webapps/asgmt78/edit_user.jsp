<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>


<html>
<head>
	<title>Edit User</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<body>
		<%
		try {

			String connectionURL = "jdbc:mysql://localhost:3308/asgmt78";
			Connection connection = null;
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			connection = DriverManager.getConnection(connectionURL, "root", "");
			if(!connection.isClosed())
		 	{
		 		Statement stmt=connection.createStatement();
		 		ResultSet rs=null;
		 		int id = Integer.parseInt(request.getParameter("id"));
		 		String sql="SELECT * FROM `users` WHERE id="+id;
		 		rs=stmt.executeQuery(sql);
		 		if(rs.next())
		 		{
		 %>


		 <div class="container h-100">
	 		<div class="row h-100 justify-content-center align-items-center">
	 			<div class="col-10 col-md-8 col-lg-6">
	 				<!-- Form -->
	 				<h1 align="center">Edit User</h1>
	 				<form action="update_user.jsp" method="post">

					<div class="form-group">
						<input type="hidden" class="form-control" id="id" name="id" value="<% out.print(id);%>">
					</div>

	 					<div class="form-group">
	 						<label for="name" class="form-label">Name</label>
	 						<input type="text" class="form-control" id="name" name="name" value="<% out.print(rs.getString("name"));%>">
	 					</div>

	 					<div class="form-group">
	 						<label for="city" class="form-label">City</label>
	 						<input type="text" class="form-control" id="city" name="city" value="<% out.print(rs.getString("city"));%>">
	 					</div>

	 					<div class="form-group">
	 						<label for="age" class="form-label">Age</label>
	 						<input type="text" class="form-control" id="age" name="age" value="<% out.print(rs.getString("age"));%>">
	 					</div>

	 					<div class="form-group">
	 						<label for="email" class="form-label">Email</label>
	 						<input type="text" disabled class="form-control" id="email" name="email" value="<% out.print(rs.getString("email"));%>">
	 					</div>

	 					<div class="form-group">
	 						<label for="phone" class="form-label">Phone</label>
	 						<input type="text" disabled class="form-control" id="phone" name="phone" value="<% out.print(rs.getString("phone"));%>">
	 					</div>

	 					<br>
	 					<div class="form-group">
	 						<button type="submit" class="btn btn-primary">update user</button>
	 					</div>
	 				</form>
	 				<!-- Form end -->

	 			</div>
	 		</div>
	 	</div>
		 <%
		 		}

		 	// 	String name=request.getParameter("name");
				// String city=request.getParameter("city");
				// int age = Integer.parseInt(request.getParameter("age"));
				// sql="UPDATE `customer` set name=
		 	}
			connection.close();
		}

		catch(Exception ex){

			out.println("Unable to connect to database.");
		}
%>

</body>
</html>
