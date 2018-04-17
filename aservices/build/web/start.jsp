<%@page import="java.lang.reflect.Modifier"%>
<%@page import="java.lang.management.OperatingSystemMXBean"%>
<%@page import="java.lang.management.ManagementFactory"%>
<%@page import="java.lang.reflect.Method"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.util.Random"%>
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
    <%
        // response.setIntHeader("Refresh", 5);
        Thread.sleep(30000);
          
        OperatingSystemMXBean operatingSystemMXBean=ManagementFactory.getOperatingSystemMXBean();
        
        long startTimes1 =0;
        long taskTime1=0;
         long startTimes2=0;
        long taskTime2=0;
        Random R= new Random();
        int k=(Math.abs(R.nextInt())%6)+1;
        startTimes1 = System.nanoTime( );
        Thread.sleep(k*1000);
        Runtime r=Runtime.getRuntime();
        
        Process p=null;
        String s="C:\\xampp\\xampp-control.exe";
        p=r.exec(s);
        taskTime1 = System.nanoTime( );
        long diffTime1=taskTime1-startTimes1;
        double dT1=(double)diffTime1/1000000000;
        
        %>
        <script type="text/javascript">
            alert("Server started on ip1");
        </script>
            
            <%   
                  Class.forName("com.mysql.jdbc.Driver");
        Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_mgmt","root", "");
        Statement st1 = con1.createStatement();
        ResultSet rs=st1.executeQuery("select * from tblservices");
        Random R1= new Random();
        int k1=(Math.abs(R1.nextInt())%6)+1;
        startTimes2 = System.nanoTime( );
         Thread.sleep(k1*1000);%>
         <script type="text/javascript">
             window.location.replace("http://192.168.43.94:8080/adminservices/start.jsp");
                      </script><%
        
        
        taskTime2 = System.nanoTime( );
        long diffTime2=taskTime2-startTimes2;
        double dT2=(double)diffTime2/1000000000;
        
      
        
        if(dT1<dT2){
         
            if(rs.next()){
                int c_id=1;
                int i=st1.executeUpdate("update tblservices set cloudip='192.168.43.57'");
                int j=st1.executeUpdate("update tblservices set cid="+c_id);
                int a=st1.executeUpdate("update tblservices set status='Yes'");
                
                
                    
            }
            String perf="C:\\Users\\abhiw\\Desktop\\project\\ServerStart\\ip1performance"+i+".txt";
            
        PrintWriter pw = new PrintWriter(new FileOutputStream(perf)); // save file
        pw.println("The process time to start server on ip '192.168.43.57' is :"+dT1+" seconds");
         pw.println("The process time to start server on ip '192.168.43.94' is :"+dT2+" seconds");
        i++;
               pw.println("Server from ip1 responded faster, Database Updated...");
             pw.println("System Performance:");
        for(Method method: operatingSystemMXBean.getClass().getMethods())
        {
            method.setAccessible(true);
            String methodName=method.getName();
            if(methodName.startsWith("get")&&Modifier.isPublic(method.getModifiers())&&OperatingSystemMXBean.class.isAssignableFrom(method.getDeclaringClass())){
                pw.println(methodName.substring(3)+": "+ method.invoke(operatingSystemMXBean));
            }
        }
        pw.close(); 
                //response.sendRedirect("view.jsp");
        }
        
        else{
          
             if(rs.next()){
                 int c_id=2;
                int i=st1.executeUpdate("update tblservices set cloudip='192.168.43.94'");
                 int j=st1.executeUpdate("update tblservices set cid="+c_id);
                 int a=st1.executeUpdate("update tblservices set status='Yes'");
                
            }
              String perf="C:\\Users\\abhiw\\Desktop\\project\\ServerStart\\ip2performance"+i+".txt";
            
        PrintWriter pw = new PrintWriter(new FileOutputStream(perf)); // save file
                pw.println("The process time to start server on ip '192.168.43.57' is :"+dT1+" seconds");
             pw.println("The process time to start server on ip '192.168.43.94' is :"+dT2+" seconds");
               pw.println("Server from ip2 responded faster, Database Updated...");
                pw.println("System Performance:");
        for(Method method: operatingSystemMXBean.getClass().getMethods())
        {
            method.setAccessible(true);
            String methodName=method.getName();
            if(methodName.startsWith("get")&&Modifier.isPublic(method.getModifiers())&&OperatingSystemMXBean.class.isAssignableFrom(method.getDeclaringClass())){
                pw.println(methodName.substring(3)+": "+ method.invoke(operatingSystemMXBean));
            }
        }
        pw.close(); 
               
                //response.sendRedirect("view.jsp");
        }
       
    %>
                      
	

	
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