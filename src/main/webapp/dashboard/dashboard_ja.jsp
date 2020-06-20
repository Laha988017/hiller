<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="pkg.*"%>
<jsp:useBean id = "dbcon" scope = "page" class = "pkg.Dbconpsql"></jsp:useBean>
<%User user = (User)session.getAttribute("user");
  int qih=0;
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
    <title>Dashboard</title>
    <!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
  <script type="text/javascript">
    
  function getqih()
          {
     
             //var joballocation_id=document.getElementById("joballocation_id").value;
              var allocation_date=document.getElementById("jaDate").value;
              var jobno=document.getElementById("jobNo").value;

              var item_id=document.querySelector("#item");
              var item_idv = item_id.value;

              var machine_id=document.querySelector("#mctype");
              var machine_idv = machine_id.value;

              if(item_id!="" && machine_id!="")
             {
                window.location.href = "getqih.jsp?item_id="+item_idv+"&machine_id="+machine_idv+"&jaDate="+allocation_date+"&jobno="+jobno;
                return false;
             }
     

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
            <a class="nav-link" href="dashboard1.jsp">
              <span data-feather="home"></span>
              <button class="btn" type="button" data-toggle="collapse" data-target="#collapseExample1" aria-expanded="false" aria-controls="collapseExample">
                Input
              </button><span class="sr-only">(current)</span>
              </a>
              
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="dashboard_ja.jsp">
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
        <h1 class="h2">Job Allocation</h1>
      </div>

  <form method="get" action="joballocation_process.jsp">
  <div class="form-row">
    <div class="form-group col-md-6">
      Date
      <input type="date" class="form-control" id="jaDate" name="jaDate">
    </div>
    <div class="form-group col-md-6">
      Job No
      <input type="text" class="form-control" id="jobNo" name="jobNo">
    </div>
  </div>
    
    <div class="form-row">
    <div class="form-group col-md-6">
      Item
      <select class="custom-select" name="item" id="item">
        <option selected></option>
        <%while(rsItem.next()){%>
        <option value="<%=rsItem.getString("item_id")%>"><%=rsItem.getString("item_name")%></option>
      <%}
        %>
      </select>
    </div>
    <div class="form-group col-md-6">
      Machine Type
      <select class="custom-select" name="mctype" id="mctype">
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
      Quantity In Hand
      <%
        if(request.getParameter ("item_id")!=null && request.getParameter("machine_id")!=null){
          String item_id=request.getParameter("item_id");
          String machine_id=request.getParameter("machine_id");

    con = dbcon.getCon();
    Statement statement = con.createStatement();
    String strQuery = "SELECT quantity_in_hand FROM stock where item_id='"+item_id+"' and machine_id='"+machine_id+"'";
    ResultSet rs1 =statement.executeQuery(strQuery);
    rs1.next();
   
   qih=rs1.getInt("quantity_in_hand");
 }
      
      %>
      <input type="Number" class="form-control" id="qty_in_hand" name="qty_in_hand" onfocus="return getqih();" value="<%=qih%>" readonly>
      
    </div>
  </div>
    <div class="form-row">
    <div class="form-group col-md-6">
      Challan No.
      <input type="text" class="form-control" id="challanNo" name="challanNo">
    </div>
    <div class="form-group col-md-6">
      Quantity
      <input type="Number" class="form-control" id="quantity" name="quantity">
    </div>
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
  <button type="clear" class="btn btn-primary">Clear</button>
</form>
<hr>

<div class="table-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th>Date</th>
              <th>Job No.</th>
              <th>Item</th>
              <th>M/C Type</th>
              <th>Challan No.</th>
              <th>Quantity</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
<%
  //if(request.getParameter("challanNo") != null)
  //{
    Statement st = con.createStatement();
    String sql = "select * from joballocation natural join item natural join machine order by joballocation_id desc";
    ResultSet rs = st.executeQuery(sql);
    while(rs.next()){
      String item_id=rs.getString("item_id");
      String machine_id=rs.getString("machine_id");
      String quantity=rs.getString("quantity");
    %>
            <tr>
              <td><%=rs.getString("allocation_date")%></td>
              <td><%=rs.getString("job_no")%></td>
              <td><%=rs.getString("item_name")%></td>
              <td><%=rs.getString("machine_type")%></td>
              <td><%=rs.getString("quantity")%></td>
              <td><%=rs.getString("challan_no")%></td>
              <td><a id="delete-btn" href= "deleteja_process.jsp?joballocation_id=<%=rs.getString("joballocation_id")%>&item_id=<%=item_id%>&machine_id=<%=machine_id%>&quantity=<%=quantity%>"><button type="button" class="btn btn-secondary" onclick="alt();">Delete</button></a> 
                <a href= "updateja_process.jsp?joballocation_id=<%=rs.getString("joballocation_id")%>"><button type="button" class="btn btn-secondary">Edit</button></a></td>
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
<script>

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
        document.location.href = 'dashboard_ja.jsp';
      })
        console.log("in if");
    console.log("in if");
  }
  else if(c=="failqih")
  {
    Swal.fire({
      position: 'top-end',
      icon: 'error',
      title: 'Data is not inserted as Quantity is greater than in-hand Quantity',
      showConfirmButton: true,
      confirmButtonColor: '#3085d6'
    }).then((result)=>{
        document.location.href = 'dashboard_ja.jsp';
      })
    console.log("in else if");
  }

  else if(c=="failjobno")
  {
    Swal.fire({
      position: 'top-end',
      icon: 'error',
      title: 'Job Number Already Exist',
      showConfirmButton: true,
      confirmButtonColor: '#3085d6'
    }).then((result)=>{
        document.location.href = 'dashboard_ja.jsp';
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
            'Success'
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
