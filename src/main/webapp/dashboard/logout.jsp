<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="pkg.*"%>
<jsp:useBean id = "dbcon" scope = "page" class = "pkg.Dbconpsql"></jsp:useBean>
<%
	
		session.invalidate();

		String site = new String("../index.html");
         response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location", site);

%>

	
