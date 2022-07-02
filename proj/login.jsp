<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Login</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<style type="text/css">
		.wrap{
			width: 100%;
			height: 100vh;
			display: flex;
			justify-content: center;
			align-items: center;
		}
		.w-30{
			width: 30%;
		}
		.bg-login{
			background-color: #0055d4;
			background-image: url("https://www.transparenttextures.com/patterns/45-degree-fabric-light.png");
		}
		.bg-gray{
			background: #cccccc;
		}
	</style>
	</head>
<body>
	<%
		if(session.getAttribute("uemail")!=null)
		{
			response.sendRedirect("home.jsp");
		}
	%>
	<div class="wrap">
		<div class="card w-30 bg-login">
			<div class="card-header">
				<h3 class="text-center">Login Form</h3>
			</div>
			<div class="card-body">
				<form method="post" action="process_login.jsp">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label>Email</label>
								<input type="text" class="form-control" name="email" placeholder="jkjk@example.com">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label>Password</label>
								<input type="password" class="form-control" name="password">
							</div>
						</div>
					</div>
					<div class="d-flex justify-content-center mt-2">
						<button type="submit" class="btn bg-gray">Login</button>
					</div>
					
				</form>
			</div>
		</div>
	</div>
</body>
</html>