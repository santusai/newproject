<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Success Page</title>
<link rel="stylesheet" href ="style1.css">
</head>
<body>	
	<div id="container">
<div align="right" class="style43"><img src="Aboutme.gif" align="left" style="width:200px;height:95px;" >
	<span class="AddOrange"> <a href="logout.jsp"></a> 
		<%
    if ((session.getAttribute("usename") == "") || (session.getAttribute("usename") == null)) {
%>
Sorry, You are not yet logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>
<b>Welcome! <%=session.getAttribute("usename")%></b>
<a href='logout.jsp'>Log out</a>
<%
    }
%>
	</div>
	<h1><font color="blue">User Welcome Page</font></h1>
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

	</div>	
	</div>
<div id="footer">
	<h3>Privacy Policy & Copyright;  My WebPage</h3>
	</div>
	</div>
</body>
</html>