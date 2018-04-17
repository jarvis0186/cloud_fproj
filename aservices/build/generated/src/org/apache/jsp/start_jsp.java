package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.lang.reflect.Modifier;
import java.lang.management.OperatingSystemMXBean;
import java.lang.management.ManagementFactory;
import java.lang.reflect.Method;
import java.io.PrintWriter;
import java.io.FileOutputStream;
import java.util.Random;
import java.sql.*;

public final class start_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

int i=1;
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("\t<title>Admin View</title>\n");
      out.write("\t<meta charset=\"UTF-8\">\n");
      out.write("\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("<!--===============================================================================================-->\t\n");
      out.write("\t<link rel=\"icon\" type=\"image/png\" href=\"images/icons/favicon.ico\"/>\n");
      out.write("<!--===============================================================================================-->\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"vendor/bootstrap/css/bootstrap.min.css\">\n");
      out.write("<!--===============================================================================================-->\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"fonts/font-awesome-4.7.0/css/font-awesome.min.css\">\n");
      out.write("<!--===============================================================================================-->\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"vendor/animate/animate.css\">\n");
      out.write("<!--===============================================================================================-->\t\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"vendor/css-hamburgers/hamburgers.min.css\">\n");
      out.write("<!--===============================================================================================-->\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"vendor/select2/select2.min.css\">\n");
      out.write("<!--===============================================================================================-->\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"css/util.css\">\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"css/main.css\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/button.css\">\n");
      out.write("<!--===============================================================================================-->\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    ");

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
        
        
      out.write("\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            alert(\"Server started on ip1\");\n");
      out.write("        </script>\n");
      out.write("            \n");
      out.write("            ");
   
                  Class.forName("com.mysql.jdbc.Driver");
        Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_mgmt","root", "");
        Statement st1 = con1.createStatement();
        ResultSet rs=st1.executeQuery("select * from tblservices");
        Random R1= new Random();
        int k1=(Math.abs(R1.nextInt())%6)+1;
        startTimes2 = System.nanoTime( );
         Thread.sleep(k1*1000);
      out.write("\n");
      out.write("         <script type=\"text/javascript\">\n");
      out.write("             window.location.replace(\"http://192.168.43.94:8080/adminservices/start.jsp\");\n");
      out.write("                      </script>");

        
        
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
       
    
      out.write("\n");
      out.write("                      \n");
      out.write("\t\n");
      out.write("\n");
      out.write("\t\n");
      out.write("<!--===============================================================================================-->\t\n");
      out.write("\t<script src=\"vendor/jquery/jquery-3.2.1.min.js\"></script>\n");
      out.write("<!--===============================================================================================-->\n");
      out.write("\t<script src=\"vendor/bootstrap/js/popper.js\"></script>\n");
      out.write("\t<script src=\"vendor/bootstrap/js/bootstrap.min.js\"></script>\n");
      out.write("<!--===============================================================================================-->\n");
      out.write("\t<script src=\"vendor/select2/select2.min.js\"></script>\n");
      out.write("<!--===============================================================================================-->\n");
      out.write("\t<script src=\"vendor/tilt/tilt.jquery.min.js\"></script>\n");
      out.write("\t<script >\n");
      out.write("\t\t$('.js-tilt').tilt({\n");
      out.write("\t\t\tscale: 1.1\n");
      out.write("\t\t})\n");
      out.write("\t</script>\n");
      out.write("<!--===============================================================================================-->\n");
      out.write("\t<script src=\"js/main.js\"></script>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
