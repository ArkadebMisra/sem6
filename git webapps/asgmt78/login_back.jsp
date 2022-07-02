<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.*" %>


<%
try {

		String connectionURL = "jdbc:mysql://localhost:3308/asgmt78";
		Connection connection = null;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		connection = DriverManager.getConnection(connectionURL, "root", "");
		String email = request.getParameter("email");
		String id = request.getParameter("id");
		long last_login = new java.util.Date().getTime();
		if(!connection.isClosed())
	 	{
	 		Statement stmt=connection.createStatement();
	 		String sql=String.format("SELECT * from users where email = '%s' AND id = '%s'", email, id);
			ResultSet rs = null;
			rs = stmt.executeQuery(sql);
			int a = 0;
			while(rs.next()){
				session.setAttribute("email", email);
				session.setAttribute("name", rs.getString("name"));
				a++;
				break;
			}
			connection.close();

			if(a == 0){
				response.sendRedirect("login.jsp?reason=420");
			}else{
				response.sendRedirect("dash.jsp");
			}
		}
	}
catch(Exception ex){

	out.println(ex);
	out.println("Unable to connect to database.");
}
%>
