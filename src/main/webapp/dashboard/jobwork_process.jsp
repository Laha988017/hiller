<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="pkg.*"%>
<jsp:useBean id = "dbcon" scope = "page" class = "pkg.Dbconpsql"></jsp:useBean>
<%User user = (User)session.getAttribute("user");
  if(user != null)
  {
    String start_date=request.getParameter("startDate");
    String job_no=request.getParameter("job_no");
    String complete_date=request.getParameter("completeDate");
    
    int i=0,j=0;
    Connection con = null;
    try{
    con = dbcon.getCon();
    Statement statement = con.createStatement();
    String strQuery = "SELECT COUNT(*) FROM jobwork where job_no='"+job_no+"'";
    ResultSet rs1 =statement.executeQuery(strQuery);
    rs1.next();
    String Countrow = rs1.getString(1); //out.println(Countrow);
    if(Countrow.equals("0")){
      Statement s = con.createStatement();
      i = s.executeUpdate("insert into jobwork(job_no,jobwork_flag,start_date,complete_date) values ('"+job_no+"','1','"+start_date+"','"+complete_date+"')");
      if(i==1)
      {
        out.println("Inserted to jobwork");
        String site = new String("dashboard_jobwork.jsp?c=success");
         response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location", site); 
      }
      else
      {
        out.println("NOT Inserted to jobwork");
        String site = new String("dashboard_jobwork.jsp?c=fail");
         response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location", site);
      }

    }
    else{
    out.println("Job No. already exist !!");
     String site = new String("dashboard_jobwork.jsp?c=fail");
         response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location", site); 
    }
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