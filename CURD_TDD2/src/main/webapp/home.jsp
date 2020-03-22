<%@page import="TDD.Learinig.com.UserModels"%>
<%@page import="java.util.List"%>
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

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="style.css">
<title>home title here</title>
</head>
<body style="background: linear-gradient(110deg, #fdcd3b 60%, #ffed4b 60%);">

<%
	

	IDAO dbConnection=new DB_Connection();
	List<UserModels> mylist=dbConnection.getRecords();	
	if (mylist.size()>0) {
	
	
%>
<br>
	<br>
	<center>
<button ><a href='http://localhost:8080/CURD_TDD/register.jsp'>ADD NEW</a></button>
	</center>
	<br />
	<div class="container ">
	<table class="table table-dark ">
		<thead class=" theadcss">
			<tr >
				<th>ID</th>
				<th >NAME</th>
				 <th >EMAIL</th>
				 <th>ADDRESS</th>
				<th colspan="4" >PERFORM OPERATION</th> 
			</tr>
		</thead>
		<tbody>
			<%
				for (UserModels model : mylist) {
			%>
			<tr>

				<td>
					<%
						out.print(model.getId());
					%>
				</td>
				<td >
					<%
						out.print(model.getName());
					%>
				</td>
				<td >
					<%
						out.print(model.getEmail());
					%>
				</td>
				<td >
					<%
						out.print(model.getAddre());
					
					%>
				</td>
			
			<td><a href="viewById.jsp?userId=<%=model.getId()%> "><button type="button" class="btn btn-primary rounded-circlee edit"  >View</button></a></td>
			<td><a href="editById.jsp?userId=<%=model.getId()%> "><button type="button"  class="btn btn-warning rounded-circlee edit">Edit</button></a></td>
			<td><a href="#" onclick="askConfirm('<%=model.getId()%>','<%=model.getName()%>')"><button type="button"  class="btn btn-danger  rounded-circled delete">Delete</button></a><td>
			</tr>
			<%
				}
			%>

		</tbody>
	</table>
</div>
	<centre>
	<%
	}
		else {
			
			
			out.print("<a href='http://localhost:8080/CURD_TDD/register.jsp'><button>ADD NEW </button></a>");
		}
	%>
	</centre>	
	<script type="text/javascript" rel="javascript">
	function askConfirm(userId,userNm)
	{
				
				var response=confirm("DO YOU WANT TO DELETE RECORD OF"+userNm+"!!!!");
					if(response)
						{
						console.log("inside on click methos");
						window.location="http://localhost:8080/CURD_TDD/deleteById.jsp?userId="+userId;
						}
	
	}
	</script>
	
	
</body>
</html>