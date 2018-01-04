<%@ page import ="java.sql.*" %>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conPackage.MyConnections"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href ="style1.css">
        <title>Profile Page</title>
        <style>
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 15px;
}
</style>
    </head>
<body>	
<div id="container">
	<div align="right" class="style43"><img src="Aboutme.gif" align="left" style="width:200px;height:95px;" >
	<span class="AddOrange"> <a href="Home.jsp">Home</a> | <span class="AddOrange"> <a href="logout.jsp">Logout</a> 
	</div>
	<h1><font color="blue">Profile</font></h1>
	<div id="content">
	<div id="navigation">
	<ul>
	<li><a class="profile" href="profile.jsp" ><b>Profile</b></a></li>
	<li><a class="about" href="files.html" ><b>Files</b></a></li>
	<li><a class="settings" href="settings.html" ><b>Settings</b></a></li>
	</ul>
	</div>
	<div id="main">	
	<script type="text/javascript">
weekday=new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
monthname=new Array("January","February","March","April","May","June","July","August","September","October","November","December");
function GetClock(){
var date=new Date();
var numday=date.getDay(),nummonth=date.getMonth(),numdate=date.getDate(),numyear=date.getYear();
if(numyear<1000) numyear+=1900;
var numhour=date.getHours(),nummin=date.getMinutes(),numsec=date.getSeconds(),AMorPM;
if(numhour==0){AMorPM=" AM";numhour=12;}
else if(numhour<12){AMorPM=" AM";}
else if(numhour==12){AMorPM=" PM";}
else if(numhour>12){AMorPM=" PM";numhour-=12;}
if(nummin<=9) nummin="0"+nummin;
if(numsec<=9) numsec="0"+numsec;
document.getElementById('displayclock').innerHTML=""+weekday[numday]+", "+monthname[nummonth]+" "+numdate+", "+numyear+" "+numhour+":"+nummin+":"+numsec+AMorPM+"";
}
window.onload=function(){
GetClock();
setInterval(GetClock,1000);
}
</script>
<div id="displayclock"></div><br><br>
		  <center>
		 <table border="1">
		 <caption><b>User Profile Details</b></caption>
       <%
        String userid = request.getParameter("username");    
        String pwd = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = null;
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/data", "root", "santhu");
        Statement st = con.createStatement();
        ResultSet rs = MyConnections.getResultFromSqlQuery("select id, first_name, last_name, email, uname, pass, regdate from members");
        if(rs.next())
        { session.setAttribute("userid", userid);
        PreparedStatement ps = null;
        String uid = rs.getString("id");
        String fname = rs.getString("first_name");
        String lname = rs.getString("last_name");
        String mail = rs.getString("email");
        String usename = rs.getString("uname");	
        String date = rs.getString("regdate");	
        out.println(
        		("<tr>"+"<th>"+"FirstName"+"</th>" + "<td>"+rs.getString(2)+"</td>"+ "</tr>")+(
        				"<tr>"+"<th>"+"LastName"+"</th>" + "<td>"+rs.getString(3)+"</td>"+ "</tr>")+
        				("<tr>"+"<th>"+"Email"+"</th>" + "<td>"+rs.getString(4)+"</td>"+ "</tr>")+
        				("<tr>"+"<th>"+"User Name"+"</th>" + "<td>"+rs.getString(5)+"</td>" +"</tr>") +
        				("<tr>"+"<th>"+"Registration Date"+"</th>" + "<td>"+rs.getString(7)+"</td>" +"</tr>")
                );
        }
        
 %> </table></center></br></br>


	</div>	
	</div>
<div id="footer">
	<h3>Privacy Policy & Copyright;  My WebPage</h3>
	</div>
	</div>
</body>
</html>

        
        
        
  
