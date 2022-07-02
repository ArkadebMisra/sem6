<!DOCTYPE html>
<html>
<head>
	<title>Log in</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<body>
	<%
		if(session.getAttribute("email") != null){
			response.sendRedirect("dash.jsp");
		}
		if(request.getParameter("reason") == null){
	%>
	<div class="container h-100">
		<div class="row h-100 justify-content-center align-items-center">
			<div class="col-10 col-md-8 col-lg-6">
				<!-- Form -->
				<h1 align="center">Log In</h1>
				<form action="login_back.jsp" method="post">

					<div class="form-group">
						<label for="id" class="form-label">Id</label>
						<input type="text" class="form-control" id="id" name="id">
					</div>

					<div class="form-group">
						<label for="email" class="form-label">Email</label>
						<input type="text" class="form-control" id="email" name="email">
					</div>

					<br>
					<div class="form-group">
						<button type="submit" class="btn btn-primary">log in</button>
					</div>
				</form>
				<!-- Form end -->
			</div>
		</div>
	</div>
	<%
	}else{
	%>
		<h2 class="text-center" style="color:red"><p>Login failed</p></h2>
		<h3 class="text-center"> <a href="login.jsp"> try again</a> </h3>
	<% } %>
</body>
</html>
