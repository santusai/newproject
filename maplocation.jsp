<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Location</title>
<link rel="stylesheet" href ="style1.css">
<style>
#CurrentLocation{
  width: 300px;
  height: 250px;
  align:right;
  border: 8px solid transparent;
}
</style>
</head>
<body>	
	<div id="container">
<div align="right" class="style43"><img src="Aboutme.gif" align="left" style="width:200px;height:95px;" >
	<span class="AddOrange"> <a href="Home.jsp">Home</a> | <span class="AddOrange"> <a href="logout.jsp">Logout</a>                        
	</div>
	<h1><font color="blue">Your Location</font></h1>
	<div id="content">
	<div id="navigation">
	<ul>
	<li><a class="profile" href="profile.jsp" ><b>Profile</b></a></li>
	<li><a class="about" href="files.html" ><b>Files</b></a></li>
	<li><a class="settings" href="settings.html" ><b>Settings</b></a></li>
	<li><a class="about" href="mail.jsp" ><b>Mail</b></a></li>
	<li><a class="about" href="maplocation.jsp" ><b>Maps</b></a></li>
	
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

<div class="w3-content w3-section" style="max-width:500px">
		<img class="slidshow" src="" align="" style="width:0px;height:0px; border: 2px solid transparent;" >	
		</div>

<script type="text/javascript" 
  src="http://maps.google.com/maps/api/js?sensor=true">
</script>
</script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC1ZUzdybwn1Gtn23_4QtG5IDNSdUErQVA&callback=myMap"></script>
<!--Google Maps and Javascript API resources are included-->
<script type="text/javascript" 
  src="http://maps.google.com/maps/api/js?sensor=true">
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC1ZUzdybwn1Gtn23_4QtG5IDNSdUErQVA&callback=myMap"></script>
<script>
var show;
var showmap;
window.onload = function() {
// Map's  Options are
GetClock();
setInterval(GetClock,1000);
var index = 0;
carosel();

function carosel() {
    var a;
    var b = document.getElementsByClassName("slidshow");
    for (a = 0; a < b.length; a++) {
       b[a].style.display = "none";  
    }
    index++;
    if (index > b.length) {index = 1}    
    b[index-1].style.display = "block";  
    setTimeout(carosel, 2000); // every 2 seconds image changes 
}
  var selection = {
	zoom: 12,   
	// selected zoom is 12, but you can choose from a range of "0" to "21"    
    mapTypeId: google.maps.MapTypeId.ROADMAP // Here map type is default
	
  };
  showmap = new google.maps.Map(document.getElementById("CurrentLocation"), selection);
  // getCurrentPosition method of Geo-location API  
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(
      geolocationSuccess, geolocationFailure
    );
    show.innerHTML = "wait! Searching process started";
  } else {
    show.innerHTML = "Sorry, current browser don't support geolocation.";
  }
}
// Geo-location Success 
function geolocationSuccess(position) {
    var showlocation = new google.maps.LatLng
	(position.coords.latitude,position.coords.longitude);     
	showmap.setCenter(showlocation); // Display user's location in the centre.
	
var informationwindow = new google.maps.InfoWindow();
	// Display message to the user 
	informationwindow.setContent("you are located here");// Display message
    informationwindow.setPosition(showlocation);
    informationwindow.open(showmap);
	show.innerHTML = "Mapping your Current Location on Google Maps";
}
  //  Each error code while Geo-location Failure occurs
function geolocationFailure(positionError) {
  if (positionError.code == 1) {
    show.innerHTML = 
     "You choosen not to share, So we won't ask you again.";
  }
  else if (positionError.code == 2) {
    show.innerHTML =
     "Network is down.";
  }
  else if (positionError.code == 3) {
    show.innerHTML =
     "Before getting location data, attempt is timed-out.";
  }
  else {
    show.innerHTML =
     "This the unknown error, we don't know that.";
  }
}
</script>
  <div id="CurrentLocation"></div>
	</div>	
	</div>
<div id="footer">
	<h3>Privacy Policy & Copyright;  My WebPage</h3>
	</div>
	</div>
</body>
</html>