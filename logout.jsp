<%
session.setAttribute("usename", null);
//when user name is null then it will redirect to login page
session.invalidate();
response.sendRedirect("index.jsp");
%>