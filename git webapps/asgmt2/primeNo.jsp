<%@ page import="java.io.*" %>

<%!
boolean isPrime(long num){
    for(long i=2;i<num;i++){
        if(num%i==0){
            return false;
        }
    }
    return true;
}
%>

<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8">
        <title></title>
    </head>
    <body>
        <%
        long n = Long.parseLong(request.getParameter("number"));
        if(n<0){
        %>
            <h1>Enter a number greater than or equal to 0</h1>
        <%
        }
        else{
            if(n==0||n==1){
            %>
                <h1><%= n %> is a neither composite nor prime number</h1>
            <%
            }
            else{
                if(isPrime(n)){
                %>
                    <h1><%= n %> is a prime number</h1>
                <%
                }
                else{
                %>
                    <h1><%= n %> is a composite number</h1>
                <%
                }
            }
        }
        %>

        <a href="primeNo.html">check</a> another number
    </body>
</html>
