<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
 
<html>
<head>
    <title>Update user</title>
</head>
<body>
<%
    try {
        String connectionURL = "jdbc:mysql://localhost:3306/login";
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection connection = DriverManager.getConnection(connectionURL, "root", "");
 
        
        
        if(!connection.isClosed())
        {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            out.println(email + password);
            Statement stmt=connection.createStatement();
	 		String sql="UPDATE users SET password = '"+password+"' where email= '"+email+"';";
	 		boolean status=stmt.execute(sql);
            if(!status){
            %>
                <h3 align="center" style="color: green;">Updated</h3>
                
            <%
            }
            else{
            %>
                <h3 align="center" style="color: red;">Failed to update User.</h3>
                
            <%
            }
            connection.close();
        }
    }
    catch(Exception e){
        out.println("An exception occurred: " + e.getMessage());
    }
%>
</body>
</html>
