<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="pkg.*"%>
<jsp:useBean id = "dbcon" scope = "page" class = "pkg.Dbconpsql"></jsp:useBean>
<%User user = (User)session.getAttribute("user");
    //http://localhost:8080/project/test.jsp?input_id=24
    Connection con = null;%>
          <select class="custom-select" name="vendor">
        <option selected></option>
<%try{
    Sting input_id = request.getParameter("input_id");
    con = dbcon.getCon();
  Statement stEdit = con.createStatement();
  Statement stVendor = con.createStatement();
  String sqlEdit = "select * from input natural join vendor natural join item natural join machine where input_id = '"+input_id+"'";
  String sqlVendor = "select * from vendor";

  ResultSet rsEdit = stEdit.executeQuery(sqlEdit);
  ResultSet rsVendor = stVendor.executeQuery(sqlVendor);

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
      <%}
        }catch(Exception e){
        out.println(e);
}finally{
   dbcon.destroyCon(con); 
}
%>
        
      </select>
