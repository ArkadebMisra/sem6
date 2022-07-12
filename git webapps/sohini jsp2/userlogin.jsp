<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
<head>
    <title>Add Student</title>
</head>
<body>
    <%
    try {
 
        String connectionURL = "jdbc:mysql://localhost:3306/login";
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection connection = DriverManager.getConnection(connectionURL, "root", "");
 
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        int a=0;
 
        if(!connection.isClosed())
        {
            ResultSet rs = null;
            Statement stmt= connection.createStatement();
            String sql="SELECT * FROM `users` WHERE email='"+email+"';";
            rs =stmt.executeQuery(sql);
            if(rs.next())
            {
                session.setAttribute("email", rs.getString("email"));
                session.setAttribute("password", rs.getString("password"));

                a++;
                
           
            }
            else{
            %>
                <h3 align="center" style="color: red;">User not found
                </h3>
 
            <%
            }
            connection.close();
            if(a == 0){
                response.sendRedirect("login.jsp?reason=420");
            }else{
                response.sendRedirect("greetUser.jsp");
            }
        }
    }
    catch(Exception e){
        out.println("An exception occurred: " + e.getMessage());
    }
%>
</body>
</html>
