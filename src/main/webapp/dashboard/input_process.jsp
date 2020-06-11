<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="pkg.*"%>
<jsp:useBean id = "dbcon" scope = "page" class = "pkg.Dbconpsql"></jsp:useBean>
<%User user = (User)session.getAttribute("user");
  if(user != null)
  {
    String challan_date=request.getParameter("challanDate");
    String challan_no=request.getParameter("challanNo");
    String input_date=request.getParameter("recievedDate");
    String vendor_id=request.getParameter("vendor");
    String item_id=request.getParameter("item");
    String machine_id=request.getParameter("mctype");
    String qty=request.getParameter("qty");
    Connection con = null;
    try{
    con = dbcon.getCon();
    Statement statement = con.createStatement();
    String strQuery = "SELECT COUNT(*) FROM input where challan_no='"+challan_no+"'";
    ResultSet rs1 =statement.executeQuery(strQuery);
    rs1.next();
    String Countrow = rs1.getString(1); //out.println(Countrow);
    if(Countrow.equals("0")){
        int i=statement.executeUpdate("insert into input(challan_date,challan_no,input_date,vendor_id,item_id,machine_id,quantity)values('"+challan_date+"','"+challan_no+"','"+input_date+"','"+vendor_id+"','"+item_id+"','"+machine_id+"','"+qty+"')");
        out.println("<center>Data is successfully inserted!</center>");

        
        

        Statement st = con.createStatement();
        String q = "select count(*) from stock where item_id = '"+item_id+"' and machine_id ='"+machine_id+"'";
        ResultSet rs = st.executeQuery(q);
        rs.next();
        String x = rs.getString(1);
        
        if(x.equals("1")){

        Statement stx = con.createStatement();
        String qx = "select quantity_in_hand from stock where item_id = '"+item_id+"' and machine_id ='"+machine_id+"'";
        ResultSet rsx = stx.executeQuery(qx);
        rsx.next();
          int quantityDb = rsx.getInt("quantity_in_hand");
          int qtyGiven = Integer.parseInt(qty);
          int qtytot = quantityDb + qtyGiven;
            i=st.executeUpdate("update stock set quantity_in_hand = "+qtytot+" where item_id = "+item_id+" and machine_id = "+machine_id);
        }else{
            i=st.executeUpdate("insert into stock(item_id,machine_id,quantity_in_hand) values('"+item_id+"','"+machine_id+"','"+qty+"')");
        }
    }
    else{
    out.println("Challan No. already exist !!");
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