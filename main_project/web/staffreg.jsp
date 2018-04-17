   <%@ page import="java.util.List" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.*" %>
   
   <%@ page import="java.sql.*" %>
   <%@ page contentType="text/html;charset=UTF-8" language="java" %>
   <%@ page import="java.io.*,java.util.*" %>
   <%@ page import= "com.oreilly.servlet.*" %>  
           
                   <%     
 try
       { 
    
    
                Class.forName("com.mysql.jdbc.Driver");
            Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_mgmt","root","");
            Statement st;
 
   
             st=con.createStatement();

    
         String fname=request.getParameter("fname").toString();
         String lname=request.getParameter("lname").toString();
         String email=request.getParameter("email").toString();
         String uname=request.getParameter("username").toString();
         String pass=request.getParameter("pass").toString();
        
      int i=st.executeUpdate("insert into members values('"+ fname +"','"+lname+"','"+email+"','"+uname+"','"+pass+"',now())");
          if(i>0)
          {
        out.print("<script>alert('Student Record added Successfully');");
        response.sendRedirect("index.html");
          }
          {
        	  out.print("<script>alert('Error in Registration');");
          }
              
}
           
    catch (Exception e) {
          // e.printStackTrace();
             out.print(e);
   }
        %>
