<%@ page import ="java.sql.*" %>
<%!int i=1;%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Admin View</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
        <link rel="stylesheet" type="text/css" href="css/button.css">
<!--===============================================================================================-->
</head>
<body>
	   <style type="text/css">
.myTable { background-color:black;border-collapse:collapse; }
.myTable th { background-color:black;color:white;width:30%; }
.myTable td, .myTable th { padding:5px;border:1px solid white;color:white }
</style>
	<div class="limiter">
		<div class="background">
                     <h1 class='h1color'>Service Info:</h1>
                    <br/>
		  <%
	 	// response.setIntHeader("Refresh", 5);
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_mgmt","root", "");
    Statement st = con.createStatement();
    Statement st1=con.createStatement();
  
    
    
    ResultSet rs=st.executeQuery("select * from tblservices ");
    out.print("<table  class='myTable'><th>Service Id</th><th>Cloud Id</th><th>Cloud ip</th><th>Application</th><th>Status</th>");
    while(rs.next())
               {
        out.print("<div class='myTable'>");
      
        out.print("<tr align='center'><td>"+rs.getString("sid")+"</td><td>"+rs.getString("cid")+"</td><td>"+rs.getString("cloudip")+"</td><td>"+rs.getString("application")+"</td><td>"+rs.getString("status")+"</td></tr>");
         out.print("</div>");
    }
    out.print("</table><br/>");
    %>
    <br/>
    <h1 class='h1color'>Change Status:</h1>
    <br/>
    <%
    ResultSet rs1=st.executeQuery("select * from tblservices");
    
     out.print("<br/><table  class='myTable'><th>Service Id</th><th>Status</th>");
      while(rs1.next())
               {
         String r=rs1.getString("sid");
      
        out.print("<div>");%>
        <form action="" method="post" name="f">
            <tr align='center'><td><%=r%><td><input class='button2' type='button' style="width:98px;" name='res' value='<%=rs1.getString("status")%>' onclick="window.location.href='updservice.jsp?id=<%=r%>'"/>
                    
 <%    
     out.print("</div>");
    }
    out.print("</table>");
%>
		</div>
	</div>
	
	

	
<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>