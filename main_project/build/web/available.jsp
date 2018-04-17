<%-- 
    Document   : available
    Created on : Apr 13, 2016, 10:40:07 AM
    Author     : Zeel
--%>


<%@page import="java.util.Random"%>
<%@page import="java.lang.Math.*"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script type="text/javascript">
            var timerStart = Date.now();
        </script>
    </head>
    <body>
        <%
        int req=Integer.parseInt(request.getParameter("res"));
        long startTimes =0;
                      long taskTimeMs=0;
        //out.print(req);
        
   
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_mgmt","root", "");
    Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_mgmt","root", "");
    Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_mgmt","root", "");
    Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_mgmt","root", "");
    Connection con4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_mgmt","root", "");
     Connection con5 = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_mgmt","root", "");
    Statement st = con.createStatement();
    Statement st1 = con1.createStatement();
    Statement st2 = con2.createStatement();
    Statement st3=con3.createStatement();
    Statement st5=con5.createStatement();
    String ip1="null";
    
    String ip2="null";

    ResultSet rs3=st3.executeQuery("select * from tblservices where SID="+req);
     if(rs3.next())
     {
         String status=rs3.getString("status");
         //String status="Yes";
         
          
       ResultSet rs=st.executeQuery("select * from tblservices where SID="+req);
       
      if(rs.next())
    { 
        ResultSet rs2=st2.executeQuery("select * from tblservices where SID="+req);
               if(rs2.next())
            {
                String service_name=rs2.getString("application"); 
               //out.print(cloud_id);
                ResultSet rs1=st1.executeQuery("select * from tblservices where SID="+req);
               
                
                if(rs1.next())
              {
                   String cloud_name=rs1.getString("cloudip");
                    ResultSet rs5=st5.executeQuery("Select * from cloud_ip");
                    if(rs5.next()){
                        ip1=rs5.getString("ip1");
                        ip2=rs5.getString("ip2");
                        
                    }
                    
                 if(service_name.equals("app1"))
                  {  if(status.equals("Yes")&&cloud_name.equals(ip1))
                  {
                  java.util.Date d1= new java.util.Date();
                   DateFormat t1=new SimpleDateFormat("HH:mm:ss a");
                    String time1=t1.format(d1);
                    Random r= new Random();
                    int k=(Math.abs(r.nextInt())%5)+1;
                  
                    startTimes = System.nanoTime( );
                    double sT=(double)startTimes/1000000000;
                     Thread.sleep(k*1000);
                  %>
                  <script type="text/javascript"> 
          var cn1="<%=ip1%>";
           var cnn='Service Available on :';
           var cn=cnn+cn1;
           var d=new Date();
           alert(cn); 
          
           var url='http://'+cn1+'/#';
           
            
               if (window.confirm('proceed?')){
                   
                                       window.location.replace(url);
                     
                  // window.location('http://localhost:8080/bldbank/index.html');
                   
    }   
//               
                  </script> 
                  <% 
                      taskTimeMs  = System.nanoTime( );
                      double tT=(double)taskTimeMs/1000000000;
                  
                        PrintWriter pw = new PrintWriter(new FileOutputStream("C:\\Users\\abhiw\\Desktop\\project\\App1\\performance.txt")); // save file
                        pw.println("The process start time is :"+sT+" seconds");
                        
                       
                         //taskTimeMs=(long)(taskTimeMs* (60*60) % 60);
                        long diffTime=taskTimeMs-startTimes;
                        double dT=(double)diffTime/1000000000;
                        
                        pw.println("The process end time is :"+tT+" seconds");
                        //pw.println("Total Time taken for process execution is:"+diffTime+" nanoseconds");
                        pw.println("The time taken to execute the process is: "+dT+" seconds from ip: '"+ip1+"'");
                        
                             pw.close(); 
                      
                      }
                    else if(status.equals("No")&&cloud_name.equals(ip1)){
                    java.util.Date d1= new java.util.Date();
                    DateFormat t1=new SimpleDateFormat("HH:mm:ss a");
                    String time1=t1.format(d1);
                    Random r= new Random();
                    int k=(Math.abs(r.nextInt())%5)+6;
                   Thread.sleep(k*1000);
                  %>
                  <script type="text/javascript"> 
          var cn1="<%=ip2%>";
           var cnn='Service Available on :';
           var cn=cnn+cn1;
           var d=new Date();
           alert(cn); 
          
           var url='http://'+cn1+'/#';
           
               if (window.confirm('proceed?')){
                    
                    window.location.replace(url);
  }   
   
                  </script> 
                  <% 
                      java.util.Date d2= new java.util.Date();
                       DateFormat t2=new SimpleDateFormat("HH:mm:ss a");
                      String time2=t2.format(d2);
                        PrintWriter pw = new PrintWriter(new FileOutputStream("C:\\Users\\abhiw\\Desktop\\project\\App1\\performance.txt")); // save file
                        pw.println("The process start time is :"+time1);
                        
                        pw.println("The process end time is :"+time2);
                        pw.println("The time taken to execute the process is: "+k+" miliseconds from ip: '"+ip2+"'");
                        
                             pw.close(); 
                      
                      }
                    else   if(status.equals("Yes")&&cloud_name.equals(ip2))
                  {
                  java.util.Date d1= new java.util.Date();
                   DateFormat t1=new SimpleDateFormat("HH:mm:ss a");
                    String time1=t1.format(d1);
                    Random r= new Random();
                    int k=(Math.abs(r.nextInt())%5)+1;
                  
                    startTimes = System.nanoTime( );
                    double sT=(double)startTimes/1000000000;
                     Thread.sleep(k*1000);
                  %>
                  <script type="text/javascript"> 
          var cn1="<%=ip2%>";
           var cnn='Service Available on :';
           var cn=cnn+cn1;
           var d=new Date();
           alert(cn); 
          
           var url='http://'+cn1+'/#';
           
            
               if (window.confirm('proceed?')){
                   
                                       window.location.replace(url);
                     
                  // window.location('http://localhost:8080/bldbank/index.html');
                   
    }   
//               
                  </script> 
                  <% 
                      taskTimeMs  = System.nanoTime( );
                      double tT=(double)taskTimeMs/1000000000;
                   
                       PrintWriter pw = new PrintWriter(new FileOutputStream("C:\\Users\\abhiw\\Desktop\\project\\App1\\performance.txt")); // save file
                        pw.println("The process start time is :"+sT+" seconds");
                        
                       
                         //taskTimeMs=(long)(taskTimeMs* (60*60) % 60);
                        long diffTime=taskTimeMs-startTimes;
                        double dT=(double)diffTime/1000000000;
                        
                        pw.println("The process end time is :"+tT+" seconds");
                        //pw.println("Total Time taken for process execution is:"+diffTime+" nanoseconds");
                        pw.println("The time taken to execute the process is: "+dT+" seconds from ip: '"+ip2+"'");
                        
                             pw.close(); 
                      
                      }
                 else     if(status.equals("No")&&cloud_name.equals(ip2))
                  {
                  java.util.Date d1= new java.util.Date();
                   DateFormat t1=new SimpleDateFormat("HH:mm:ss a");
                    String time1=t1.format(d1);
                    Random r= new Random();
                    int k=(Math.abs(r.nextInt())%5)+1;
                  
                    startTimes = System.nanoTime( );
                    double sT=(double)startTimes/1000000000;
                     Thread.sleep(k*1000);
                  %>
                  <script type="text/javascript"> 
          var cn1="<%=ip1%>";
           var cnn='Service Available on :';
           var cn=cnn+cn1;
           var d=new Date();
           alert(cn); 
          
           var url='http://'+cn1+'/#';
           
            
               if (window.confirm('proceed?')){
                   
                                       window.location.replace(url);
                     
                  // window.location('http://localhost:8080/bldbank/index.html');
                   
    }   
//               
                  </script> 
                  <% 
                      taskTimeMs  = System.nanoTime( );
                      double tT=(double)taskTimeMs/1000000000;
                    //  java.util.Date d2= new java.util.Date();
                     
                      // DateFormat t2=new SimpleDateFormat("HH:mm:ss a");
                      //String time2=t2.format(d2);
                      
                      //startTimes=(long)(startTimes* (60*60) % 60);
                        PrintWriter pw = new PrintWriter(new FileOutputStream("C:\\Users\\abhiw\\Desktop\\project\\App1\\performance.txt")); // save file
                        pw.println("The process start time is :"+sT+" seconds");
                        
                       
                         //taskTimeMs=(long)(taskTimeMs* (60*60) % 60);
                        long diffTime=taskTimeMs-startTimes;
                        double dT=(double)diffTime/1000000000;
                        
                        pw.println("The process end time is :"+tT+" seconds");
                        //pw.println("Total Time taken for process execution is:"+diffTime+" nanoseconds");
                        pw.println("The time taken to execute the process is: "+dT+" seconds from ip: '"+ip1+"'");
                        
                             pw.close(); 
                      
                      }
                    
}
                     
                else if(service_name.equals("app2"))
                  {  
                    if(status.equals("Yes")&&cloud_name.equals(ip1))
                  {
                  java.util.Date d1= new java.util.Date();
                   
                    Random r= new Random();
                    int k=(Math.abs(r.nextInt())%5)+1;
                  
                    startTimes = System.nanoTime( );
                    double sT=(double)startTimes/1000000000;
                     Thread.sleep(k*1000);
                  %>
                  <script type="text/javascript"> 
          var cn1="<%=ip1%>";
           var cnn='Service Available on :';
           var cn=cnn+cn1;
          
           alert(cn); 
          
           var url='http://'+cn1+'/#';
           
            
               if (window.confirm('proceed?')){
                   
                                       window.location.replace(url);
                     
                  // window.location('http://localhost:8080/bldbank/index.html');
                   
    }   
//               
                  </script> 
                  <% 
                      taskTimeMs  = System.nanoTime( );
                      double tT=(double)taskTimeMs/1000000000;
                  
                        PrintWriter pw = new PrintWriter(new FileOutputStream("C:\\Users\\abhiw\\Desktop\\project\\App2\\performance.txt")); // save file
                        pw.println("The process start time is :"+sT+" seconds");
                        
                       
                         //taskTimeMs=(long)(taskTimeMs* (60*60) % 60);
                        long diffTime=taskTimeMs-startTimes;
                        double dT=(double)diffTime/1000000000;
                        
                        pw.println("The process end time is :"+tT+" seconds");
                        //pw.println("Total Time taken for process execution is:"+diffTime+" nanoseconds");
                        pw.println("The time taken to execute the process is: "+dT+" seconds from ip: '"+ip1+"'");
                        
                             pw.close(); 
                      
                      }
                    else if(status.equals("No")&&cloud_name.equals(ip1)){
                    java.util.Date d1= new java.util.Date();
                    DateFormat t1=new SimpleDateFormat("HH:mm:ss a");
                    String time1=t1.format(d1);
                    Random r= new Random();
                    int k=(Math.abs(r.nextInt())%5)+6;
                   Thread.sleep(k*1000);
                  %>
                  <script type="text/javascript"> 
          var cn1="<%=ip2%>";
           var cnn='Service Available on :';
           var cn=cnn+cn1;
           var d=new Date();
           alert(cn); 
          
           var url='http://'+cn1+'/#';
           
               if (window.confirm('proceed?')){
                    
                    window.location.replace(url);
  }   
   
                  </script> 
                  <% 
                      java.util.Date d2= new java.util.Date();
                       DateFormat t2=new SimpleDateFormat("HH:mm:ss a");
                      String time2=t2.format(d2);
                        PrintWriter pw = new PrintWriter(new FileOutputStream("C:\\Users\\abhiw\\Desktop\\project\\App2\\performance.txt")); // save file
                        pw.println("The process start time is :"+time1);
                        
                        pw.println("The process end time is :"+time2);
                        pw.println("The time taken to execute the process is: "+k+" miliseconds from ip: '"+ip2+"'");
                        
                             pw.close(); 
                      
                      }
                    else   if(status.equals("Yes")&&cloud_name.equals(ip2))
                  {
                  java.util.Date d1= new java.util.Date();
                   DateFormat t1=new SimpleDateFormat("HH:mm:ss a");
                    String time1=t1.format(d1);
                    Random r= new Random();
                    int k=(Math.abs(r.nextInt())%5)+1;
                  
                    startTimes = System.nanoTime( );
                    double sT=(double)startTimes/1000000000;
                     Thread.sleep(k*1000);
                  %>
                  <script type="text/javascript"> 
          var cn1="<%=ip2%>";
           var cnn='Service Available on :';
           var cn=cnn+cn1;
           var d=new Date();
           alert(cn); 
          
           var url='http://'+cn1+'/#';
           
            
               if (window.confirm('proceed?')){
                   
                                       window.location.replace(url);
                     
                  // window.location('http://localhost:8080/bldbank/index.html');
                   
    }   
//               
                  </script> 
                  <% 
                      taskTimeMs  = System.nanoTime( );
                      double tT=(double)taskTimeMs/1000000000;
                    //  java.util.Date d2= new java.util.Date();
                     
                      // DateFormat t2=new SimpleDateFormat("HH:mm:ss a");
                      //String time2=t2.format(d2);
                      
                      //startTimes=(long)(startTimes* (60*60) % 60);
                       PrintWriter pw = new PrintWriter(new FileOutputStream("C:\\Users\\abhiw\\Desktop\\project\\App2\\performance.txt")); // save file
                        pw.println("The process start time is :"+sT+" seconds");
                        
                       
                         //taskTimeMs=(long)(taskTimeMs* (60*60) % 60);
                        long diffTime=taskTimeMs-startTimes;
                        double dT=(double)diffTime/1000000000;
                        
                        pw.println("The process end time is :"+tT+" seconds");
                        //pw.println("Total Time taken for process execution is:"+diffTime+" nanoseconds");
                        pw.println("The time taken to execute the process is: "+dT+" seconds from ip: '"+ip2+"'");
                        
                             pw.close(); 
                      
                      }
                 else     if(status.equals("No")&&cloud_name.equals(ip2))
                  {
                  java.util.Date d1= new java.util.Date();
                   DateFormat t1=new SimpleDateFormat("HH:mm:ss a");
                    String time1=t1.format(d1);
                    Random r= new Random();
                    int k=(Math.abs(r.nextInt())%5)+1;
                  
                    startTimes = System.nanoTime( );
                    double sT=(double)startTimes/1000000000;
                     Thread.sleep(k*1000);
                  %>
                  <script type="text/javascript"> 
          var cn1="<%=ip1%>";
           var cnn='Service Available on :';
           var cn=cnn+cn1;
           var d=new Date();
           alert(cn); 
          
           var url='http://'+cn1+'/#';
           
            
               if (window.confirm('proceed?')){
                   
                                       window.location.replace(url);
                     
                  // window.location('http://localhost:8080/bldbank/index.html');
                   
    }   
//               
                  </script> 
                  <% 
                      taskTimeMs  = System.nanoTime( );
                      double tT=(double)taskTimeMs/1000000000;
                    //  java.util.Date d2= new java.util.Date();
                     
                      // DateFormat t2=new SimpleDateFormat("HH:mm:ss a");
                      //String time2=t2.format(d2);
                      
                      //startTimes=(long)(startTimes* (60*60) % 60);
                        PrintWriter pw = new PrintWriter(new FileOutputStream("C:\\Users\\abhiw\\Desktop\\project\\App2\\performance.txt")); // save file
                        pw.println("The process start time is :"+sT+" seconds");
                        
                       
                         //taskTimeMs=(long)(taskTimeMs* (60*60) % 60);
                        long diffTime=taskTimeMs-startTimes;
                        double dT=(double)diffTime/1000000000;
                        
                        pw.println("The process end time is :"+tT+" seconds");
                        //pw.println("Total Time taken for process execution is:"+diffTime+" nanoseconds");
                        pw.println("The time taken to execute the process is: "+dT+" seconds from ip: '"+ip1+"'");
                        
                             pw.close(); 
                      
                      }
                    
}    
                  else if(service_name.equals("app3"))
                  {  if(status.equals("Yes")&&cloud_name.equals(ip1))
                  {
                  java.util.Date d1= new java.util.Date();
                   DateFormat t1=new SimpleDateFormat("HH:mm:ss a");
                    String time1=t1.format(d1);
                    Random r= new Random();
                    int k=(Math.abs(r.nextInt())%5)+1;
                  
                    startTimes = System.nanoTime( );
                    double sT=(double)startTimes/1000000000;
                     Thread.sleep(k*1000);
                  %>
                  <script type="text/javascript"> 
          var cn1="<%=ip1%>";
           var cnn='Service Available on :';
           var cn=cnn+cn1;
           var d=new Date();
           alert(cn); 
          
           var url='http://'+cn1+'/#';
           
            
               if (window.confirm('proceed?')){
                   
                                       window.location.replace(url);
                     
                  // window.location('http://localhost:8080/bldbank/index.html');
                   
    }   
//               
                  </script> 
                  <% 
                      taskTimeMs  = System.nanoTime( );
                      double tT=(double)taskTimeMs/1000000000;
                  
                        PrintWriter pw = new PrintWriter(new FileOutputStream("C:\\Users\\abhiw\\Desktop\\project\\App3\\performance.txt")); // save file
                        pw.println("The process start time is :"+sT+" seconds");
                        
                       
                         //taskTimeMs=(long)(taskTimeMs* (60*60) % 60);
                        long diffTime=taskTimeMs-startTimes;
                        double dT=(double)diffTime/1000000000;
                        
                        pw.println("The process end time is :"+tT+" seconds");
                        //pw.println("Total Time taken for process execution is:"+diffTime+" nanoseconds");
                        pw.println("The time taken to execute the process is: "+dT+" seconds from ip: '"+ip1+"'");
                        
                             pw.close(); 
                      
                      }
                    else if(status.equals("No")&&cloud_name.equals(ip1)){
                    java.util.Date d1= new java.util.Date();
                    DateFormat t1=new SimpleDateFormat("HH:mm:ss a");
                    String time1=t1.format(d1);
                    Random r= new Random();
                    int k=(Math.abs(r.nextInt())%5)+6;
                   Thread.sleep(k*1000);
                  %>
                  <script type="text/javascript"> 
          var cn1="<%=ip2%>";
           var cnn='Service Available on :';
           var cn=cnn+cn1;
           var d=new Date();
           alert(cn); 
          
           var url='http://'+cn1+'/#';
           
               if (window.confirm('proceed?')){
                    
                    window.location.replace(url);
  }   
   
                  </script> 
                  <% 
                      java.util.Date d2= new java.util.Date();
                       DateFormat t2=new SimpleDateFormat("HH:mm:ss a");
                      String time2=t2.format(d2);
                        PrintWriter pw = new PrintWriter(new FileOutputStream("C:\\Users\\abhiw\\Desktop\\project\\App3\\performance.txt")); // save file
                        pw.println("The process start time is :"+time1);
                        
                        pw.println("The process end time is :"+time2);
                        pw.println("The time taken to execute the process is: "+k+" miliseconds from ip: '"+ip2+"'");
                        
                             pw.close(); 
                      
                      }
                    else   if(status.equals("Yes")&&cloud_name.equals(ip2))
                  {
                  java.util.Date d1= new java.util.Date();
                   DateFormat t1=new SimpleDateFormat("HH:mm:ss a");
                    String time1=t1.format(d1);
                    Random r= new Random();
                    int k=(Math.abs(r.nextInt())%5)+1;
                  
                    startTimes = System.nanoTime( );
                    double sT=(double)startTimes/1000000000;
                     Thread.sleep(k*1000);
                  %>
                  <script type="text/javascript"> 
          var cn1="<%=ip2%>";
           var cnn='Service Available on :';
           var cn=cnn+cn1;
           var d=new Date();
           alert(cn); 
          
           var url='http://'+cn1+'/#';
           
            
               if (window.confirm('proceed?')){
                   
                                       window.location.replace(url);
                     
                  // window.location('http://localhost:8080/bldbank/index.html');
                   
    }   
//               
                  </script> 
                  <% 
                      taskTimeMs  = System.nanoTime( );
                      double tT=(double)taskTimeMs/1000000000;
                    //  java.util.Date d2= new java.util.Date();
                     
                      // DateFormat t2=new SimpleDateFormat("HH:mm:ss a");
                      //String time2=t2.format(d2);
                      
                      //startTimes=(long)(startTimes* (60*60) % 60);
                       PrintWriter pw = new PrintWriter(new FileOutputStream("C:\\Users\\abhiw\\Desktop\\project\\App3\\performance.txt")); // save file
                        pw.println("The process start time is :"+sT+" seconds");
                        
                       
                         //taskTimeMs=(long)(taskTimeMs* (60*60) % 60);
                        long diffTime=taskTimeMs-startTimes;
                        double dT=(double)diffTime/1000000000;
                        
                        pw.println("The process end time is :"+tT+" seconds");
                        //pw.println("Total Time taken for process execution is:"+diffTime+" nanoseconds");
                        pw.println("The time taken to execute the process is: "+dT+" seconds from ip: '"+ip2+"'");
                        
                             pw.close(); 
                      
                      }
                 else     if(status.equals("No")&&cloud_name.equals(ip2))
                  {
                  java.util.Date d1= new java.util.Date();
                   DateFormat t1=new SimpleDateFormat("HH:mm:ss a");
                    String time1=t1.format(d1);
                    Random r= new Random();
                    int k=(Math.abs(r.nextInt())%5)+1;
                  
                    startTimes = System.nanoTime( );
                    double sT=(double)startTimes/1000000000;
                     Thread.sleep(k*1000);
                  %>
                  <script type="text/javascript"> 
          var cn1="<%=ip1%>";
           var cnn='Service Available on :';
           var cn=cnn+cn1;
           var d=new Date();
           alert(cn); 
          
           var url='http://'+cn1+'/#';
           
            
               if (window.confirm('proceed?')){
                   
                                       window.location.replace(url);
                     
                  // window.location('http://localhost:8080/bldbank/index.html');
                   
    }   
//               
                  </script> 
                  <% 
                      taskTimeMs  = System.nanoTime( );
                      double tT=(double)taskTimeMs/1000000000;
                    //  java.util.Date d2= new java.util.Date();
                     
                      // DateFormat t2=new SimpleDateFormat("HH:mm:ss a");
                      //String time2=t2.format(d2);
                      
                      //startTimes=(long)(startTimes* (60*60) % 60);
                        PrintWriter pw = new PrintWriter(new FileOutputStream("C:\\Users\\abhiw\\Desktop\\project\\App3\\performance.txt")); // save file
                        pw.println("The process start time is :"+sT+" seconds");
                        
                       
                         //taskTimeMs=(long)(taskTimeMs* (60*60) % 60);
                        long diffTime=taskTimeMs-startTimes;
                        double dT=(double)diffTime/1000000000;
                        
                        pw.println("The process end time is :"+tT+" seconds");
                        //pw.println("Total Time taken for process execution is:"+diffTime+" nanoseconds");
                        pw.println("The time taken to execute the process is: "+dT+" seconds from ip: '"+ip1+"'");
                        
                             pw.close(); 
                      
                      }
                    
}
                else if(service_name.equals("app4"))
                  {  if(status.equals("Yes")&&cloud_name.equals(ip1))
                  {
                  java.util.Date d1= new java.util.Date();
                   DateFormat t1=new SimpleDateFormat("HH:mm:ss a");
                    String time1=t1.format(d1);
                    Random r= new Random();
                    int k=(Math.abs(r.nextInt())%5)+1;
                  
                    startTimes = System.nanoTime( );
                    double sT=(double)startTimes/1000000000;
                     Thread.sleep(k*1000);
                  %>
                  <script type="text/javascript"> 
          var cn1="<%=ip1%>";
           var cnn='Service Available on :';
           var cn=cnn+cn1;
           var d=new Date();
           alert(cn); 
          
           var url='http://'+cn1+'/#';
           
            
               if (window.confirm('proceed?')){
                   
                                       window.location.replace(url);
                     
                  // window.location('http://localhost:8080/bldbank/index.html');
                   
    }   
//               
                  </script> 
                  <% 
                      taskTimeMs  = System.nanoTime( );
                      double tT=(double)taskTimeMs/1000000000;
                  
                        PrintWriter pw = new PrintWriter(new FileOutputStream("C:\\Users\\abhiw\\Desktop\\project\\App4\\performance.txt")); // save file
                        pw.println("The process start time is :"+sT+" seconds");
                        
                       
                         //taskTimeMs=(long)(taskTimeMs* (60*60) % 60);
                        long diffTime=taskTimeMs-startTimes;
                        double dT=(double)diffTime/1000000000;
                        
                        pw.println("The process end time is :"+tT+" seconds");
                        //pw.println("Total Time taken for process execution is:"+diffTime+" nanoseconds");
                        pw.println("The time taken to execute the process is: "+dT+" seconds from ip: '"+ip1+"'");
                        
                             pw.close(); 
                      
                      }
                    else if(status.equals("No")&&cloud_name.equals(ip1)){
                    java.util.Date d1= new java.util.Date();
                    DateFormat t1=new SimpleDateFormat("HH:mm:ss a");
                    String time1=t1.format(d1);
                    Random r= new Random();
                    int k=(Math.abs(r.nextInt())%5)+6;
                   Thread.sleep(k*1000);
                  %>
                  <script type="text/javascript"> 
          var cn1="<%=ip2%>";
           var cnn='Service Available on :';
           var cn=cnn+cn1;
           var d=new Date();
           alert(cn); 
          
           var url='http://'+cn1+'/#';
           
               if (window.confirm('proceed?')){
                    
                    window.location.replace(url);
  }   
   
                  </script> 
                  <% 
                      java.util.Date d2= new java.util.Date();
                       DateFormat t2=new SimpleDateFormat("HH:mm:ss a");
                      String time2=t2.format(d2);
                        PrintWriter pw = new PrintWriter(new FileOutputStream("C:\\Users\\abhiw\\Desktop\\project\\App4\\performance.txt")); // save file
                        pw.println("The process start time is :"+time1);
                        
                        pw.println("The process end time is :"+time2);
                        pw.println("The time taken to execute the process is: "+k+" miliseconds from ip: '"+ip2+"'");
                        
                             pw.close(); 
                      
                      }
                    else   if(status.equals("Yes")&&cloud_name.equals(ip2))
                  {
                  java.util.Date d1= new java.util.Date();
                   DateFormat t1=new SimpleDateFormat("HH:mm:ss a");
                    String time1=t1.format(d1);
                    Random r= new Random();
                    int k=(Math.abs(r.nextInt())%5)+1;
                  
                    startTimes = System.nanoTime( );
                    double sT=(double)startTimes/1000000000;
                     Thread.sleep(k*1000);
                  %>
                  <script type="text/javascript"> 
          var cn1="<%=ip2%>";
           var cnn='Service Available on :';
           var cn=cnn+cn1;
           var d=new Date();
           alert(cn); 
          
           var url='http://'+cn1+'/#';
           
            
               if (window.confirm('proceed?')){
                   
                                       window.location.replace(url);
                     
                  // window.location('http://localhost:8080/bldbank/index.html');
                   
    }   
//               
                  </script> 
                  <% 
                      taskTimeMs  = System.nanoTime( );
                      double tT=(double)taskTimeMs/1000000000;
                   
                       PrintWriter pw = new PrintWriter(new FileOutputStream("C:\\Users\\abhiw\\Desktop\\project\\App4\\performance.txt")); // save file
                        pw.println("The process start time is :"+sT+" seconds");
                        
                       
                         //taskTimeMs=(long)(taskTimeMs* (60*60) % 60);
                        long diffTime=taskTimeMs-startTimes;
                        double dT=(double)diffTime/1000000000;
                        
                        pw.println("The process end time is :"+tT+" seconds");
                        //pw.println("Total Time taken for process execution is:"+diffTime+" nanoseconds");
                        pw.println("The time taken to execute the process is: "+dT+" seconds from ip: '"+ip2+"'");
                        
                             pw.close(); 
                      
                      }
                 else     if(status.equals("No")&&cloud_name.equals(ip2))
                  {
                  java.util.Date d1= new java.util.Date();
                   DateFormat t1=new SimpleDateFormat("HH:mm:ss a");
                    String time1=t1.format(d1);
                    Random r= new Random();
                    int k=(Math.abs(r.nextInt())%5)+1;
                  
                    startTimes = System.nanoTime( );
                    double sT=(double)startTimes/1000000000;
                     Thread.sleep(k*1000);
                  %>
                  <script type="text/javascript"> 
          var cn1="<%=ip1%>";
           var cnn='Service Available on :';
           var cn=cnn+cn1;
           var d=new Date();
           alert(cn); 
          
           var url='http://'+cn1+'/#';
           
            
               if (window.confirm('proceed?')){
                   
                                       window.location.replace(url);
                     
                  // window.location('http://localhost:8080/bldbank/index.html');
                   
    }   
//               
                  </script> 
                  <% 
                      taskTimeMs  = System.nanoTime( );
                      double tT=(double)taskTimeMs/1000000000;
                    
                        PrintWriter pw = new PrintWriter(new FileOutputStream("C:\\Users\\abhiw\\Desktop\\project\\App4\\performance.txt")); // save file
                        pw.println("The process start time is :"+sT+" seconds");
                        
                       
                         //taskTimeMs=(long)(taskTimeMs* (60*60) % 60);
                        long diffTime=taskTimeMs-startTimes;
                        double dT=(double)diffTime/1000000000;
                        
                        pw.println("The process end time is :"+tT+" seconds");
                        //pw.println("Total Time taken for process execution is:"+diffTime+" nanoseconds");
                        pw.println("The time taken to execute the process is: "+dT+" seconds from ip: '"+ip1+"'");
                        
                             pw.close(); 
                      
                      }
                    
}
            else if(service_name.equals("app5"))
                  {  if(status.equals("Yes")&&cloud_name.equals(ip1))
                  {
                  java.util.Date d1= new java.util.Date();
                   DateFormat t1=new SimpleDateFormat("HH:mm:ss a");
                    String time1=t1.format(d1);
                    Random r= new Random();
                    int k=(Math.abs(r.nextInt())%5)+1;
                  
                    startTimes = System.nanoTime( );
                    double sT=(double)startTimes/1000000000;
                     Thread.sleep(k*1000);
                  %>
                  <script type="text/javascript"> 
          var cn1="<%=ip1%>";
           var cnn='Service Available on :';
           var cn=cnn+cn1;
           var d=new Date();
           alert(cn); 
          
           var url='http://'+cn1+'/#';
           
            
               if (window.confirm('proceed?')){
                   
                                       window.location.replace(url);
                     
                  // window.location('http://localhost:8080/bldbank/index.html');
                   
    }   
//               
                  </script> 
                  <% 
                      taskTimeMs  = System.nanoTime( );
                      double tT=(double)taskTimeMs/1000000000;
                  
                        PrintWriter pw = new PrintWriter(new FileOutputStream("C:\\Users\\abhiw\\Desktop\\project\\App5\\performance.txt")); // save file
                        pw.println("The process start time is :"+sT+" seconds");
                        
                       
                         //taskTimeMs=(long)(taskTimeMs* (60*60) % 60);
                        long diffTime=taskTimeMs-startTimes;
                        double dT=(double)diffTime/1000000000;
                        
                        pw.println("The process end time is :"+tT+" seconds");
                        //pw.println("Total Time taken for process execution is:"+diffTime+" nanoseconds");
                        pw.println("The time taken to execute the process is: "+dT+" seconds from ip: '"+ip1+"'");
                        
                             pw.close(); 
                      
                      }
                    else if(status.equals("No")&&cloud_name.equals(ip1)){
                    java.util.Date d1= new java.util.Date();
                    DateFormat t1=new SimpleDateFormat("HH:mm:ss a");
                    String time1=t1.format(d1);
                    Random r= new Random();
                    int k=(Math.abs(r.nextInt())%5)+6;
                   Thread.sleep(k*1000);
                  %>
                  <script type="text/javascript"> 
          var cn1="<%=ip2%>";
           var cnn='Service Available on :';
           var cn=cnn+cn1;
           var d=new Date();
           alert(cn); 
          
           var url='http://'+cn1+'/#';
           
               if (window.confirm('proceed?')){
                    
                    window.location.replace(url);
  }   
   
                  </script> 
                  <% 
                      java.util.Date d2= new java.util.Date();
                       DateFormat t2=new SimpleDateFormat("HH:mm:ss a");
                      String time2=t2.format(d2);
                        PrintWriter pw = new PrintWriter(new FileOutputStream("C:\\Users\\abhiw\\Desktop\\project\\App5\\performance.txt")); // save file
                        pw.println("The process start time is :"+time1);
                        
                        pw.println("The process end time is :"+time2);
                        pw.println("The time taken to execute the process is: "+k+" miliseconds from ip: '"+ip2+"'");
                        
                             pw.close(); 
                      
                      }
                    else   if(status.equals("Yes")&&cloud_name.equals(ip2))
                  {
                  java.util.Date d1= new java.util.Date();
                   DateFormat t1=new SimpleDateFormat("HH:mm:ss a");
                    String time1=t1.format(d1);
                    Random r= new Random();
                    int k=(Math.abs(r.nextInt())%5)+1;
                  
                    startTimes = System.nanoTime( );
                    double sT=(double)startTimes/1000000000;
                     Thread.sleep(k*1000);
                  %>
                  <script type="text/javascript"> 
          var cn1="<%=ip2%>";
           var cnn='Service Available on :';
           var cn=cnn+cn1;
           var d=new Date();
           alert(cn); 
          
           var url='http://'+cn1+'/#';
           
            
               if (window.confirm('proceed?')){
                   
                                       window.location.replace(url);
                     
                  // window.location('http://localhost:8080/bldbank/index.html');
                   
    }   
//               
                  </script> 
                  <% 
                      taskTimeMs  = System.nanoTime( );
                      double tT=(double)taskTimeMs/1000000000;
                   
                       PrintWriter pw = new PrintWriter(new FileOutputStream("C:\\Users\\abhiw\\Desktop\\project\\App5\\performance.txt")); // save file
                        pw.println("The process start time is :"+sT+" seconds");
                        
                       
                         //taskTimeMs=(long)(taskTimeMs* (60*60) % 60);
                        long diffTime=taskTimeMs-startTimes;
                        double dT=(double)diffTime/1000000000;
                        
                        pw.println("The process end time is :"+tT+" seconds");
                        //pw.println("Total Time taken for process execution is:"+diffTime+" nanoseconds");
                        pw.println("The time taken to execute the process is: "+dT+" seconds from ip: '"+ip2+"'");
                        
                             pw.close(); 
                      
                      }
                 else     if(status.equals("No")&&cloud_name.equals(ip2))
                  {
                  java.util.Date d1= new java.util.Date();
                   DateFormat t1=new SimpleDateFormat("HH:mm:ss a");
                    String time1=t1.format(d1);
                    Random r= new Random();
                    int k=(Math.abs(r.nextInt())%5)+1;
                  
                    startTimes = System.nanoTime( );
                    double sT=(double)startTimes/1000000000;
                     Thread.sleep(k*1000);
                  %>
                  <script type="text/javascript"> 
          var cn1="<%=ip1%>";
           var cnn='Service Available on :';
           var cn=cnn+cn1;
           var d=new Date();
           alert(cn); 
          
           var url='http://'+cn1+'/#';
           
            
               if (window.confirm('proceed?')){
                   
                                       window.location.replace(url);
                     
                  // window.location('http://localhost:8080/bldbank/index.html');
                   
    }   
//               
                  </script> 
                  <% 
                      taskTimeMs  = System.nanoTime( );
                      double tT=(double)taskTimeMs/1000000000;
                  
                        PrintWriter pw = new PrintWriter(new FileOutputStream("C:\\Users\\abhiw\\Desktop\\project\\App5\\performance.txt")); // save file
                        pw.println("The process start time is :"+sT+" seconds");
                        
                       
                         //taskTimeMs=(long)(taskTimeMs* (60*60) % 60);
                        long diffTime=taskTimeMs-startTimes;
                        double dT=(double)diffTime/1000000000;
                        
                        pw.println("The process end time is :"+tT+" seconds");
                        //pw.println("Total Time taken for process execution is:"+diffTime+" nanoseconds");
                        pw.println("The time taken to execute the process is: "+dT+" seconds from ip: '"+ip1+"'");
                        
                             pw.close(); 
                      
                      }
                    
}
        else if(service_name.equals("app6"))
                  {  if(status.equals("Yes")&&cloud_name.equals(ip1))
                  {
                 
                    Random r= new Random();
                    int k=(Math.abs(r.nextInt())%5)+1;
                  
                    startTimes = System.nanoTime( );
                    double sT=(double)startTimes/1000000000;
                     Thread.sleep(k*1000);
                  %>
                  <script type="text/javascript"> 
          var cn1="<%=ip1%>";
           var cnn='Service Available on :';
           var cn=cnn+cn1;
           var d=new Date();
           alert(cn); 
          
           var url='http://'+cn1+'/#';
           
            
               if (window.confirm('proceed?')){
                   
                                       window.location.replace(url);
                     
                  // window.location('http://localhost:8080/bldbank/index.html');
                   
    }   
//               
                  </script> 
                  <% 
                      taskTimeMs  = System.nanoTime( );
                      double tT=(double)taskTimeMs/1000000000;
                  
                        PrintWriter pw = new PrintWriter(new FileOutputStream("C:\\Users\\abhiw\\Desktop\\project\\App6\\performance.txt")); // save file
                        pw.println("The process start time is :"+sT+" seconds");
                        
                       
                         //taskTimeMs=(long)(taskTimeMs* (60*60) % 60);
                        long diffTime=taskTimeMs-startTimes;
                        double dT=(double)diffTime/1000000000;
                        
                        pw.println("The process end time is :"+tT+" seconds");
                        //pw.println("Total Time taken for process execution is:"+diffTime+" nanoseconds");
                        pw.println("The time taken to execute the process is: "+dT+" seconds from ip: '"+ip1+"'");
                        
                             pw.close(); 
                      
                      }
                    else if(status.equals("No")&&cloud_name.equals(ip1)){
                    java.util.Date d1= new java.util.Date();
                    DateFormat t1=new SimpleDateFormat("HH:mm:ss a");
                    String time1=t1.format(d1);
                    Random r= new Random();
                    int k=(Math.abs(r.nextInt())%5)+6;
                   Thread.sleep(k*1000);
                  %>
                  <script type="text/javascript"> 
          var cn1="<%=ip2%>";
           var cnn='Service Available on :';
           var cn=cnn+cn1;
           var d=new Date();
           alert(cn); 
          
           var url='http://'+cn1+'/#';
           
               if (window.confirm('proceed?')){
                    
                    window.location.replace(url);
  }   
   
                  </script> 
                  <% 
                      java.util.Date d2= new java.util.Date();
                       DateFormat t2=new SimpleDateFormat("HH:mm:ss a");
                      String time2=t2.format(d2);
                        PrintWriter pw = new PrintWriter(new FileOutputStream("C:\\Users\\abhiw\\Desktop\\project\\App6\\performance.txt")); // save file
                        pw.println("The process start time is :"+time1);
                        
                        pw.println("The process end time is :"+time2);
                        pw.println("The time taken to execute the process is: "+k+" miliseconds from ip: '"+ip2+"'");
                        
                             pw.close(); 
                      
                      }
                    else   if(status.equals("Yes")&&cloud_name.equals(ip2))
                  {
                  java.util.Date d1= new java.util.Date();
                   DateFormat t1=new SimpleDateFormat("HH:mm:ss a");
                    String time1=t1.format(d1);
                    Random r= new Random();
                    int k=(Math.abs(r.nextInt())%5)+1;
                  
                    startTimes = System.nanoTime( );
                    double sT=(double)startTimes/1000000000;
                     Thread.sleep(k*1000);
                  %>
                  <script type="text/javascript"> 
          var cn1="<%=ip2%>";
           var cnn='Service Available on :';
           var cn=cnn+cn1;
           var d=new Date();
           alert(cn); 
          
           var url='http://'+cn1+'/#';
           
            
               if (window.confirm('proceed?')){
                   
                                       window.location.replace(url);
                     
                  // window.location('http://localhost:8080/bldbank/index.html');
                   
    }   
//               
                  </script> 
                  <% 
                      taskTimeMs  = System.nanoTime( );
                      double tT=(double)taskTimeMs/1000000000;
                   
                       PrintWriter pw = new PrintWriter(new FileOutputStream("C:\\Users\\abhiw\\Desktop\\project\\App6\\performance.txt")); // save file
                        pw.println("The process start time is :"+sT+" seconds");
                        
                       
                         //taskTimeMs=(long)(taskTimeMs* (60*60) % 60);
                        long diffTime=taskTimeMs-startTimes;
                        double dT=(double)diffTime/1000000000;
                        
                        pw.println("The process end time is :"+tT+" seconds");
                        //pw.println("Total Time taken for process execution is:"+diffTime+" nanoseconds");
                        pw.println("The time taken to execute the process is: "+dT+" seconds from ip: '"+ip2+"'");
                        
                             pw.close(); 
                      
                      }
                 else     if(status.equals("No")&&cloud_name.equals(ip2))
                  {
                  java.util.Date d1= new java.util.Date();
                   DateFormat t1=new SimpleDateFormat("HH:mm:ss a");
                    String time1=t1.format(d1);
                    Random r= new Random();
                    int k=(Math.abs(r.nextInt())%5)+1;
                  
                    startTimes = System.nanoTime( );
                    double sT=(double)startTimes/1000000000;
                     Thread.sleep(k*1000);
                  %>
                  <script type="text/javascript"> 
          var cn1="<%=ip1%>";
           var cnn='Service Available on :';
           var cn=cnn+cn1;
           var d=new Date();
           alert(cn); 
          
           var url='http://'+cn1+'/#';
           
            
               if (window.confirm('proceed?')){
                   
                                       window.location.replace(url);
                     
                  // window.location('http://localhost:8080/bldbank/index.html');
                   
    }   
//               
                  </script> 
                  <% 
                      taskTimeMs  = System.nanoTime( );
                      double tT=(double)taskTimeMs/1000000000;
                    //  java.util.Date d2= new java.util.Date();
                     
                      // DateFormat t2=new SimpleDateFormat("HH:mm:ss a");
                      //String time2=t2.format(d2);
                      
                      //startTimes=(long)(startTimes* (60*60) % 60);
                        PrintWriter pw = new PrintWriter(new FileOutputStream("C:\\Users\\abhiw\\Desktop\\project\\App6\\performance.txt")); // save file
                        pw.println("The process start time is :"+sT+" seconds");
                        
                       
                         //taskTimeMs=(long)(taskTimeMs* (60*60) % 60);
                        long diffTime=taskTimeMs-startTimes;
                        double dT=(double)diffTime/1000000000;
                        
                        pw.println("The process end time is :"+tT+" seconds");
                        //pw.println("Total Time taken for process execution is:"+diffTime+" nanoseconds");
                        pw.println("The time taken to execute the process is: "+dT+" seconds from ip: '"+ip1+"'");
                        
                             pw.close(); 
                      
                      }
                    
}
else{
    out.println("No such service available!");
}
}
            }
}
}




                 
        %>
    </body>
</html>
