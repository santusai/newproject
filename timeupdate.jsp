<!DOCTYPE >
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Time update</title>
</head>
<body>

      function updateYourTime() {
        var current = new Date(), 
            months = ['January', 'February', '...']; 
            time = current.getHours() + ':' + current.getMinutes(), 

            date = [current.getDate(), 
                    months[current.getMonth()],
                    current.getFullYear()].join(' ');

        document.getElementById('currentTime').innerHTML = [date, time].join(' / ');

        setTimeout(updateYourTime, 1000);//This method will call for every second
    }
    updateYourTime();
</body>
</html>