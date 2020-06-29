<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="pkg.*"%>
<jsp:useBean id = "dbcon" scope = "page" class = "pkg.Dbconpsql"></jsp:useBean>
<%User user = (User)session.getAttribute("user");
  if(user != null)
  {
    String complete_date=request.getParameter("completeDate");
    //String qtychallan=request.getParameter("qty");
    Connection con = null;
    try{
    con = dbcon.getCon();
    Statement st = con.createStatement();
  String strQuery = "update jobwork set complete_date = '"+complete_date+"'";
    int j = st.executeUpdate(strQuery);
    out.println("Record deleted Successfully!!");
    

    String site = new String("dashboard_jobwork.jsp");
         response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location", site); 
	}
  catch(Exception e){
  out.println(e);
}
finally{
  dbcon.destroyCon(con);
}
}
else{%>
  <jsp:forward page ="logout.jsp"/>
<%}
%>