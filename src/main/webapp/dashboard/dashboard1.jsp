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
  Statement stVendor = con.createStatement();
  Statement stItem = con.createStatement();
  Statement stMctype = con.createStatement();

  String sqlVendor = "select * from vendor";
  String sqlItem = "select * from item";
  String sqlMctype = "select * from machine";

  ResultSet rsVendor = stVendor.executeQuery(sqlVendor);
  ResultSet rsItem = stItem.executeQuery(sqlItem);
  ResultSet rsMctype = stMctype.executeQuery(sqlMctype);
%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.0.1">
    <title>Input Items</title>
    <!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

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
        height: 300px;
        position: relative;
        border: 0px;
      }      
    </style>
    <!-- Custom styles for this template -->
    <link href="dashboard.css" rel="stylesheet">
  </head>
  <body>
    <nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow" >
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
            <a class="nav-link" href="dashboard_jobwork.jsp">
              <span data-feather="user"></span>
              <button class="btn" type="button" data-toggle="collapse" data-target="#collapseExample2" aria-expanded="false" aria-controls="collapseExample">
                Jobwork done
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
  <div class="row row-cols-2">
  <div class="col-md-6">
  <form method="get" action="input_process.jsp">
  <div class="form-row">
    <div class="form-group col-md-6">
      Challan Date
      <input type="date" class="form-control" id="challanDate" name="challanDate" required>
    </div>
    <div class="form-group col-md-6">
      Challan No
      <input type="text" class="form-control" id="challanNo" name="challanNo">
    </div>
  </div>
    <div class="form-row">
    <div class="form-group col-md-6">
      Recieved Date
      <input type="date" class="form-control" id="recievedDate" name="recievedDate" required>
    </div>
    <div class="form-group col-md-6">
      Vendor
      <select class="custom-select" name="vendor" required>
        <option selected></option>
<%
        while(rsVendor.next()){%>
        <option value="<%=rsVendor.getString("vendor_id")%>"><%=rsVendor.getString("vendor_name")%></option>
      <%}
        %>
      </select>
    </div>
  </div>
    <div class="form-row">
    <div class="form-group col-md-6">
      Item
      <select class="custom-select" name="item" required>
        <option selected></option>
        <%while(rsItem.next()){%>
        <option value="<%=rsItem.getString("item_id")%>"><%=rsItem.getString("item_name")%></option>
      <%}
        %>
      </select>
    </div>
    <div class="form-group col-md-6">
      Machine Type
      <select class="custom-select" name="mctype" required>
        <option selected></option>
        <%while(rsMctype.next()){%>
        <option value="<%=rsMctype.getString("machine_id")%>"><%=rsMctype.getString("machine_type")%></option>
      <%}
        %>
      </select>
    </div>
  </div>
    <div class="form-row">
    <div class="form-group col-md-6">
      Quantity
      <input type="Number" class="form-control" id="qty" name="qty" required>
    </div>
  </div>
  <button type="submit" class="btn btn-success">Add</button>
  <button type="clear" class="btn btn-warning">Clear</button>
</form>
</div>
<div class="col-md-6">
  <h1 class="h4 text-center">Stock</h1>
  <div class="table-responsive text-center container">
    
        <table class="table table-striped table-sm">
          <thead>
            <tr class="table-info">
              <th>#</th>
              <th>Item</th>
              <th>M/C Type</th>
              <th>Quantity in hand</th>
            </tr>
          </thead>
          <tbody>
    <%
  
    Statement ststock = con.createStatement();
        //out.println(sql1);
    int count=1;
    String sql1 = "select * from stock natural join item natural join machine order by item_name,machine_type";
    if(sql1 != null){
    ResultSet rs = ststock.executeQuery(sql1);
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

</div>
</div>
<hr>

<div class="table-responsive">
        <table class="table table-striped text-center table-sm table-bordered">
          <thead>
            <tr class="table-primary">
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
              <td>
              <%
                Statement stjob = con.createStatement();
                ResultSet rsjob = stjob.executeQuery("select item_id,machine_id from joballocation where item_id = "+rs.getString("item_id")+" and machine_id = "+rs.getString("machine_id"));
                if(rsjob.next()){

                }else
                {%>
                  <a id="delete-btn" href= "deleteinput_process.jsp?input_id=<%=rs.getString("input_id")%>"><button type="button" class="btn btn-sm btn-danger"><svg class="bi bi-trash-fill" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5a.5.5 0 0 0-1 0v7a.5.5 0 0 0 1 0v-7z"/>
              </svg></button></a> 
                
                <a href= "updateinput_process.jsp?input_id=<%=rs.getString("input_id")%>"><button id="edit-btn" type="button" class="btn btn-sm btn-warning"><svg class="bi bi-pencil" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M11.293 1.293a1 1 0 0 1 1.414 0l2 2a1 1 0 0 1 0 1.414l-9 9a1 1 0 0 1-.39.242l-3 1a1 1 0 0 1-1.266-1.265l1-3a1 1 0 0 1 .242-.391l9-9zM12 2l2 2-9 9-3 1 1-3 9-9z"/>
                <path fill-rule="evenodd" d="M12.146 6.354l-2.5-2.5.708-.708 2.5 2.5-.707.708zM3 10v.5a.5.5 0 0 0 .5.5H4v.5a.5.5 0 0 0 .5.5H5v.5a.5.5 0 0 0 .5.5H6v-1.5a.5.5 0 0 0-.5-.5H5v-.5a.5.5 0 0 0-.5-.5H3z"/>
              </svg></button></a>
                <%}
              %>
              </td>
              <%%>
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
<script type="text/javascript">
  var url_string = window.location.search; //window.location.href
  var url = new URLSearchParams(url_string);
  var c = url.get("c");
  console.log(c);
  if(c=="success")
  {
    Swal.fire({
      position: 'top-end',
      icon: 'success',
      title: 'Data inserted successfully',
      showConfirmButton: true,
      confirmButtonColor: '#3085d6'
    }).then((result)=>{
        document.location.href = 'dashboard1.jsp';
      })
        console.log("in if");
    console.log("in if");
  }
  else if(c=="fail")
  {
    Swal.fire({
      position: 'top-end',
      icon: 'error',
      title: 'Data is not inserted as same challan is given',
      showConfirmButton: true,
      confirmButtonColor: '#3085d6'
    }).then((result)=>{
        document.location.href = 'dashboard1.jsp';
      })
    console.log("in else if");
  }

  $('#delete-btn').on('click',function(e){
    e.preventDefault();
    const href = $(this).attr('href');
    console.log(href);
      Swal.fire({
        title: 'Are you sure?',
        text: "Record will be deleted",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Delete Record!'
      }).then((result) => {
      if (result.value) {
          document.location.href = href;
          Swal.fire(
            'Deleted!',
            'Your file has been deleted.',
            'success'
          )
      }
  })
    })
</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
      
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
        <script src="dashboard.js"></script>
        </body>
</html>
