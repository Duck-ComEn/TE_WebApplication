/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.0.M1
 * Generated at: 2016-03-02 08:10:04 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.hitachigst.prb.te.teweb.*;
import com.hitachigst.prb.itd.itdtools.util.*;
import com.hitachigst.prb.te.teweb.*;
import com.hitachigst.prb.itd.itdtools.util.*;

public final class logon_005fscreen_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/PageLayout/footerlayout.jsp", Long.valueOf(1455876871114L));
    _jspx_dependants.put("/PageLayout/logintoplayout.jsp", Long.valueOf(1455876871131L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("com.hitachigst.prb.te.teweb");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_packages.add("com.hitachigst.prb.itd.itdtools.util");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=TIS-620");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
      out.write("<head>\r\n");
      out.write("\t<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\" />\r\n");
      out.write("    <meta http-equiv=\"imagetoolbar\" content=\"no\" />\r\n");
      out.write("    <meta name=\"description\" content=\"\" />\r\n");
      out.write("    <meta name=\"keywords\" content=\"\" />\r\n");
      out.write("    <meta name=\"author\" content=\"James Koster || www.sixshootermedia.com\" />\r\n");
      out.write("    <meta name=\"copyright\" content=\"\" />\r\n");
      out.write("    <meta name=\"company\" content=\"\" />\r\n");
      out.write("\r\n");
      out.write("    <meta name=\"revisit-after\" content=\"7 days\" />\r\n");
      out.write("\t\r\n");
      out.write("\t");

		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";	
		String apppath=application.getRealPath("");
		String webpath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"";
		new TeWebConfig(apppath,webpath);   	
		String version="";
		String webname="";
		webname=IniFilesReader.getReturnProperties("Local.Application","Application Name");	
		version=TeWebVersionControl.getVersion();
	
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t<title>");
 out.println(webname); 
      out.write("</title>\r\n");
      out.write("\t\r\n");
      out.write("    <link href=\"DATA-INF/CSS/1.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("    <style type=\"text/css\">\r\n");
      out.write("<!--\r\n");
      out.write(".form-noindent {\tBORDER-RIGHT: #c3d9ff 1px solid; BORDER-TOP: #c3d9ff 1px solid; BORDER-LEFT: #c3d9ff 1px solid; BORDER-BOTTOM: #c3d9ff 1px solid; BACKGROUND-COLOR: #ffffff\r\n");
      out.write("}\r\n");
      out.write(".style1 {\tfont-size: 16px;\r\n");
      out.write("\tfont-weight: bold;\r\n");
      out.write("}\r\n");
      out.write("-->\r\n");
      out.write("    </style>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\t");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!-- ============================================Top Layout============================================================================== -->\t\r\n");
      out.write("<div id=\"header\">\r\n");
      out.write("  <table width=\"100%\" border=\"0\">\r\n");
      out.write("    <tr> \r\n");
      out.write("      <td width=\"33%\"><img src=\"DATA-INF/Image/telogo.jpg\" alt=\"Your Logo\" title=\"Your Logo\" /></td>\r\n");
      out.write("      <td width=\"33%\"><h1><a name=\"Top\" id=\"Top\"></a><a href=\"#\">");
//out.println(webname); 
      out.write(" </a></h1></td>\r\n");
      out.write("      <td width=\"34%\"> <p>Version : ");
out.println(version); 
      out.write(" <br /></p> </td>\t  \r\n");
      out.write("    </tr>\r\n");
      out.write("\t<tr> \r\n");
      out.write("\t  <td width=\"33%\"></td>\r\n");
      out.write("      <td width=\"33%\"></td>\r\n");
      out.write("      <td width=\"34%\"></td>\r\n");
      out.write("\t</tr>     \r\n");
      out.write("  </table>\r\n");
      out.write("  <div id=\"header-container\">\t \r\n");
      out.write("\t\t  <!-- <h1><a name=\"Top\" id=\"Top\"></a><a href=\"#\">");
//out.println(webname); 
      out.write(" </a></h1> -->\r\n");
      out.write("        <ul><li></li></ul>\r\n");
      out.write("\t\t<br class=\"clear\" />\r\n");
      out.write(" </div> \r\n");
      out.write("</div>\r\n");
      out.write("<!-- ================================================================================================================================== -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t<table width=\"100%\" border=\"0\">\r\n");
      out.write("      <tr>\r\n");
      out.write("        <td height=\"243\" align=\"center\" valign=\"top\">\r\n");
      out.write("          <table class=\"form-noindent\" cellspacing=\"3\" cellpadding=\"5\" width=\"40%\" \r\n");
      out.write("      border=\"0\">\r\n");
      out.write("            <tbody>\r\n");
      out.write("              <tr>\r\n");
      out.write("                <td style=\"TEXT-ALIGN: center\" valign=\"top\" nowrap=\"nowrap\" bgcolor=\"#e8eefa\"><form action=\"logon_process.jsp\" method=\"post\" name=\"form1\" target=\"_parent\" id=\"form1\">\r\n");
      out.write("                    <table width=\"100%\" border=\"0\">\r\n");
      out.write("                      <tr>\r\n");
      out.write("                        <td colspan=\"3\" align=\"left\"><span class=\"style1\">Logon</span></td>\r\n");
      out.write("                      </tr>\r\n");
      out.write("                      <tr>\r\n");
      out.write("                        <td colspan=\"3\">&nbsp;</td>\r\n");
      out.write("                      </tr>\r\n");
      out.write("                      <tr>\r\n");
      out.write("                        <td width=\"26%\" align=\"left\">Username:\r\n");
      out.write("                            <label></label></td>\r\n");
      out.write("                        <td colspan=\"2\" align=\"left\"><label>\r\n");
      out.write("                          <input name=\"username\" type=\"text\" id=\"username\" size=\"32\" />\r\n");
      out.write("                        </label></td>\r\n");
      out.write("                      </tr>\r\n");
      out.write("                      <tr>\r\n");
      out.write("                        <td align=\"left\">Password:</td>\r\n");
      out.write("                        <td colspan=\"2\" align=\"left\"><label>\r\n");
      out.write("                          <input name=\"password\" type=\"password\" id=\"password\" size=\"32\" />\r\n");
      out.write("                        </label></td>\r\n");
      out.write("                      </tr>\r\n");
      out.write("                      <tr>\r\n");
      out.write("                        <td colspan=\"3\">&nbsp;</td>\r\n");
      out.write("                      </tr>\r\n");
      out.write("                      <tr>\r\n");
      out.write("                        <td align=\"center\">&nbsp;</td>\r\n");
      out.write("                        <td width=\"30%\" align=\"left\" valign=\"middle\"><input type=\"submit\" name=\"button\" id=\"button\" value=\"Submit\" />\r\n");
      out.write("                      <input type=\"reset\" name=\"button2\" id=\"button2\" value=\"Cancel\" /></td>\r\n");
      out.write("                        <td width=\"44%\" align=\"left\" valign=\"middle\"><label> </label></td>\r\n");
      out.write("                      </tr>\r\n");
      out.write("                      <tr>\r\n");
      out.write("                        <td colspan=\"3\">&nbsp;</td>\r\n");
      out.write("                      </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                </form></td>\r\n");
      out.write("              </tr>\r\n");
      out.write("            </tbody>\r\n");
      out.write("          </table></td>\r\n");
      out.write("      </tr>\r\n");
      out.write("    </table>\r\n");
      out.write("    ");
      out.write("<!-- ============================================Top Layout============================================================================== -->\t\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" <div align = \"right\" id=\"footer\">\r\n");
      out.write("\t\t<div id=\"footercontent\" align=\"center\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<table align = \"center\">\t\r\n");
      out.write("\t\t&copy; HGST aWestern Digital company (Thailand) Limited. All rigths reserved\r\n");
      out.write("\t\t</table\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\r\n");
      out.write("<!-- ================================================================================================================================== -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
