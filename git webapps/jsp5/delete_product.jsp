<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title></title>
</head>
<body>
    <%
    try{
        String connectionURL = "jdbc:mysql://localhost:3308/jsp5";
        Connection connection = null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection(connectionURL, "root", "");
        if(!connection.isClosed()){
            Statement stmt = connection.createStatement();
            ResultSet rs = null;
            String sql = "DELETE FROM `product` WHERE p_no="+request.getParameter("p_no")+";";
            boolean status = stmt.execute(sql);
            if(!status){
                out.println("deleted successfully");
            }
            else{
                out.println("failed to delete");
            }
        }
        connection.close();
    }
    catch(Exception e){
        out.println(e);
    }
    %>

</body>
</html>
