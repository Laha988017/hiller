<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="pkg.*"%>
<jsp:useBean id = "dbcon" scope = "page" class = "pkg.Dbconpsql"></jsp:useBean>
<%User user = (User)session.getAttribute("user");
  if(user != null)
  {
    String joballocation_id=request.getParameter("joballocation_id");
    String item_id=request.getParameter("item_id");
    String machine_id=request.getParameter("machine_id");
    String quantity=request.getParameter("quantity");
    //String qtychallan=request.getParameter("qty");
    Connection con = null;
    try{
    con = dbcon.getCon();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from joballocation natural join stock where joballocation_id = '"+joballocation_id+"'");
    int i = 0;
    if(rs.next()){
        int qtyc = Integer.parseInt(rs.getString("quantity"));
        int qih = rs.getInt("quantity_in_hand");  
        int uqty = qih + qtyc;
      i=st.executeUpdate("update stock set quantity_in_hand = "+uqty+" where item_id = "+rs.getString("item_id")+" and machine_id = "+rs.getString("machine_id"));
    }

    else{
    i=st.executeUpdate("insert into stock(item_id,machine_id,quantity_in_hand) values('"+item_id+"','"+machine_id+"','"+quantity+"')");
  }
  

if(i==1){
  String strQuery = "delete from joballocation where joballocation_id ='"+joballocation_id+"'";
    int j = st.executeUpdate(strQuery);
    out.println("Record deleted Successfully!!");
}
    

    String site = new String("dashboard_ja.jsp");
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