<%@ page import ="java.sql.*" %>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conPackage.MyConnections"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Login Page</title>
<link rel="stylesheet" href ="style1.css">
</head>
<body>	
	<div id="container">
<div align="right" class="style43"><img src="Aboutme.gif" align="left" style="width:200px;height:95px;" >
	<span class="AddOrange"> <a href="Welcomepage.html">Home</a> | <span class="AddOrange"> <a href="reg.jsp">Sign Up</a>                        
</div>
	<h1><font color="blue">Login Page</font></h1>
	<div id="content">
	<div id="navigation">
	<ul>
	<li><a class="about" href="aboutpage.html" ><b>About</b></a></li>
	<li><a class="contactdetails" href="contactdetails.html" ><b>Contact</b></a></li>
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
<form method="post" action="login.jsp" action="profile.jsp">
            <center>
            <table border="1" width="70%" cellpadding="3">
                <thead>
                    <tr>
                        <th colspan="2"><b><font size="4" color="blue">Login Here</font></b></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><b>User Name</b></td>
                        <td><input type="text" name="username" value="" /></td>
                    </tr>
                    <tr>
                        <td><b>Password</b></td>
                        <td><input type="password" name="password" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Login" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                    <tr>
                        <td colspan="2"><b><font color="red">Yet Not Registered!</font></b> <a href="reg.jsp"><b>Register Here</b></a></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>
	</div>	
	</div>
<div id="footer">
	<h3>Privacy Policy & Copyright;  My WebPage</h3>
	</div>
	</div>
</body>
</html>