<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page in HTML with CSS Code Example</title>
  <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  <link rel='stylesheet' href='style.css'>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  <style>
  body {
  background-image: linear-gradient(135deg, #FAB2FF 10%, #1904E5 100%);
  background-size: cover;
  background-repeat: no-repeat;
  background-attachment: fixed;
  font-family: "Open Sans", sans-serif;
  color: #333333;
}

.box-form {
  margin: 0 auto;
  width: 80%;
  height:550px;
  background: #FFFFFF;
  border-radius: 10px;
  overflow: hidden;
  display: flex;
  flex: 1 1 100%;
  align-items: stretch;
  justify-content: space-between;
  box-shadow: 0 0 20px 6px #090b6f85;
  margin-top: 70px;
}
@media (max-width: 970px) {
  .box-form {
    flex-flow: wrap;
    text-align: center;
    align-content: center;
    align-items: center;
  }
}
.box-form div {
  height: auto;
}
.box-form .left {
  color: #FFFFFF;
  background-image: url("images/loginlogo.png");
  background-size: cover;
  background-repeat: no-repeat;
}
.box-form .left .overlay {
  padding: 0px;
  width: 730px;
  height: 100%;
  overflow: hidden;
  box-sizing: border-box;
}
.box-form .right {
  padding: 100px;
  overflow: hidden;
  text-align: center;
}
@media (max-width: 980px) {
  .box-form .right {
    width: 100%;
  }
}
.box-form .right h5 {
  padding-top: 10px;
  margin-top: 40px;
  font-size: 6vmax;
  line-height: 0;
  font-weight: 5px;
  font-family:italic;
  color: #a0128199;
  margin-bottom:85px;
}
.box-form .right .inputs {
  overflow: hidden;
}
.box-form .right input {
  width: 100%;
  padding: 0px;
  margin-bottom: 15px;
  padding-bottom: 5px;
  font-size: 25px;
  border: none;
  outline: none;
  color:black ;
  border-bottom: 3px solid #113e97;
}
.box-form .right input:hover {
  width: 100%;
  padding: 0px;
  margin-top: 0px;
  margin-bottom: 15px;
  padding-bottom: 5px;
  font-size: 25px;
  border: none;
  outline: none;
  color:rgb(30, 2, 108) ;
  border-bottom: 3px solid #e28821;
}
.box-form .right button {
  color:#13052985;
  font-size: 23px;
  margin-top:20px;
  padding: 12px 35px;
  border: 5px solid rgb(10, 119, 10);
  border-radius: 50px;
  font-weight: 10px;
  display: inline-block;
  border: 0;
  outline: 0;
  box-shadow: 0px 4px 20px 0px #4df51ea6;
  background-image: linear-gradient(135deg, #70F570 10%, #49C628 100%);
}
.box-form .right button:hover {
  color:white;
  font-size: 23px;
  margin-top:20px;
  padding: 12px 35px;
  border: 5px solid rgb(119, 10, 88);
  border-radius: 50px;
  font-weight: 15px;
  display: inline-block;
  border: 0;
  outline: 0;
  cursor: pointer;
  box-shadow: 0px 4px 20px 0px #c61ef5a6;
  background-image: linear-gradient(135deg, #db30d2 10%, #ea4ee2 100%);
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

	
	<div class="box-form">
	<div class="left">
		<div class="overlay">
		</div>
	</div>
	<div class="right">
		<h5>Login</h5>
		<form action="checklogin.jsp">
		<div class="inputs">
			<input type="text" placeholder="user name" name="username" required>
			<br>
			<input type="password" placeholder="password" name="password" required>
		</div>
		<button type="submit">Login</button>
		</form>
	</div>

</div>
</body>
</html>