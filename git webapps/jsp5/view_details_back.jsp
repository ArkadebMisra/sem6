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
            String sql = "select * from product where p_no="+request.getParameter("p_no")+";";
            rs = stmt.executeQuery(sql);
            while(rs.next()){
                out.println(rs.getString("p_no"));
                out.println(rs.getString("p_name"));
                out.println(rs.getString("color"));
                out.println(rs.getString("price"));
            }
        }
        connection.close();
    %>
        <a href='delete_product.jsp?p_no=<%out.println(request.getParameter("p_no"));%>'>delete product</a>
    <%
    }
    catch(Exception e){
        out.println(e);
    }
    %>

</body>
</html>
