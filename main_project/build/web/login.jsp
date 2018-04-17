<%-- 
    Document   : login
    Created on : 7 Apr, 2018, 2:34:51 PM
    Author     : abhiw
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <% 
try{
String un=request.getParameter("username");
String pass=request.getParameter("pass");

if(un.equals("admin") && pass.equals("admin"))
{
	 response.sendRedirect("http://localhost:8084/adminservices/index.jsp");
		//return;
}
else
{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_mgmt","root","");
    Statement st = con.createStatement();
    ResultSet rs=st.executeQuery("select * from members where uname='"+un+"' and pass='"+pass+"'");
    if(rs.next())
               {
         session.setAttribute("name", un);
         response.sendRedirect("userhome.jsp");
		return;
    }
    else
     {
            response.sendRedirect("index.html");
		return;
    }   
}
}catch(Exception ex){
    out.print(ex);
}

%>
    </body>
</html>
