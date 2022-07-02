<%@ page import="java.util.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Signup Status</title>
</head>
<body>
	<% 
	try {
		
		String connectionURL = "jdbc:mysql://localhost:3306/tutorial"; 
		Connection connection = null; 
		
		
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		connection = DriverManager.getConnection(connectionURL, "root", "");
		String first_name=request.getParameter("first_name");
		String middle_name=request.getParameter("middle_name");
		String last_name=request.getParameter("last_name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String cpassword=request.getParameter("cpassword");
		long ctime=new java.util.Date().getTime();
		if(!connection.isClosed())
	 	{
	 		ResultSet rs=null;
	 		Statement stmt=connection.createStatement();
	 		if (!cpassword.equals(password)) {
	 			out.println("Password mismatch");
	 		}
	 		else{
	 			String sqlMailCount="SELECT count(*) AS mail_count FROM user WHERE email='"+email+"';";
	 			rs=stmt.executeQuery(sqlMailCount);
	 			rs.next();
	 			if(rs.getInt("mail_count")!=0){
	 				out.println("Email id "+email+" is already taken");
	 			}
	 			else{
	 				String sql="INSERT INTO user(first_name,middle_name,last_name,email,password,created_at) VALUES('"+first_name+"','"+middle_name+"','"+last_name+"','"+email+"','"+password+"',"+ctime+");";
	 				boolean status=stmt.execute(sql);
	 				if(!status){
	 					out.println("<p>Created successfully</p>");
	 				}
	 				else{
	 					out.println("<p>Unable to create account</p>");	
	 				}
	 			}
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