<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conPackage.MyConnection"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Download Page</title>
	  <link rel="stylesheet" href ="style1.css">
    </head>
    <body>
    <div id="container">
<div align="right" class="style43"><img src="Aboutme.gif" align="left" style="width:200px;height:95px;" >
	<span class="AddOrange"> <a href="logout.jsp">logout</a> 
	
	</div>
	<h1><font color="blue">Download File Confirmation Page</font></h1>
	<div id="content">
	<div id="navigation">
	<ul>
	<li><a class="about" href="files.html" ><b>Upload</b></a></li>
	<li><a class="downloadfile" href="downloadfile.jsp" ><b>Download</b></a></li>
	<li><a class="deletefile" href="deletefile.jsp" ><b>Delete</b></a></li>
	</ul>
	</div>
	<div id="main">	
    <%
    String doc_id = request.getParameter("Doc_id");     
    ResultSet rs = MyConnection.getResultFromSqlQuery("select filename, type, content from documents where Doc_id = " + doc_id);
    rs.next();
    
    response.reset();
                             
    if(rs.getString(2)==".txt")
    {
        response.setContentType("application/octet-stream");
    }
    else if(rs.getString(2)==".pdf")
    {
        response.setContentType("application/pdf");
    }
    else if((rs.getString(2)==".doc")||rs.getString(2)==".docx")
    {
        response.setContentType("application/msword");
    }
    else if((rs.getString(2)==".xls")||(rs.getString(2)==".xlsx"))
    {
        response.setContentType("application/vnd.ms-excel");
    }
    response.addHeader("Content-Disposition","attachment; filename="+rs.getString(1));
    Blob blb = rs.getBlob(3);
    byte[] bdata = blb.getBytes(1, (int) blb.length());
    
    OutputStream output =  response.getOutputStream();
    output.write(bdata);
    output.close();
              
    rs.close();
    MyConnection.CloseConnection(); 
%>
        </div>	
	</div>
<div id="footer">
	<h3>Privacy Policy & Copyright;  My WebPage</h3>
	</div>
	</div>
    </body>
</html>

