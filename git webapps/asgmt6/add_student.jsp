<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <title></title>
</head>
<body>
	<%
	try {

        String connectionURL = "jdbc:mysql://localhost:3308/asgmt6";
        Connection connection =  null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection(connectionURL, "root", "");
		String roll=request.getParameter("roll");
		String first_name=request.getParameter("first_name");
        String last_name=request.getParameter("last_name");
		String age=request.getParameter("age");
        String email=request.getParameter("email");
        String phone=request.getParameter("phone");

		if(!connection.isClosed())
	 	{
	 		ResultSet rs=null;
	 		Statement stmt=connection.createStatement();
	 		String sql="INSERT INTO students(roll,first_name,last_name,age,email,phone)"+
                        "VALUES('"+roll+"','"+first_name+"','"+last_name+"','"+age+"','"+email+"','"+phone+"');";
	 		boolean status=stmt.execute(sql);
	 		if(!status)
	 		{
            %>
	 			<h1><p class="text-center text-success">Student added successfully.</p></h1>
	 		<%
	 		}
	 		else{
	 		%>
	 			<h1><p class="text-center text-danger">Student not added.</p></h1>

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
