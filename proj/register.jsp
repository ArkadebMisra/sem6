<%
		if(session.getAttribute("uemail")!=null)
		{
			response.sendRedirect("home.jsp");
		}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Sign up</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<style type="text/css">
		.wrap{
			width: 100%;
			height: 100vh;
			display: flex;
			justify-content: center;
			align-items: center;
		}
	</style>
</head>
<body>
	<div class="wrap">
		<div class="card">
			<div class="card-header">
				<h3>Signup Form</h3>
			</div>
			<div class="card-body">
				<form method="post" action="process_signup.jsp">
					<div class="row">
						<div class="col-lg-4 col-md-4 col-sm-12">
							<div class="form-group">
								<label>First Name</label>
								<input type="text" class="form-control" name="





								first_name" placeholder="Bismay">
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12">
							<div class="form-group">
								<label>Middle Name</label>
								<input type="text" class="form-control" name="middle_name" placeholder="Kumar">
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12">
							<div class="form-group">
								<label>Last Name</label>
								<input type="text" class="form-control" name="last_name" placeholder="Purakastaya">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label>Email</label>
								<input type="email" class="form-control" name="email" placeholder="example@bismay.com">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label>Password</label>
								<input type="password" class="form-control" name="password">
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label>Confirm Password</label>
								<input type="password" class="form-control" name="cpassword">
							</div>
						</div>
						<div class="mt-2 row ">
							<div class=" justify-content-center">
								<input type="submit" class="btn btn-primary" value="Register">	
							</div>
							
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>