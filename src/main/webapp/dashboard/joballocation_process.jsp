<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="pkg.*"%>
<jsp:useBean id = "dbcon" scope = "page" class = "pkg.Dbconpsql"></jsp:useBean>
<%User user = (User)session.getAttribute("user");
  if(user != null)
  {
    String allocation_date=request.getParameter("jaDate");
    String job_no=request.getParameter("jobNo");
    String item_id=request.getParameter("item");
    String machine_id=request.getParameter("mctype");
    String challan_no=request.getParameter("challanNo");
    String quantity=request.getParameter("quantity");
    int quantityInt=Integer.parseInt(quantity);
    int i=0,j=0;
    Connection con = null;
    try{
    con = dbcon.getCon();
    Statement statement = con.createStatement();
    String strQuery = "SELECT COUNT(*) FROM joballocation where job_no='"+job_no+"'";
    ResultSet rs1 =statement.executeQuery(strQuery);
    rs1.next();
    String Countrow = rs1.getString(1); //out.println(Countrow);
    if(Countrow.equals("0")){

        Statement sqih=con.createStatement();
        String sqlqih="select quantity_in_hand from stock where item_id = '"+item_id+"' and machine_id ='"+machine_id+"'";
        ResultSet rsqih=sqih.executeQuery(sqlqih);
        rsqih.next();
        int qih=rsqih.getInt("quantity_in_hand");
        if(qih>quantityInt){

        i=statement.executeUpdate("insert into joballocation( job_no,allocation_date,item_id,machine_id,quantity,challan_no) values('"+ job_no+"','"+allocation_date+"','"+item_id+"','"+machine_id+"','"+quantity+"','"+challan_no+"')");
        out.println("<center>Data is successfully inserted!</center>");

        if(i==1){
            out.println("<center>Record inserted to Job Allocation</center>");

          int quantitytot = qih - quantityInt;
            j=statement.executeUpdate("update stock set quantity_in_hand = "+quantitytot+" where item_id = "+item_id+" and machine_id = "+machine_id);
        }
        String site = new String("dashboard_ja.jsp?c=success");
         response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location", site);
      }

      else if(qih==quantityInt){

        i=statement.executeUpdate("insert into joballocation( job_no,allocation_date,item_id,machine_id,quantity,challan_no) values('"+ job_no+"','"+allocation_date+"','"+item_id+"','"+machine_id+"','"+quantity+"','"+challan_no+"')");
        out.println("<center>Data is successfully inserted!</center>");

        if(i==1){
            out.println("<center>Record inserted to Job Allocation</center>");
            j=statement.executeUpdate("Delete from stock  where item_id = "+item_id+" and machine_id = "+machine_id);
        }
        String site = new String("dashboard_ja.jsp?c=success");
         response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location", site);
      }
      else{

      out.println("Quantity given cannot be greater than Quantity In Hand");
      String site = new String("dashboard_ja.jsp?c=failqih");
         response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location", site);
    }

      
    }
    else{
    out.println("Job No. already exist !!");
     String site = new String("dashboard_ja.jsp?c=failjobno");
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