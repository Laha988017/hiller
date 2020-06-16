<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="pkg.*"%>
<jsp:useBean id = "dbcon" scope = "page" class = "pkg.Dbconpsql"></jsp:useBean>
<%User user = (User)session.getAttribute("user");
  if(user != null)
  {
    String input_id=request.getParameter("input_id");
    String challan_date=request.getParameter("challanDate");
    String challan_no=request.getParameter("challanNo");
    String input_date=request.getParameter("recievedDate");
    String vendor_id=request.getParameter("vendor");

    String currentitem_id=request.getParameter("item");
    String previtem_id=request.getParameter("prevItem");

    String currentmachine_id=request.getParameter("mctype");
    String prevmachine_id=request.getParameter("prevMctype");

    String currentqty=request.getParameter("qty");
    int currentqtyInt = Integer.parseInt(currentqty);
    String prevqty=request.getParameter("prevQuantity");
    int prevqtyInt = Integer.parseInt(prevqty);
    
    Connection con = null;
    try{
    //http://localhost:8080/project/dashboard/updateinput_process_submit.jsp?input_id=33&prevQuantity=20&prevItem=33&prevMctype=3&challanDate=1998-12-25&challanNo=10&recievedDate=1999-12-25&vendor=2&item=1&mctype=2&qty=200
    con = dbcon.getCon();
    Statement st = con.createStatement();
    int i = 0;
    int j = 0;
    int k = 0;
  
      out.println("0 0 0 ");
      Statement stx = con.createStatement();
      String qx = "select quantity_in_hand from stock where item_id = '"+previtem_id+"' and machine_id ='"+prevmachine_id+"'";
      ResultSet rsx = stx.executeQuery(qx);
      rsx.next();
      int qihprev = rsx.getInt("quantity_in_hand");
      if(qihprev == prevqtyInt)
      {
        // delete that entry from stock table
        i = st.executeUpdate("delete from stock where item_id = "+previtem_id+" and machine_id = "+prevmachine_id);
        out.println("deleted from stock");

      }
      else
      {
        // update stock table by deducing the (quantity_in_hand - prevquantity) with previtem_id and prevmachine_id
        int updatedqty1 = qihprev - prevqtyInt;
        i = st.executeUpdate("update stock set quantity_in_hand = "+updatedqty1+" where item_id = '"+previtem_id+"' and machine_id = '"+prevmachine_id+"'");
        out.println("updated stock");
      }

      if(i==1)
      {
        Statement sty = con.createStatement();
        String qy = "select quantity_in_hand from stock where item_id = '"+currentitem_id+"' and machine_id ='"+currentmachine_id+"'";
        ResultSet rsy = sty.executeQuery(qy);
        if(rsy.next()) //if null then donot exist if not null the exist
        {
          //update the stock by adding the latest quantity + quantity_in_hand
          int qihcurrent = rsy.getInt("quantity_in_hand");
          int updatedqty2 = qihcurrent + currentqtyInt;
          j = st.executeUpdate("update stock set quantity_in_hand = "+updatedqty2+" where item_id = '"+currentitem_id+"' and machine_id = '"+currentmachine_id+"'");
        }
        else
        {
          //insert into stock with currentitem_id ,currentmachine_id and currentquantity
          j = st.executeUpdate("insert into stock(item_id,machine_id,quantity_in_hand) values('"+currentitem_id+"','"+currentmachine_id+"','"+currentqty+"')");
        }
      }
      k=st.executeUpdate("update input set challan_date = '"+challan_date+"' ,challan_no = '"+challan_no+"' ,input_date = '"+input_date+"' ,vendor_id = '"+vendor_id+"' ,item_id = '"+currentitem_id+"' ,machine_id = '"+currentmachine_id+"' ,quantity = '"+currentqty+"' where input_id = '"+input_id+"'");
      
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