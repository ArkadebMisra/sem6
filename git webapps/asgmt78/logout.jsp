<%
session.removeAttribute("name");
session.removeAttribute("email");
session.invalidate();

response.sendRedirect("login.jsp");
%>
