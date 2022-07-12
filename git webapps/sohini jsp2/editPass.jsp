<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
 
 
<html>
<head>
    <title>Edit User</title>
</head>
<body>
    <%
        try {
 
            String connectionURL = "jdbc:mysql://localhost:3306/login";
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection connection = DriverManager.getConnection(connectionURL, "root", "");
            if(!connection.isClosed())
            {
                Statement stmt=connection.createStatement();
                ResultSet rs=null;
                String email = (String)session.getAttribute("email");
                String sql="SELECT * FROM `users` WHERE email='"+email+"';";
                rs=stmt.executeQuery(sql);
                if(rs.next())
                {
                %>
                <h3 align="center">Edit User</h3>
                <div style="display: flex; justify-content: center; align-items: center;">
                <form action="updatePass.jsp" method="post" >
                    <label for="email">Email</label><br>
                        <input type="hidden" value="<% out.print(rs.getString("email"));%>" id="email" name="email"><br><br>
                   
                    <label for="password">New Password</label><br>
                        <input type="text" value="<% out.print(rs.getString("password"));%>" id="password" name="password"><br><br>

                    <input type="submit" value="submit">
                
                </form>
                </div>
                <% } 
                connection.close();
            }
        }
        catch(Exception e){
            out.println("An exception occurred: " + e.getMessage());
        }
    %>

