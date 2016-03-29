<%@ page language="java" %>
<%@ page pageEncoding="TIS-620" %>
<%@ page import ="java.util.*"%>
<%@ page import ="java.lang.*"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="pallet.*"%>

<%
    //============ Get parameter =============
    String consolidateno = "";
    String caseno = "";
    String pkgid = "";
    String palletpn = "";
    String available = "";
    String date = "";
    String errormessage = "";
    
    consolidateno = request.getParameter("consolidateno");
    caseno = request.getParameter("caseno");
    pkgid = request.getParameter("pkgid");
    palletpn = request.getParameter("palletpn");
    available = request.getParameter("available");
    date = request.getParameter("date");
    
    // No some value
    if (consolidateno==null || consolidateno.equals("") || caseno==null || caseno.equals("")
            || pkgid==null || pkgid.equals("") || palletpn==null || palletpn.equals("")
            || available==null || available.equals("") || date==null || date.equals("")) {
%>
            <jsp:forward page="error.jsp">
                <jsp:param name="errormessage" value="E000004" />
                <jsp:param name="url" value="viewdata.jsp" />
            </jsp:forward>
<%
    }
    
    String sql = "SELECT D.CONSOLIDATEDNO, PKGID, PALLETPN, GROSSWEIGHT, EMPTYCARTON, " +
                    "WIDTH, LENGTH, HEIGHT, UPDATEBY, FLAG, DATE(LASTUPDATE) as LASTUPDATE, C.CASENO " +
                    "FROM PALLET.TBL_RECORDDATA D " +
                    "LEFT JOIN PALLET.CONSOLIDATED_CASENO_GROUP C ON (D.CONSOLIDATEDNO=C.CONSOLIDATEDNO) " +
                    "LEFT JOIN PALLET.TBL_RECORDCASENO RC ON (D.CONSOLIDATEDNO=RC.CONSOLIDATEDNO) ";
        
    if (consolidateno.trim().equals("*"))
        consolidateno = "%";
    if (caseno.trim().equals("*"))
        caseno = "%";
    if (pkgid.trim().equals("*"))
        pkgid = "%";
    if (palletpn.trim().equals("*"))
        palletpn = "%";
    if (available.trim().equals("*"))
        available = "%";
    if (date.trim().equals("*"))
        date = "%";
    
    
    sql = sql + "WHERE D.CONSOLIDATEDNO like '" + consolidateno + "' " +
                "AND RC.CASENO like '" + caseno + "' " +
                "AND PKGID like '" + pkgid + "' " +
                "AND PALLETPN like '" + palletpn + "' ";
    
    if (!date.trim().equals("%"))
        sql = sql + "AND DATE(LASTUPDATE) = '" + date + "' ";
    if (!available.trim().equals("%"))
        sql = sql + "AND FLAG = " + available + " ";
        
    sql = sql + "group by D.CONSOLIDATEDNO, PKGID, PALLETPN, GROSSWEIGHT, EMPTYCARTON, " +
                    "WIDTH, LENGTH, HEIGHT, UPDATEBY, FLAG, DATE(LASTUPDATE), C.CASENO " +
                    "order by D.CONSOLIDATEDNO desc for read only with ur";
    
    //out.println(sql);
    
    // Get information to show
    Vector vt_result = new Vector();
    
    try {
        vt_result = new Consolidate().getInformation(sql);
    } catch(Exception e) {
        errormessage = e.getMessage();
%>
            <jsp:forward page="error.jsp">
                <jsp:param name="errormessage" value="<%=errormessage%>" />
                <jsp:param name="url" value="viewdata.jsp" />
            </jsp:forward>
<%
    }
%>    
<table width="100%" border="1">
    <tr>
        <td>
            <b>Consolidated No.</b>
        </td>
        <td>
            <b>Case No.</b>
        </td>
        <td>
            <b>Package ID</b>
        </td>
        <td>
            <b>Pallet PN</b>
        </td>
        <td>
            <b>Gross Weight (Kg)</b>
        </td>
        <td>
            <b>Empty Carton (Cartons)</b>
        </td>
        <td>
            <b>Width (cm)</b>
        </td>
        <td>
            <b>Length (cm)</b>
        </td>
        <td>
            <b>Height (cm)</b>
        </td>
        <td>
            <b>Available</b>
        </td>
        <td>
            <b>Update By</b>
        </td>
        <td>
            <b>Last Updated</b>
        </td>
    </tr>
<%    
    if (vt_result!=null)
        for (int i=0; i<vt_result.size(); i++) {
            out.println("<tr>");
            out.println("<td>" + ((ConsolidateNo)vt_result.get(i)).getConsolidateno() + "</td>");
            out.println("<td>" + ((ConsolidateNo)vt_result.get(i)).getCaseno() + "</td>");
            out.println("<td>" + ((ConsolidateNo)vt_result.get(i)).getPkgid() + "</td>");
            out.println("<td>" + ((ConsolidateNo)vt_result.get(i)).getPalletpn() + "</td>");
            out.println("<td>" + ((ConsolidateNo)vt_result.get(i)).getGrossweight() + "</td>");
            out.println("<td>" + ((ConsolidateNo)vt_result.get(i)).getEmptycarton() + "</td>");
            out.println("<td>" + ((ConsolidateNo)vt_result.get(i)).getWidth() + "</td>");
            out.println("<td>" + ((ConsolidateNo)vt_result.get(i)).getLength() + "</td>");
            out.println("<td>" + ((ConsolidateNo)vt_result.get(i)).getHeight() + "</td>");
            String availableflag = "";
            if(((ConsolidateNo)vt_result.get(i)).getAvailable().equals("1"))
                availableflag = "Exist";
            else
                availableflag = "Deleted";
            out.println("<td>" + availableflag + "</td>");
            out.println("<td>" + ((ConsolidateNo)vt_result.get(i)).getUpdateby() + "</td>");
            out.println("<td>" + ((ConsolidateNo)vt_result.get(i)).getLastupdate() + "</td>");
            out.println("</tr>");

        }
%>
</table>