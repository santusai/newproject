<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conPackage.MyConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete File</title>
<link rel="stylesheet" href ="style1.css">
</head>
<body>

<div id="container">
<div align="right" class="style43"><img src="Aboutme.gif" align="left" style="width:200px;height:95px;" >
	<span class="AddOrange"> <a href="logout.jsp">logout</a> 
	
	</div>
	<h1><font color="blue">Delete File Confirmation Page</font></h1>
	<div id="content">
	<div id="navigation">
	<ul>
	<li><a class="about" href="files.html" ><b>Upload</b></a></li>
	<li><a class="downloadfile" href="downloadfile.jsp" ><b>Download</b></a></li>
	<li><a class="deletefile" href="deletefile.jsp" ><b>Delete</b></a></li>
	</ul>
	</div>
	<div id="main">	
	
	
<%! String nameofdriver = "com.mysql.jdbc.Driver";%>
<%!String dburl = "jdbc:mysql://localhost:3306/all";%>
<%!String user = "root";%>
<%!String password = "santhu";%>
<%
String docid = request.getParameter("Doc_id");
if(docid != null)
{
Connection conn = null;
PreparedStatement prstmt = null;
int userID = Integer.parseInt(docid);
try
{
	Class.forName(nameofdriver);
	conn = DriverManager.getConnection(dburl,user,password);
	String sql = "DELETE FROM documents WHERE Doc_id="+ docid;
	prstmt = conn.prepareStatement(sql);
	int update = prstmt.executeUpdate();
	if(update > 0){%>
		<%out.print("Successfully file is deleted");%><%
	}
	else{%><%
		out.println("While deleting file there is problem occured."); 
		out.print("Manually check in database");
	} %>
	<%
}
catch(SQLException sqlexception){
	request.setAttribute("error", sqlexception);
	out.println(sqlexception);
}

}
%>
        <br/>
        <br/>
        <a href="downloadfile.jsp"> You can download file here</a><br/><br/>
        <a href="deletefile.jsp"> You can delete file here</a>

	</div>	
	</div>
<div id="footer">
	<h3>Privacy Policy & Copyright;  My WebPage</h3>
	</div>
	</div>

</body>
</html>