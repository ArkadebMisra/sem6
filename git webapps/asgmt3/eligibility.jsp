<%@ page import="java.io.*" %>

<%!
boolean isEligible(int age){
    if(age>=18){
        return true;
    }
    return false;
}
%>

<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8">
        <title></title>
    </head>
    <body>
        <%
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        if(age<0){
        %>
            <h1>Enter correct input</h1>
        <%
        }
        else{
            if(isEligible(age)){
                %>
                <h1><%= name %>, you are eligible to vote.</h1>
                <%
            }
            else{
                %>
                <h1><%= name %>, you are not eligible to vote.</h1>
                <%
            }
        }
        %>

        <a href="voter.html">check</a> another person's eligibility.
    </body>
</html>
