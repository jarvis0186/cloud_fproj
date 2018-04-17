package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class view_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

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
      out.write("\t   <style type=\"text/css\">\n");
      out.write(".myTable { background-color:#FFFFE0;border-collapse:collapse; }\n");
      out.write(".myTable th { background-color:#BDB76B;color:white;width:30%; }\n");
      out.write(".myTable td, .myTable th { padding:5px;border:1px solid #BDB76B; }\n");
      out.write("</style>\n");
      out.write("\t<div class=\"limiter\">\n");
      out.write("\t\t<div class=\"container-login100\">\n");
      out.write("\t\t  ");

	 	 response.setIntHeader("Refresh", 5);
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
    
    ResultSet rs1=st.executeQuery("select * from tblservices");
     out.print("<table  class='myTable'><th>Service Id</th><th>Status</th>");
      while(rs1.next())
               {
         String r=rs1.getString("sid");
      
        out.print("<div>");
      out.write("\n");
      out.write("        <form action=\"\" method=\"post\" name=\"f\">\n");
      out.write("            <tr align='center'><td>");
      out.print(r);
      out.write("<td><input type='button' style=\"width:98px;\" name='res' value='");
      out.print(rs1.getString("status"));
      out.write("' onclick=\"window.location.href='updservice.jsp?id=");
      out.print(r);
      out.write("'\"/>\n");
      out.write(" ");
    
     out.print("</div>");
    }
    out.print("</table>");

      out.write("\n");
      out.write("\t\t</div>\n");
      out.write("\t</div>\n");
      out.write("\t\n");
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
