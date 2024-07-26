<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>employee details </title>
<link rel="icon" type="image/x-icon" href="">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  
<style>
	table{
	border: 1px solid;
	border-collapse:collapse;
	width:70%;
	margin-left:200px;
	}
	td,th{
	border:1px solid black;
	padding:8px;
	}
	th{
		padding-top:12px;
		padding-bottom:12px;
		text-align:left;
		background-color:green;
		color:white;
	}
	
	.show-btn{
		background: red;
		padding:10px 20px;
		font-size:20px;
		font-weight:500;
		color:#3498db;
		cursor:pointer;
		box-shadow:0px 0px 10px rgba(0,0,0,0.1);
	}
	.show-btn{
		position:absolute;
		top:90%;
		left:40%;
		transform:translate(-50%,-50%);
	}
	.container{
		position:absolute;
		top:50%;
		left:50%;
		transform:translate(-50%,-50%);
	}
	input[type="checkbox"]{
		display:none;
	}
	.container{
	display:none;
	background:rgba(192,192,192,0.7);
	width:410px;
	padding:30px;
	box-shadow:0 0 8px rgba(0,0,0,0.1);
	}
	#show:checked ~ .container{
		display:block;
	}
	.container .text{
	font-size:35px;
	font-weight:600;
	text-align:center;
	}
	.container form{
	margin-top:-20px;
	}
	.container form .data{
		height:45px;
		width:100%;
		margin:40px 0;
	}
	form .data label{
	font-size:18px;
	}
	form .data input{
		height:100%;
		width:100%;
		padding-left:10px;
		font-size:17px;
		border:1px solid silver;
	}
	form .data input:focus{
	border-color:#3498db;
	border-bottom-width:2px;
	}
	form .btn{
		margin:30px 0;
		height:45px;
		width:100%;
		position:relative;
		overflow:hidden;
	}
	form .btn .inner{
		height:100%;
		width:300%;
		position:absolute;
		left:-100%;
		z-index:-1;
		background: -webkit-linear-gradient(right,#56d8e4,#9f01ea,#56d8e4,#9f01ea);
		transition: all 0.4s;
	}
	form .btn:hover .inner{
		left:0;
	}
	form .btn button{
		height:100%;
		width:100%;
		background:none;
		border:none;
		color:#fff;
		font-size:18px;
		font-weight:500;
		text-transform:uppercase;
		letter-spacing:1px;
		cursor:pointer;
	}
	.container .close-btn{
		position:absolute;
		right:20px;
		top:15px;
		font-size:18px;
		cursor:pointer;
	}
	.container .close-btn:hover{
		color:#3498db
	}
	
	
		.show-btn1{
		background: red;
		padding:10px 20px;
		font-size:20px;
		font-weight:500;
		color:#3498db;
		cursor:pointer;
		box-shadow:0px 0px 10px rgba(0,0,0,0.1);
	}
	.show-btn1{
		position:absolute;
		top:90%;
		left:60%;
		transform:translate(-50%,-50%);
	}
	.container1{
		position:absolute;
		top:50%;
		left:50%;
		transform:translate(-50%,-50%);
	}
	input[type="checkbox"]{
		display:none;
	}
	.container1{
	display:none;
	background:rgba(192,192,192,0.7);
	width:410px;
	padding:30px;
	box-shadow:0 0 8px rgba(0,0,0,0.1);
	}
	#show1:checked ~ .container1{
		display:block;
	}
	.container1 .text{
	font-size:35px;
	font-weight:600;
	text-align:center;
	}
	.container1 form{
	margin-top:-20px;
	}
	.container1 form .data1{
		height:45px;
		width:100%;
		margin:40px 0;
	}
	form .data1 label{
	font-size:18px;
	}
	form .data1 input{
		height:100%;
		width:100%;
		padding-left:10px;
		font-size:17px;
		border:1px solid silver;
	}
	form .data1 input:focus{
	border-color:#3498db;
	border-bottom-width:2px;
	}
	#delbtn{
		margin:30px 0;
		height:45px;
		width:100%;
		position:relative;
		overflow:hidden;
	}
	form .btn1 .inner{
		height:100%;
		width:300%;
		position:absolute;
		left:-100%;
		z-index:-1;
		background: -webkit-linear-gradient(right,#56d8e4,#9f01ea,#56d8e4,#9f01ea);
		transition: all 0.4s;
	}
	form .btn1:hover .inner{
		left:0;
	}
	form .btn1 button{
		height:100%;
		width:100%;
		background: -webkit-linear-gradient(right,#56d8e4,#9f01ea,#56d8e4,#9f01ea);
		border:none;
		color:#fff;
		font-size:18px;
		font-weight:500;
		text-transform:uppercase;
		letter-spacing:1px;
		cursor:pointer;
	}
	.container1 .close-btn1{
		position:absolute;
		right:20px;
		top:15px;
		font-size:18px;
		cursor:pointer;
	}
	.container1 .close-btn1:hover{
		color:#3498db
	}
	
	
	
	
	.alert{
  	background-color:white;
  	color:black;
  	display:block;
  	margin-left:35%;
  	float:top;
  	width:30%;
  	position:fixed;
  	top: 0;
  	}
  	.alert .btnclose{
  	float:right;
  	marign-left:50px;
  	background-color:#45b6fe;
  	color:white;
  	font-weight:bolder;
  	width:50px;
  	border-radius:5px;
  	border:2px solid #3792cb;
  	box-shadow:0px 15px 20px white;
  	}
  	.alert .cross{
  	float:top;
  	font-size:20px;
  	text-align:align-right;
  	}
  	.alert .cross strong{
  		font-size:20px;
  		color:blue;
  	}
  	
</style>
</head>
<body>
<%String error=(String)session.getAttribute("error");
	//out.println(error);
	if(error==null)
	{
		
	}
	else{
		%>
		<span class="alert alert-warning alert-dismissible fade show" role="alert">
			<div class="cross"><strong>Message</strong>
			<button type="button" class="btn-close btn-sm" data-bs-dismiss="alert" aria-label="Close"></button>
			<br><br>
			</div>
                <%out.println(error); %>
                <button type="button" class="btnclose" data-bs-dismiss="alert" aria-label="Close">OK</button>
                
            </span>  
            
		<%
		//out.println(error);
		error=null;
		session.removeAttribute("error");
	}
	%>
<script type="text/javascript">
	
</script>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %> 
<%@page import="java.sql.Connection" %>
<%@page import="com.ils.dao.ilsdata"%>

<%
	ilsdata dao=new ilsdata();
	Statement stmt=null;
	ResultSet resultset=null;
%>
	<div class="center">
	<input type="checkbox" id="show">
		<label for="show" class="show-btn">Add Employee</label>
		<div class="container">
			<label for="show" class="close-btn fa fa-window-close" aria-hidden="true"></label>
			<div class="text">Add Employee</div>
			<form action="addemployee.jsp">
				<div class="data">
					<label>Employee ID</label>
					<input type="text" name="eid" required>
				</div>
				<div class="data">
					<label>Employee Name</label>
					<input type="text" name="ename" required>
				</div>
				<div class="btn">
					<div class="inner"></div>
					<button type="submit">ADD</button>
				</div>
			</form>
		</div>
	</div>
	
	<div class="center1">
	<input type="checkbox" id="show1">
		<label for="show1" class="show-btn1">Delete Employee</label>
		<div class="container1">
			<label for="show1" class="close-btn1 fa fa-window-close" aria-hidden="true"></label>
			<div class="text">Delete Employee</div>
			<form action="delemployee.jsp">
				<div class="data1">
					<label>Employee ID</label>
					<input type="text" name="eid" required>
				</div>
				<div class="data1">
					<label>Employee Name</label> 
					<input type="text" name="ename" required>
				</div>
				<div class="btn1" id="delbtn">
					<div class="inner1"></div>
					<button type="submit">DELETE</button>
				</div>
			</form>
		</div>
	</div>
	<table class="roundedcorners" style="overflow-y:auto;">
		<tr>
			<th>Employee ID</th>
			<th>Employee Name</th>
		</tr>
		<%
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection(dao.url,dao.username,dao.pass);
				stmt=con.createStatement();
				String sql="SELECT * FROM "+dao.emptable;
				resultset=stmt.executeQuery(sql);
				while(resultset.next())
				{
					%>
					<tr>
						<td><%=resultset.getString("eid") %></td>
						<td><%=resultset.getString("ename") %></td>
					</tr>
					<%
				}
			}
			catch(Exception e)
		{
				e.printStackTrace();
		}
		%>
	</table>
</body>

</html>