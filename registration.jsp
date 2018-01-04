<%@ page import ="java.sql.*" %>
<%
    String fstname = request.getParameter("firstname");
    String lstname = request.getParameter("lastname");
    String mail = request.getParameter("email");
    String user = request.getParameter("username");    
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/data", "root", "santhu");
    Statement stmt = conn.createStatement();
    //ResultSet rs;
    
    if( fstname==null || lstname==null || mail==null || user==null || password==null || fstname=="" || lstname=="" || mail=="" || user=="" || password==""){
   		
  			response.sendRedirect("reg.jsp");
   		 
    }
    else {
    	int i = stmt.executeUpdate("insert into members(first_name, last_name, email, uname, pass, regdate) values ('" + fstname + "','" + lstname + "','" + mail + "','" + user + "','" + password + "', CURDATE())"); 
    		if (i > 0 )  {
        	//session.setAttribute("userid", user);
        	response.sendRedirect("welcome.jsp");
      		 // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
  		 }
    		else
        response.sendRedirect("reg.jsp");
    }
    
%>