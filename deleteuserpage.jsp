<%@page import="java.sql.ResultSet"%>
<%@page import="conPackage.MyConnections"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Page</title>
<link rel="stylesheet" href ="style1.css">
</head>
<body>	
	<div id="container">
<div align="right" class="style43"><img src="Aboutme.gif" align="left" style="width:200px;height:95px;" >
	<span class="AddOrange"> <a href="Home.jsp">Home</a> | <span class="AddOrange"> <a href="logout.jsp">Logout</a>                        
	</div>
	<h1><font color="blue">Delete User Permanently</font></h1>
	<div id="content">
	<div id="navigation">
	<ul>
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
<h3>Do you want to delete your account permanetly!</h3>
<form method="post" action="deleteuser.jsp">
          <center>
            <table border="1" width="70%" cellpadding="3">
                <thead>
                    <tr>
                        <th colspan="2"><b><font size="4" color="blue">Enter login details to delete your account</font></b></th>
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
                        <td><input type="submit" value="Delete" /></td>
                        <td><input type="reset" value="Reset" /></td>
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

