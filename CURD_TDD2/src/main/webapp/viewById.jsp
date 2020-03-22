<%@page import="TDD.Learinig.com.UserModels"%>
<%@page import="TDD.Learinig.com.DB_Connection"%>
<%@page import="TDD.Learinig.com.IDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
</head>
<body>

<center>
<div class="container mt-5 mycraddiv">
<div class="card" style="width:18rem;">
<%
	int userid=Integer.parseInt(request.getParameter("userId"));		
	IDAO dbConnection=new  DB_Connection();
	UserModels model=dbConnection.getRecordsById(userid);
%>

<div class="card-body" >
    <h5 class="card-title mt-3"><%= model.getName() %></h5><hr>
    <p class="card-text ">
    
    <LABEL>ID :<span><%= model.getId()%></span></LABEL><br/>
    <LABEL>NAME :<span><%= model.getName()%></span></LABEL><br/>
    <LABEL>EMAIL :<span><%= model.getEmail() %></span></LABEL><br/>
    <LABEL>ADDRESS :<span><%= model.getAddre() %></span></LABEL><br/>
    
    
    </p>
    
	<a href="editById.jsp?userId=<%=userid%>" class="btn btn-warning btn-lg btn-hover viewedit">Edit</a>
	<a href="deleteByID.jsp?userId=<%=userid %>" class="btn btn-danger btn-lg viewdelete">Delete</a>
  </div>
</div>
</div>
</center>
</body>
</html>