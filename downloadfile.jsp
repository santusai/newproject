<%@page import="java.sql.ResultSet"%>
<%@page import="conPackage.MyConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Download Files</title>
        <link rel="stylesheet" href ="style1.css">
    </head>
    <body>
    
      <div id="container">
<div align="right" class="style43"><img src="Aboutme.gif" align="left" style="width:200px;height:95px;" >
	<span class="AddOrange"> <a href="Home.jsp">Home</a> | <span class="AddOrange"> <a href="logout.jsp">Logout</a> 
	
	</div>
	<h1><font color="blue">Download files</font></h1>
	<div id="content">
	<div id="navigation">
	<ul>
	<li><a class="about" href="files.html" ><b>Upload</b></a></li>
	<li><a class="downloadfile" href="downloadfile.jsp" ><b>Download</b></a></li>
	<li><a class="deletefile" href="deletefile.jsp" ><b>Delete</b></a></li>
	</ul>
	</div>
	<div id="main">	          
        <table border="1">
            <tr><th>File Name</th><th>File Type</th><th>Upload Time</th><th>Action</th></tr>
            <%
                ResultSet rs = MyConnection.getResultFromSqlQuery("select Doc_id,filename,type, upload_time, upload_by from documents");
                int count =0;
                while(rs.next())
                {
                   out.println("<tr>"
                           + "<td>"+rs.getString(2)+"</td>"
                           + "<td>"+rs.getString(3)+"</td>"
                           + "<td>"+rs.getString(4)+"</td>"
                           + "<td><a href='download.jsp?Doc_id="+rs.getInt(1) +"'> Download </a></td>"                                                      
                           + "</tr>");
                   count++;
                }
                rs.close();
                MyConnection.CloseConnection();
                if(count==0)
                {
                    out.println("<tr><td colspan='4'> No File Found..!! </td></tr>");
                }
            %>            
        </table>
      </div>	
	</div>
<div id="footer">
	<h3>Privacy Policy & Copyright;  My WebPage</h3>
	</div>
	</div>
    
      
    </body>
</html>
