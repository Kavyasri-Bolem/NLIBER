<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@page import="com.ils.dao.ilsdata"%>
<%ResultSet resultset =null;%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ISSUING</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<link rel="icon" type="image/x-icon" href="nala_logo.png">
<style>
body{
 background-color:#F1F1F1;
}
.alert{
  background-color:#F1F1F1;
  color:black;
  display:block;
  margin:0 auto;
  float:center;
  width:30%;
  hright:100%;
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
.dropbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: 5px;
  cursor: pointer;
}
option {
    background-color: white !important;
    color:black
}

</style>
</head>
<body>
<%
ilsdata dao=new ilsdata();
String select=(String)session.getAttribute("select");
if(select==null){
}
else{
	%>
	<span class="alert alert-warning alert-dismissible fade show" role="alert">
	<div class="cross"><strong>Message</strong>
	<button type="button" class="btn-close btn-sm" data-bs-dismiss="alert" aria-label="Close"></button>
	<br><br>
	</div>
	                <%out.println(select); %>
	                <button type="button" class="btnclose" data-bs-dismiss="alert" aria-label="Close">OK</button>
	               
	            </span> 
	  <% 
	  session.removeAttribute("select");
}
    try{
    	Class.forName("com.mysql.jdbc.Driver");
Connection connection = 
         DriverManager.getConnection
            ("jdbc:mysql://localhost:3306/liber","root","");

       Statement statement = connection.createStatement() ;

       resultset =statement.executeQuery("select * from "+dao.emptable) ;
%>
<form action="details.jsp">
<center>
    
        <select class="dropbtn" value="id" id="select1" name="id" >
        <%  while(resultset.next()){  %>
        
            <option value="nr00" disabled selected hidden>EMPLOYEE ID</option>
            <option  ><%= resultset.getString(1) %></option> 
       <% } %>
        </select>
        <input type="submit" value="submit" >
      
</center>

</form>
<%
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
</body>
</html>