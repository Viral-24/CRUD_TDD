<%@page import="TDD.Learinig.com.UserModels"%>
<%@page import="TDD.Learinig.com.DB_Connection"%>
<%@page import="TDD.Learinig.com.IDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="style.css">
</head>
<body>
<%
	int userId=Integer.parseInt(request.getParameter("userId"));
    IDAO dbConnection=new DB_Connection();
    UserModels model=dbConnection.getRecordsById(userId);
%>

<div>
<form action="Process/edit" method="post">
	<div align="center">
				<div class="col-md-4">
					<div class="form-group">
						<label for="id">ID:</label> <input type="text" value="<%= model.getId() %>"
							class="form-control" placeholder="Enter Your Id"
							required="required" name="id">
					</div>

				<div class="form-group">
						<label for="name">NAME:</label> <input type="text" value="<%= model.getName() %>"
							class="form-control" placeholder="Enter Your Name"
							required="required" name="name">
					</div>
					<div class="form-group">
						<label for="email">EMAIL:</label> <input type="email" value="<%= model.getEmail()%>"
							class="form-control" placeholder="Enter Your Email"
							required="required" name="email">
					</div>

					<div class="form-group">
						<label for="addres">ADDRESS:</label> <input type="text" value="<%= model.getAddre() %>"
							class="form-control" placeholder="Enter Your Addres"
							required="required" name="addres">
					</div>
					
					<input type="submit" class="btn btn-primary btn-lg" value="Edit"/>
	</div>
</form>
</div>

</body>
</html>