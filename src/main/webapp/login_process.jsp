<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="pkg.*"%>
<jsp:useBean id = "dbcon" scope = "page" class = "pkg.Dbconpsql"></jsp:useBean>
<jsp:useBean id = "user" scope = "session" class = "pkg.User"></jsp:useBean>
<%
String username=request.getParameter("username");out.println(username);
String password=request.getParameter("password");out.println(password);
Connection con = null;

try{
	
    con = dbcon.getCon();
	Statement st = con.createStatement();
	String sql = "select userid,password from admin where userid ='"+username+"' and password= '"+password+"'";
	ResultSet rs = st.executeQuery(sql);
	int x = 0;
	if(rs.next()){
		out.println(rs.getString("userid"));
		if(rs.getString("userid").equals(username) && rs.getString("password").equals(password))
		{
				x = 1;
                user = (User)session.getAttribute("user");
                user.setUsername(rs.getString("userid"));
                user.setPassword(rs.getString("password"));
        } else {
                x = 2;
            }
        }
        if (x == 1) {
		String site = new String("dashboard/dashboard1.jsp");
         response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location", site); 

		HttpSession s = request.getSession();
		}else{
			out.println("Check Userid OR Password!!");
		String site = new String("logout.jsp");
         response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location", site); 
		}

}catch(Exception e){
	out.println(e);
}
finally{
	dbcon.destroyCon(con);
}
%>