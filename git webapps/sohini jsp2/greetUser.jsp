<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
</head>
<body>
    <h3 align="center" style="color: blue;">Hello! <% out.println(session.getAttribute("email")); %></h3>
    <p align="center"><a href="logout.jsp">Logout</a></p>
    <a href='editPass.jsp'>Edit Password</a>
</body>
</html>