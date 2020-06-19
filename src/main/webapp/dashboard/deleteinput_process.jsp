<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="pkg.*"%>
<jsp:useBean id = "dbcon" scope = "page" class = "pkg.Dbconpsql"></jsp:useBean>
<%User user = (User)session.getAttribute("user");
  if(user != null)
  {
    String input_id=request.getParameter("input_id");
    //String qtychallan=request.getParameter("qty");
    Connection con = null;
    try{
    con = dbcon.getCon();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from input natural join stock where input_id = '"+input_id+"'");
    rs.next();
    int i = 0;
    if(rs.getString("quantity").equals(rs.getString("quantity_in_hand"))){
    //jst delete the row
      i=st.executeUpdate("delete from stock where item_id = '"+rs.getString("item_id")+"' and machine_id ='"+rs.getString("machine_id")+"'");
	   }else{
		// make quantinhand less by qtyinchallan
    int qtyc = Integer.parseInt(rs.getString("quantity"));
    int qih = rs.getInt("quantity_in_hand");
    int uqty = qih - qtyc;
      i=st.executeUpdate("update stock set quantity_in_hand = "+uqty+" where item_id = "+rs.getString("item_id")+" and machine_id = "+rs.getString("machine_id"));
	}
if(i==1){
  String strQuery = "delete from input where input_id ='"+input_id+"'";
    int j = st.executeUpdate(strQuery);
    out.println("Record deleted Successfully!!");
}
    

    String site = new String("dashboard1.jsp");
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