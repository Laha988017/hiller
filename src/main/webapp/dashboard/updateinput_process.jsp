<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="pkg.*"%>
<jsp:useBean id = "dbcon" scope = "page" class = "pkg.Dbconpsql"></jsp:useBean>
<%User user = (User)session.getAttribute("user");
  if(user != null)
  {
    String input_id = request.getParameter("input_id");
    Connection con = null;
    try{
    con = dbcon.getCon();
  Statement stEdit = con.createStatement();
  Statement stVendor = con.createStatement();
  Statement stItem = con.createStatement();
  Statement stMctype = con.createStatement();

  String sqlEdit = "select * from input natural join vendor natural join item natural join machine where input_id = '"+input_id+"'";
  String sqlVendor = "select * from vendor";
  String sqlItem = "select * from item";
  String sqlMctype = "select * from machine";

  ResultSet rsEdit = stEdit.executeQuery(sqlEdit);
  ResultSet rsVendor = stVendor.executeQuery(sqlVendor);
  ResultSet rsItem = stItem.executeQuery(sqlItem);
  ResultSet rsMctype = stMctype.executeQuery(sqlMctype);
  rsEdit.next();
%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.0.1">
    <title>Dashboard</title>
    <!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  <script type="text/javascript">
      function alt(){
    alert("Do you want to delete?");
  }
  </script>
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      .container {
        height: 30px;
        position: relative;
        border: 3px;
      }      
      .center {
        margin: 0;
        position: absolute;
        top: 50%;
        left: 50%;
        -ms-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="dashboard.css" rel="stylesheet">
  </head>
  <body>
    <nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
  <a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="#">Hiller Inventory</a>
  <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-toggle="collapse" data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
  <ul class="navbar-nav px-3">
    <li class="nav-item text-nowrap">
      <a class="nav-link" href="logout.jsp">Sign out</a>
    </li>
  </ul>
</nav>

<div class="container-fluid">
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="sidebar-sticky pt-3">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" href="dashboard1.jsp">
              <span data-feather="home"></span>
              <button class="btn" type="button" data-toggle="collapse" data-target="#collapseExample1" aria-expanded="false" aria-controls="collapseExample">
                Input
              </button><span class="sr-only">(current)</span>
              </a>
              
          </li>
          <li class="nav-item">
            <a class="nav-link" href="dashboard_ja.jsp">
              <span data-feather="users"></span>
              <button class="btn" type="button" data-toggle="collapse" data-target="#collapseExample2" aria-expanded="false" aria-controls="collapseExample">
                Job Allocation
              </button><span class="sr-only"></span>
              </a>
              
          </li>
          <li class="nav-item">
            <a class="nav-link" href="dashboard_sale.jsp">
              <span data-feather="shopping-cart"></span>
              <button class="btn" type="button" data-toggle="collapse" data-target="#collapseExample3" aria-expanded="false" aria-controls="collapseExample">
                Sale
              </button><span class="sr-only">(current)</span>
              </a>
              
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file"></span>
              <button class="btn" type="button" data-toggle="collapse" data-target="#collapseExample4" href="dashboard_reports.jsp" aria-expanded="false" aria-controls="collapseExample">
                Reports
              </button><span class="sr-only">(current)</span>
              </a>
              <div class="collapse" id="collapseExample4">
                <div class="card card-body">
                  <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link " href="dashboard_reportsInput.jsp">
                            Input Report
                        </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="dashboard_reportsJa.jsp">
                          Job Allocation Report
                      </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link " href="dashboard_reportsSales.jsp">
                        Sale out Report
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="dashboard_reportsStock.jsp">
                        Stock Report
                    </a>
                </li>
                  </ul>
                </div>
              </div>
          </li>          
        </ul>
      </div>
    </nav>

    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Input Items</h1>
      </div>

  <form method="get" action="updateinput_process_submit.jsp">
  <div class="form-row">
    <div class="form-group col-md-6">
      <input type="hidden" class="form-control" id="input_id" name="input_id" value="<%=rsEdit.getString("input_id")%>">
      <input type="hidden" class="form-control" id="preQuantity" name="prevQuantity" value="<%=rsEdit.getString("quantity")%>">
      <input type="hidden" class="form-control" id="prevItem" name="prevItem" value="<%=rsEdit.getString("item_id")%>">
      <input type="hidden" class="form-control" id="prevMctype" name="prevMctype" value="<%=rsEdit.getString("machine_id")%>">

      Challan Date
      <input type="date" class="form-control" id="challanDate" name="challanDate" value="<%=rsEdit.getString("challan_date")%>">
    </div>
    <div class="form-group col-md-6">
      Challan No
      <input type="text" class="form-control" id="challanNo" name="challanNo" value="<%=rsEdit.getString("challan_no")%>">
    </div>
  </div>
    <div class="form-row">
    <div class="form-group col-md-6">
      Recieved Date
      <input type="date" class="form-control" id="recievedDate" name="recievedDate" value="<%=rsEdit.getString("input_date")%>">
    </div>
    <div class="form-group col-md-6">
      Vendor
      <select class="custom-select" name="vendor">
        <option selected></option>
<%
        while(rsVendor.next()){%>
        <option value="<%=rsVendor.getString("vendor_id")%>"
            <%if(rsVendor.getString("vendor_name").equals(rsEdit.getString("vendor_name")))
               {%>
                  selected
               <%}
              %>
          ><%=rsVendor.getString("vendor_name")%></option>
      <%}
        %>
      </select>
    </div>
  </div>
    <div class="form-row">
    <div class="form-group col-md-6">
      Item
      <select class="custom-select" name="item">
        <option selected></option>
        <%while(rsItem.next()){%>
        <option value="<%=rsItem.getString("item_id")%>"
            <%if(rsItem.getString("item_name").equals(rsEdit.getString("item_name")))
               {%>
                  selected
               <%}
              %>
          ><%=rsItem.getString("item_name")%></option>
      <%}
        %>
      </select>
    </div>
    <div class="form-group col-md-6">
      Machine Type
      <select class="custom-select" name="mctype">
        <option selected></option>
        <%while(rsMctype.next()){%>
        <option value="<%=rsMctype.getString("machine_id")%>"
            <%if(rsMctype.getString("machine_type").equals(rsEdit.getString("machine_type")))
               {%>
                  selected
               <%}
              %>
          ><%=rsMctype.getString("machine_type")%></option>
      <%}
        %>
      </select>
    </div>
  </div>
    <div class="form-row">
    <div class="form-group col-md-6">
      Quantity
      <input type="Number" class="form-control" id="qty" name="qty" value="<%=rsEdit.getString("quantity")%>">
    </div>
  </div>
  <div class="container">
    <div class="center">
      <button type="submit" class="btn btn-primary">Submit</button>
      <button type="clear" class="btn btn-primary">Clear</button>
    </div>
  </div>
</form>
<hr>

<div class="table-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th>Recieved Date</th>
              <th>Challan No.</th>
              <th>Challan Date</th>
              <th>Vendor</th>
              <th>Item</th>
              <th>M/C Type</th>
              <th>Quantity</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
<%
  //if(request.getParameter("challanNo") != null)
  //{
    Statement st = con.createStatement();
    String sql = "select * from input,vendor,item,machine where input.vendor_id = vendor.vendor_id and input.item_id = item.item_id and input.machine_id = machine.machine_id order by input_id desc";
    ResultSet rs = st.executeQuery(sql);
    while(rs.next()){
    %>
            <tr>
              <td><%=rs.getString("input_date")%></td>
              <td><%=rs.getString("challan_no")%></td>
              <td><%=rs.getString("challan_date")%></td>
              <td><%=rs.getString("vendor_name")%></td>
              <td><%=rs.getString("item_name")%></td>
              <td><%=rs.getString("machine_type")%></td>
              <td><%=rs.getString("quantity")%></td>
              <td><a href= "deleteinput_process.jsp?input_id=<%=rs.getString("input_id")%>"><button type="button" class="btn btn-secondary" onclick="alt();">Delete</button></a> <a href= "updateinput_process.jsp?input_id=<%=rs.getString("input_id") %>"><button type="button" class="btn btn-secondary">Edit</button></a></td>
            </tr>
  <%}
//}
%>
          </tbody>
        </table>
      </div>

    </main>

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
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
      
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
        <script src="dashboard.js"></script>
        </body>
</html>
