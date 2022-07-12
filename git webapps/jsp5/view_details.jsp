<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title></title>
</head>
<body>
    <h1>Select product id to view details of the product</h1>
    <%
    try{
        String connectionURL = "jdbc:mysql://localhost:3308/jsp5";
        Connection connection = null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection(connectionURL, "root", "");
    %>
        <form action="view_details_back.jsp" method="post">
            id
            <select name="p_no">
    <%
        if(!connection.isClosed()){
            Statement stmt = connection.createStatement();
            ResultSet rs = null;
            String sql = "select * from product;";
            rs = stmt.executeQuery(sql);
            while(rs.next()){
                out.println("<option value='"+rs.getString("p_no")+"'>"+ rs.getString("p_no") +" </option>");
            }
        }
        connection.close();
    }
    catch(Exception e){
        out.println(e);
    }
    %>
        </select>
        <input type="submit" value="view details">
    </form>

</body>
</html>
