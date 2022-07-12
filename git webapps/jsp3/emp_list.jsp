<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title></title>
</head>
<body>
    <h1>filter</h1>
    <form action="emp_list.jsp" method="post">
        designation
        <select name="designation">
            <option value="all">all</option>
            <option value="a">a</option>
            <option value="b">b</option>
            <option value="c">c</option>
        </select>
        <input type="submit" name="" value="filter">
    </form>
    <%
    try{
        String connectionURL = "jdbc:mysql://localhost:3308/jsp3";
        Connection connection = null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection(connectionURL, "root", "");
        if(!connection.isClosed()){
            Statement stmt = connection.createStatement();
            ResultSet rs = null;
            String sql;
            String filter_by = request.getParameter("designation");
            out.println(filter_by);
            if(filter_by==null || filter_by.equals("all")){
                sql = "select * from employee;";
            }
            else{
                sql = "select * from employee where designation='"+filter_by+"';";
            }
            out.println(sql);
            rs = stmt.executeQuery(sql);
            while(rs.next()){
                String id = rs.getString("id");
                String salary = rs.getString("salary");
                String des = rs.getString("designation");
                out.println("<p>"+ id +" "+ salary +" " + des +" </p>");
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
