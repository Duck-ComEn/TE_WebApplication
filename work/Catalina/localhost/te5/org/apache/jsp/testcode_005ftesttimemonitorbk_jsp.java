/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.0.M1
 * Generated at: 2016-03-16 02:06:55 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class testcode_005ftesttimemonitorbk_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("    \r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n");
      out.write("        <title>amCharts examples</title>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"style.css\" type=\"text/css\">\r\n");
      out.write("        <script src=\"JSAX-INF/amcharts.js\" type=\"text/javascript\"></script>        \r\n");
      out.write("        <script type=\"text/javascript\">\r\n");
      out.write("            var chartData = [{\r\n");
      out.write("                date: new Date(2012, 0, 1),\r\n");
      out.write("                distance: 227,\r\n");
      out.write("                duration: 408\r\n");
      out.write("            }, {\r\n");
      out.write("                date: new Date(2012, 0, 2),\r\n");
      out.write("                distance: 371,\r\n");
      out.write("                duration: 482\r\n");
      out.write("            }, {\r\n");
      out.write("                date: new Date(2012, 0, 3),\r\n");
      out.write("                distance: 433,\r\n");
      out.write("                duration: 562\r\n");
      out.write("            }, {\r\n");
      out.write("                date: new Date(2012, 0, 4),\r\n");
      out.write("                distance: 345,\r\n");
      out.write("                duration: 379\r\n");
      out.write("            }, {\r\n");
      out.write("                date: new Date(2012, 0, 5),\r\n");
      out.write("                distance: 480,\r\n");
      out.write("                duration: 501\r\n");
      out.write("            }, {\r\n");
      out.write("                date: new Date(2012, 0, 6),\r\n");
      out.write("                distance: 386,\r\n");
      out.write("                duration: 443\r\n");
      out.write("            }, {\r\n");
      out.write("                date: new Date(2012, 0, 7),\r\n");
      out.write("                distance: 348,\r\n");
      out.write("                duration: 405\r\n");
      out.write("            }, {\r\n");
      out.write("                date: new Date(2012, 0, 8),\r\n");
      out.write("                distance: 238,\r\n");
      out.write("                duration: 309\r\n");
      out.write("            }, {\r\n");
      out.write("                date: new Date(2012, 0, 9),\r\n");
      out.write("                distance: 218,\r\n");
      out.write("                duration: 287\r\n");
      out.write("            }, {\r\n");
      out.write("                date: new Date(2012, 0, 10),\r\n");
      out.write("                distance: 349,\r\n");
      out.write("                duration: 485\r\n");
      out.write("            }, {\r\n");
      out.write("                date: new Date(2012, 0, 11),\r\n");
      out.write("                distance: 603,\r\n");
      out.write("                duration: 890\r\n");
      out.write("            }, {\r\n");
      out.write("                date: new Date(2012, 0, 12),\r\n");
      out.write("                distance: 534,\r\n");
      out.write("                duration: 810\r\n");
      out.write("            }];\r\n");
      out.write("            var chart;\r\n");
      out.write("\r\n");
      out.write("            AmCharts.ready(function () {\r\n");
      out.write("                // SERIAL CHART\r\n");
      out.write("                chart = new AmCharts.AmSerialChart();\r\n");
      out.write("                chart.dataProvider = chartData;\r\n");
      out.write("                chart.categoryField = \"date\";\r\n");
      out.write("                chart.marginTop = 0;\r\n");
      out.write("\r\n");
      out.write("                // AXES\r\n");
      out.write("                // category axis\r\n");
      out.write("                var categoryAxis = chart.categoryAxis;\r\n");
      out.write("                categoryAxis.parseDates = true; // as our data is date-based, we set parseDates to true\r\n");
      out.write("                categoryAxis.minPeriod = \"DD\"; // our data is daily, so we set minPeriod to DD                \r\n");
      out.write("                categoryAxis.autoGridCount = false;\r\n");
      out.write("                categoryAxis.gridCount = 50;\r\n");
      out.write("                categoryAxis.gridAlpha = 0;\r\n");
      out.write("                categoryAxis.gridColor = \"#000000\";\r\n");
      out.write("                categoryAxis.axisColor = \"#555555\";\r\n");
      out.write("                // we want custom date formatting, so we change it in next line\r\n");
      out.write("                categoryAxis.dateFormats = [{\r\n");
      out.write("                    period: 'DD',\r\n");
      out.write("                    format: 'DD'\r\n");
      out.write("                }, {\r\n");
      out.write("                    period: 'WW',\r\n");
      out.write("                    format: 'MMM DD'\r\n");
      out.write("                }, {\r\n");
      out.write("                    period: 'MM',\r\n");
      out.write("                    format: 'MMM'\r\n");
      out.write("                }, {\r\n");
      out.write("                    period: 'YYYY',\r\n");
      out.write("                    format: 'YYYY'\r\n");
      out.write("                }];\r\n");
      out.write("\r\n");
      out.write("                // as we have data of different units, we create two different value axes\r\n");
      out.write("                // Duration value axis            \r\n");
      out.write("                var durationAxis = new AmCharts.ValueAxis();\r\n");
      out.write("                durationAxis.title = \"duration\";\r\n");
      out.write("                durationAxis.gridAlpha = 0.05;\r\n");
      out.write("                durationAxis.axisAlpha = 0;\r\n");
      out.write("                durationAxis.inside = true;\r\n");
      out.write("                // the following line makes this value axis to convert values to duration\r\n");
      out.write("                // it tells the axis what duration unit it should use. mm - minute, hh - hour...                \r\n");
      out.write("                durationAxis.duration = \"mm\";\r\n");
      out.write("                durationAxis.durationUnits = {\r\n");
      out.write("                    DD: \"d. \",\r\n");
      out.write("                    hh: \"h \",\r\n");
      out.write("                    mm: \"min\",\r\n");
      out.write("                    ss: \"\"\r\n");
      out.write("                };\r\n");
      out.write("                chart.addValueAxis(durationAxis);\r\n");
      out.write("\r\n");
      out.write("                // Distance value axis \r\n");
      out.write("                var distanceAxis = new AmCharts.ValueAxis();\r\n");
      out.write("                distanceAxis.title = \"distance\";\r\n");
      out.write("                distanceAxis.gridAlpha = 0;\r\n");
      out.write("                distanceAxis.position = \"right\";\r\n");
      out.write("                distanceAxis.inside = true;\r\n");
      out.write("                distanceAxis.unit = \"mi\";\r\n");
      out.write("                distanceAxis.axisAlpha = 0;\r\n");
      out.write("                chart.addValueAxis(distanceAxis);\r\n");
      out.write("\r\n");
      out.write("                // GRAPHS\r\n");
      out.write("                // duration graph\r\n");
      out.write("                var durationGraph = new AmCharts.AmGraph();\r\n");
      out.write("                durationGraph.title = \"duration\";\r\n");
      out.write("                durationGraph.valueField = \"duration\";\r\n");
      out.write("                durationGraph.type = \"line\";\r\n");
      out.write("                durationGraph.valueAxis = durationAxis; // indicate which axis should be used\r\n");
      out.write("                durationGraph.lineColor = \"#CC0000\";\r\n");
      out.write("                durationGraph.balloonText = \"[[value]]\";\r\n");
      out.write("                durationGraph.lineThickness = 1;\r\n");
      out.write("                durationGraph.legendValueText = \"[[value]]\";\r\n");
      out.write("                durationGraph.bullet = \"square\";\r\n");
      out.write("                chart.addGraph(durationGraph);\r\n");
      out.write("\r\n");
      out.write("                // distance graph\r\n");
      out.write("                var distanceGraph = new AmCharts.AmGraph();\r\n");
      out.write("                distanceGraph.valueField = \"distance\";\r\n");
      out.write("                distanceGraph.title = \"distance\";\r\n");
      out.write("                distanceGraph.type = \"column\";\r\n");
      out.write("                distanceGraph.fillAlphas = 0.1;\r\n");
      out.write("                distanceGraph.valueAxis = distanceAxis; // indicate which axis should be used\r\n");
      out.write("                distanceGraph.balloonText = \"[[value]] miles\";\r\n");
      out.write("                distanceGraph.legendValueText = \"[[value]] mi\";\r\n");
      out.write("                distanceGraph.lineColor = \"#000000\";\r\n");
      out.write("                distanceGraph.lineAlpha = 0;\r\n");
      out.write("                chart.addGraph(distanceGraph);\r\n");
      out.write("\r\n");
      out.write("                // CURSOR                \r\n");
      out.write("                var chartCursor = new AmCharts.ChartCursor();\r\n");
      out.write("                chartCursor.zoomable = false;\r\n");
      out.write("                chartCursor.categoryBalloonDateFormat = \"DD\";\r\n");
      out.write("                chartCursor.cursorAlpha = 0;\r\n");
      out.write("                chart.addChartCursor(chartCursor);\r\n");
      out.write("\r\n");
      out.write("                // LEGEND\r\n");
      out.write("                var legend = new AmCharts.AmLegend();\r\n");
      out.write("                legend.bulletType = \"round\";\r\n");
      out.write("                legend.equalWidths = false;\r\n");
      out.write("                legend.valueWidth = 120;\r\n");
      out.write("                legend.color = \"#000000\";\r\n");
      out.write("                chart.addLegend(legend);\r\n");
      out.write("\r\n");
      out.write("                // WRITE                                \r\n");
      out.write("                chart.write(\"chartdi1v\")\r\n");
      out.write("            });\r\n");
      out.write("        </script>\r\n");
      out.write("    </head>\r\n");
      out.write("    \r\n");
      out.write("    <body>\r\n");
      out.write("        <div id=\"chartdi1v\" style=\"width:100%; height:400px;\"></div>\r\n");
      out.write("    </body>\r\n");
      out.write("\r\n");
      out.write("</html>");
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
