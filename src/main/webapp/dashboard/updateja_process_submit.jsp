<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="pkg.*"%>
<jsp:useBean id = "dbcon" scope = "page" class = "pkg.Dbconpsql"></jsp:useBean>
<%User user = (User)session.getAttribute("user");
  if(user != null)
  {
    String joballocation_id=request.getParameter("joballocation_id");
    String allocation_date=request.getParameter("jaDate");
    String job_no=request.getParameter("jobNo");
    String challan_no=request.getParameter("challanNo");

    String currentitem_id=request.getParameter("item");
    String previtem_id=request.getParameter("prevItem");

    String currentmachine_id=request.getParameter("mctype");
    String prevmachine_id=request.getParameter("prevMctype");

    String currentqty=request.getParameter("quantity");
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
      if(rsx.next()){
        int qihprev = rsx.getInt("quantity_in_hand");

        int updatedqty = qihprev + prevqtyInt;
        i = st.executeUpdate("update stock set quantity_in_hand = "+updatedqty+" where item_id = '"+previtem_id+"' and machine_id = '"+prevmachine_id+"'");
        out.println("updated stock");
      }
      else{

        i=st.executeUpdate("insert into stock(item_id,machine_id,quantity_in_hand) values('"+previtem_id+"','"+prevmachine_id+"','"+prevqty+"')");


      }
      
     
      if(i==1)
      {
        Statement sty = con.createStatement();
        String qy = "select quantity_in_hand from stock where item_id = '"+currentitem_id+"' and machine_id ='"+currentmachine_id+"'";
        ResultSet rsy = sty.executeQuery(qy);
        if(rsy.next()) //if null then donot exist if not null then exist
        {
          //update the stock by deducing the latest quantity from quantity_in_hand
          int qihcurrent = rsy.getInt("quantity_in_hand");
          int updatedqty2 = qihcurrent - currentqtyInt;
          j = st.executeUpdate("update stock set quantity_in_hand = "+updatedqty2+" where item_id = '"+currentitem_id+"' and machine_id = '"+currentmachine_id+"'");
        }
        else
        {
          out.println("No Stock Available");
        }
      }
      k=st.executeUpdate("update joballocation set allocation_date = '"+allocation_date+"' ,job_no = '"+job_no+"' ,item_id = '"+currentitem_id+"' ,machine_id = '"+currentmachine_id+"' ,quantity = '"+currentqty+"' ,challan_no = '"+challan_no+"' where joballocation_id = '"+joballocation_id+"'");
      
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