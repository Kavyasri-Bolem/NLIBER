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
/**.dropbtn {
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
}**/
.dropbtn {
  background-color: #04AA6D;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

.dropbtn:hover, .dropbtn:focus {
  background-color: #3e8e41;
}

#myInput {
  box-sizing: border-box;
  background-image: url('searchicon.png');
  background-position: 14px 12px;
  background-repeat: no-repeat;
  font-size: 16px;
  padding: 14px 20px 12px 45px;
  border: none;
  border-bottom: 1px solid #ddd;
}

#myInput:focus {outline: 3px solid #ddd;}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f6f6f6;
  min-width: 230px;
  overflow: auto;
  border: 1px solid #ddd;
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown a:hover {background-color: #ddd;}

.show {display: block;}
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
<!-- <form action="details.jsp"> -->
<form>
<center>
    <div class="dropdown">
  <button onclick="myFunction()" class="dropbtn">Dropdown</button>
  <div id="myDropdown" class="dropdown-content">
    <input type="text" placeholder="Search.." id="myInput" onkeyup="filterFunction()">
     <%  while(resultset.next()){  %>
        
    <a href="<%=resultset.getString(1)%>"><%= resultset.getString(1) %></a>
    <%} %>
  </div>
</div>
    
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
<script>
/* When the user clicks on the button,
toggle between hiding and showing the dropdown content */
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

function filterFunction() {
  var input, filter, ul, li, a, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  div = document.getElementById("myDropdown");
  a = div.getElementsByTagName("a");
  for (i = 0; i < a.length; i++) {
    txtValue = a[i].textContent || a[i].innerText;
    if (txtValue.toUpperCase().indexOf(filter) > -1) {
      a[i].style.display = "";
    } else {
      a[i].style.display = "none";
    }
  }
}
</script>
</body>
</html>