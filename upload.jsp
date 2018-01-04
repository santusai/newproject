<%@page import="java.io.InputStream"%>
<%@page import="conPackage.MyConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>upload Page</title>
	   <link rel="stylesheet" href ="style1.css">
    </head>
    <body>
    <div id="container">
<div align="right" class="style43"><img src="Aboutme.gif" align="left" style="width:200px;height:95px;" >
	<span class="AddOrange"> <a href="logout.jsp">logout</a> 
	
	</div>
	<h1><font color="blue">Upload Files</font></h1>
	<div id="content">
	<div id="navigation">
	<ul>
	<li><a class="about" href="files.html" ><b>Files</b></a></li>
	</ul>
	</div>
	<div id="main">	
    
        You can upload files here...!!!
        <%
            String storetempfile = File.createTempFile("temp","1").getParent();            
            MultipartRequest multirequest = new MultipartRequest(request,storetempfile, 15*1024*1024);     
            // maximum allowable file size is upto 15 MB
            
            Enumeration files = multirequest.getFileNames();
            

            String stringfiles="insert into documents(filename, type,content, upload_by) values (?,?,?,?)";
            PreparedStatement prsmt = MyConnection.getConnection().prepareStatement(stringfiles);
            
                        
            String fname="";
            String fileExtesion="";
            File ffile =null;
            FileInputStream finput =null;
            
            while (files.hasMoreElements())
            {
                    fname=(String)files.nextElement();                                        
                    ffile = multirequest.getFile(fname);
                    fileExtesion = ffile.getName().substring(ffile.getName().lastIndexOf("."));
                    
                    boolean fileAllowed = fileExtesion.equalsIgnoreCase(".txt")||
                                          fileExtesion.equalsIgnoreCase(".pdf")||
                                          fileExtesion.equalsIgnoreCase(".doc")||
                                          fileExtesion.equalsIgnoreCase(".docx")||
                                          fileExtesion.equalsIgnoreCase(".xls")||
                                          fileExtesion.equalsIgnoreCase(".xlsx");
                    
                    if((ffile!=null)&&fileAllowed)
                    {

                            try
                            {
                                    finput=new FileInputStream(ffile);
                                    prsmt.setString(1, ffile.getName());
                                    prsmt.setString(2, fileExtesion);
                                    prsmt.setBinaryStream(3,(InputStream)finput, (int)(ffile.length()));
                                    prsmt.setString(4, "username");        // pass the user name or id 
                                    boolean prexecute = prsmt.execute();
                                    
                                    out.print("File is uploaded successfully.!");
                                    out.print("<br/> Link available to <a href='downloadfile.jsp'>Download</a> page");
                            }

                            catch(Exception e)
                            {
                                    out.print("Failed to upload because " + e);
                            }

                            finally
                            {
                            	// we should in include statement next() which is helpful to remove temp file from finput.
                           		// we need to keep this outside so that file will close when exception occurs.
                           			finput.close();
                                    ffile.delete();
                            }
                    }
                    else
                    {
                           out.print("Please choose file type correctly...");
                    }// end of if and else
            }// end of while
                                   
            MyConnection.CloseConnection();            
        %>
        <a href="files.html">Home Page</a>
        </div>	
	</div>
<div id="footer">
	<h3>Privacy Policy & Copyright;  My WebPage</h3>
	</div>
	</div>
    </body>
</html>
