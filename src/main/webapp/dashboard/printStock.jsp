<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="pkg.*"%>
<jsp:useBean id = "dbcon" scope = "page" class = "pkg.Dbconpsql"></jsp:useBean>
<%User user = (User)session.getAttribute("user");
  if(user != null)
  {
    Connection con = null;
    try{
    con = dbcon.getCon();
    %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    body{
      margin-top: 100px;
    }
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #ffffff;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
  </style>
  <script type="text/javascript">
    
  </script>
</head>
<body onload="window.print();">

<nav class="navbar navbar-inverse">
  
</nav>
  
<div class="container-fluid">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
      
    </div>
    <div class="col-sm-8 text-center"> 
      <h1>Stock Report</h1>
      <div class="table-responsive">
        <table class="table table-striped text-center table-sm table-bordered">
          <thead>
            <tr class="table-primary">
              <th align="center">#</th>
              <th align="center">Item</th>
              <th align="center">M/C Type</th>
              <th align="center">Quantity in hand</th>
            </tr>
          </thead>
          <tbody>
    <%
  
    Statement st = con.createStatement();
        //out.println(sql1);
    int count=1;
    String sql1 = "select * from stock natural join item natural join machine order by item_name,machine_type";
    if(sql1 != null){
    ResultSet rs = st.executeQuery(sql1);
    while(rs.next()){
    %>
            <tr>
              <td><%=count++%></td>
              <td><%=rs.getString("item_name")%></td>
              <td><%=rs.getString("machine_type")%></td>
              <td><%=rs.getString("quantity_in_hand")%></td>
            </tr>
  <%}
  }
%>
          </tbody>
        </table>
      </div>
    </main>
  </div>
</div>
      
      
    </div>
    <div class="col-sm-2 sidenav">
      
    </div>
  </div>
</div>
<%}
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


</body>
</html>
