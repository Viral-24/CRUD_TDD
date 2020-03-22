<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FORM PAGE</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<style>
</style>
</head>
<body style=" background:linear-gradient(110deg, #fdcd3b 60%, #ffed4b 60%);">
	<div class="container mt-5" align="center">

		<form action="Process/insert" method="get">
			<div class="col-md-4">
				<div class="form-group">
					<label for="id">ID:</label> <input type="text" class="form-control"
						placeholder="Enter Your Id" required="required" name="id">
				</div>

				<div class="form-group">
					<label for="name">NAME:</label> <input type="text"
						class="form-control" placeholder="Enter Your Name"
						required="required" name="name">
				</div>

				<div class="form-group">
					<label for="email">EMAIL:</label> <input type="email"
						class="form-control" placeholder="Enter Your Email"
						required="required" name="email">
				</div>

				<div class="form-group">
					<label for="addres">ADDRESS:</label> <input type="text"
						class="form-control" placeholder="Enter Your Addres"
						required="required" name="addres">
				</div>
				<input type="submit" class="btn btn-primary" value="Enter" />


			</div>
	</div>
</body>
</html>