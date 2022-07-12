<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<%
    String uname = request.getParameter("uname");
    String pass = request.getParameter("pass");
    String col = request.getParameter("col");

    out.println("<h1 style='color:"+col+"'>"+uname+"</h1>");
%>
