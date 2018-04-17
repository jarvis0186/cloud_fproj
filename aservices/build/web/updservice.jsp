<%-- 
    Document   : updservice
    Created on : Apr 15, 2016, 4:25:37 PM
    Author     : Lazy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        try{
        String id=request.getParameter("id");
        String No="No";
        String Yup="Yes";
        String ip1="192.168.43.94";
        
        String ip2="192.168.1.18";
        Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_mgmt","root","");
    Statement st = con.createStatement();
    ResultSet rs=st.executeQuery("select * from tblservices where sid="+id);
    if(rs.next())
     {
        String sta=null;
        sta=rs.getString("status");
          int c_id=Integer.parseInt(rs.getString("cid")); 
         if(sta.equals(Yup)&&c_id==1)
     {
         c_id=1;
          int i=st.executeUpdate("update tblservices set status='"+No+"' where sid="+id);
          int j=st.executeUpdate("update tblservices set cloudip='"+ip1+"' where sid="+id);
          int k=st.executeUpdate("update tblservices set cid="+c_id+" where sid="+id);
          
          response.sendRedirect("view.jsp");
     }
         else if(sta.equals(No)&&c_id==1)
      {
            c_id=2;
            int i=st.executeUpdate("update tblservices set status='"+Yup+"' where sid="+id);
            int j=st.executeUpdate("update tblservices set cloudip='"+ip2+"' where sid="+id);
            int k=st.executeUpdate("update tblservices set cid="+c_id+" where sid="+id);
          response.sendRedirect("view.jsp");
     }
           else if(sta.equals(Yup)&&c_id==2)
      {
            c_id=2;
            int i=st.executeUpdate("update tblservices set status='"+No+"' where sid="+id);
            int j=st.executeUpdate("update tblservices set cloudip='"+ip2+"' where sid="+id);
            int k=st.executeUpdate("update tblservices set cid="+c_id+" where sid="+id);
          response.sendRedirect("view.jsp");
     }
          else if(sta.equals(No)&&c_id==2)
      {
            c_id=1;
            int i=st.executeUpdate("update tblservices set status='"+Yup+"' where sid="+id);
            int j=st.executeUpdate("update tblservices set cloudip='"+ip1+"' where sid="+id);
            int k=st.executeUpdate("update tblservices set cid="+c_id+" where sid="+id);
          response.sendRedirect("view.jsp");
     }
      }
     }
        catch(Exception e)
                               {
            out.print(e);
        }
        %>
        <form action="addservice.jsp" method="post" name="r">
            <br/> <input type="submit" value="Add Service?"/><br/>
        </form>
    </body>
</html>
