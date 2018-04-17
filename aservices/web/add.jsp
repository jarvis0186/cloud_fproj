<%-- 
    Document   : add
    Created on : Mar 21, 2018, 11:43:20 AM
    Author     : Nivi
--%>

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
            int cid=Integer.parseInt(request.getParameter("cid"));
            int sid=Integer.parseInt(request.getParameter("sid"));
            String cip=request.getParameter("cip");
            String Application=request.getParameter("app");
            String Status=request.getParameter("stat");
            
             Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_mgmt","root","");
          
            Statement st=cn.createStatement();
            
            int i=st.executeUpdate("insert into tblservices values("+cid+","+sid+",'"+cip+"','"+Application+"','"+Status+"')");
            if(i<0){
                out.print("Sorry");
            }
            else{response.sendRedirect("view.jsp");
            }%>
       </body>
</html>
