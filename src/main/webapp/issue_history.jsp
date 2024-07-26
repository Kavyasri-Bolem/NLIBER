<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%ResultSet resultset =null;%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar" %>    
<%@page import ="java.util.concurrent.TimeUnit" %>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.Period"%>
<%@page import="java.time.Duration"%>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@page import="com.ils.dao.ilsdata"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>
function sample(){
	alert("OOPS! Something wrong");
	//window.location.href = "issue.jsp";
}
</script>
<style>
table{
border:1px solid black;
font-family:cursive;
font-size:16px;
}
.center3{
position:absolute;
top:40%;
left:40%;
transform:translate(-50%,-50%);
}
::-webkit-scrollbar{
width:0px;
background:transparent;
}
/*
.highlighted
        {
            background-color: yellow;
        }
        .highlight
        {
            background-color: #fff34d;
            -moz-border-radius: 5px; 
            -webkit-border-radius: 5px;
            border-radius: 5px;
            -moz-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.7); 
            -webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.7); 
            box-shadow: 0 1px 4px rgba(0, 0, 0, 0.7); 
        }
        .highlight
        {
            padding: 1px 4px;
            margin: 0 -4px;
        }
 */
</style>
<!--  
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function searchAndHighlight(searchTerm, selector) {
            if (searchTerm) {               
                var selector = selector || "#realTimeContents"; //use body as selector if none provided
                var searchTermRegEx = new RegExp(searchTerm, "ig");
                var matches = $(selector).text().match(searchTermRegEx);
                if (matches != null && matches.length > 0) {
                    $('.highlighted').removeClass('highlighted'); //Remove old search highlights 
 
                    //Remove the previous matches
                    $span = $('#realTimeContents span');
                    $span.replaceWith($span.html());
 
                    if (searchTerm === "&") {
                        searchTerm = "&amp;";
                        searchTermRegEx = new RegExp(searchTerm, "ig");
                    }
                    $(selector).html($(selector).html().replace(searchTermRegEx, "<span class='match'>" + searchTerm + "</span>"));
                    $('.match:first').addClass('highlighted');
 
                    var i = 0;
 
                    $('.next_h').off('click').on('click', function () {
                        i++;
 
                        if (i >= $('.match').length) i = 0;
 
                        $('.match').removeClass('highlighted');
                        $('.match').eq(i).addClass('highlighted');
                        $('.ui-mobile-viewport').animate({
                            scrollTop: $('.match').eq(i).offset().top
                        }, 300);
                    });
                    $('.previous_h').off('click').on('click', function () {
 
                        i--;
 
                        if (i <0) i = $('.match').length - 1;
 
                        $('.match').removeClass('highlighted');
                        $('.match').eq(i).addClass('highlighted');
                        $('.ui-mobile-viewport').animate({
                            scrollTop: $('.match').eq(i).offset().top
                        }, 300);
                    });
 
 
 
 
                    if ($('.highlighted:first').length) { //if match found, scroll to where the first one appears
                        $(window).scrollTop($('.highlighted:first').position().top);
                    }
                    return true;
                }
            }
            return false;
        }
 
        $(document).on('click', '.searchButtonClickText_h', function (event) {
 
            $(".highlighted").removeClass("highlighted").removeClass("match");
            if (!searchAndHighlight($('.textSearchvalue_h').val())) {
                alert("No results found");
            }
 
 
        });
    </script>
    -->
</head>
<body>
<!--  
<div class="searchContend_h">
        <div class="ui-grid-c">
            <div class="ui-block-a">
                <input name="text-12" id="text-12" value="" type="text" class="textSearchvalue_h" />
            </div>
            <div class="ui-block-b">
                <button><a href="#" class="searchButtonClickText_h">Search</a></button>
            </div>
            <div class="ui-block-c">
                <a href="#" class="next_h">Next</a>
            </div>
            <div class="ui-block-d">
                <a href="#" class="previous_h">Previous</a>
            </div>
            <div id="realTimeContents">
   -->
<%
ilsdata dao=new ilsdata();
try{
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/liber","root","");
	Statement st = connection.createStatement() ;
	ResultSet rs=st.executeQuery("select * from "+dao.issuetable);
	%>
	<div class="center3">
	<div style="height:450px; overflow-y: scroll; margin:0;padding:0">
	<table align="center" bgcolor="white" border="1" cellspacing="0" height="20%" width="100%">
    <tr height="25%">
    <th width="20%" >EMPLOYEE ID</th>
     <th width="20%" >EMPLOYEE NAME</th>
    <th width="20%" >ISBN</th>
    <th width="20%" >BOOK NAME</th>
    <th width="20%" >AUTHOR</th>
    <th width="40%" >ISSUED-DATE</th>
     <th width="40%" >RETURN-STATUS</th>
     <th width="40%" >DURATION</th>
     <th width="20%">BOOK CONDITION</th>
    </tr>
    <%
	while(rs.next()){
%>
		
		<tr align="center" style="height:90px">
		<td width="20%" ><%=rs.getString("empid") %></td>
		<td width="20%" ><%=rs.getString("empname") %></td>
		<td width="20%" ><%=rs.getString("isbn") %></td>
		<td width="20%" ><%=rs.getString("bname") %></td>
		<td width="20%" ><%=rs.getString("author") %></td>
		<td width="40%"><%=rs.getString("idate") %></div></td>
        <td width="40%" ><%if(rs.getString("rdate")==null){
        	out.println("YET TO RETURN");}
        	else{
        	out.println(rs.getString("rdate"));}%>
		</td>
		<td width="20%">
		<% if(rs.getString("rdate")==null){
			String date=rs.getString("idate");
	        LocalDate dateObj = LocalDate.now();
	       SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	       DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	       String ndate = dateObj.format(formatter);
	       java.util.Date odate=sdf.parse(date);
	       java.sql.Date sodate=new java.sql.Date(odate.getTime());
	       java.util.Date nedate=sdf.parse(ndate);
	       java.sql.Date newdate=new java.sql.Date(nedate.getTime());
	       int days=(int)((newdate.getTime()-sodate.getTime())/(1000*60*60*24));
	       if(days==1){
	    	   out.println(days+" day");
	       }
	       else{
	        out.println(days+" days");
	        }
			} 
		   else{
			   String date=rs.getString("idate");
		        
		       SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		      
		       String ndate=rs.getString("rdate");
		       java.util.Date odate=sdf.parse(date);
		       java.sql.Date sodate=new java.sql.Date(odate.getTime());
		       java.util.Date nedate=sdf.parse(ndate);
		       java.sql.Date newdate=new java.sql.Date(nedate.getTime());
		       int days=(int)((newdate.getTime()-sodate.getTime())/(1000*60*60*24));
		       if(days==1){
		    	   out.println(days+" day");
		       }
		       else{
		        out.println(days+" days");
		        }
		   }%>
		</td>
		
		<td width="20%"><%=rs.getString("comment") %></td>
		</tr>
		<%
		}
	}
    catch(Exception e)
    {

    	%>
    	<script>
        sample();
        </script>
        <%
    }
%>
        
</table>
 </div>
</div>
</div>
</body>
</html>