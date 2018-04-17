<%-- 
    Document   : login
    Created on : Apr 5, 2018, 12:51:06 PM
    Author     : Nivi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           String un=request.getParameter("uname");
            String pass=request.getParameter("pass");

        if(un.equals("admin") && pass.equals("admin"))
        {
	 response.sendRedirect("adminview.jsp");
		return;
           }
        else
        {
            out.print("Username or Password incorrect!");
            
        }
        %>
    </body>
</html>
