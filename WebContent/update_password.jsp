<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!-- THESE IMPORT STATEMENTS ARE NEEDED TO RUN THE SQL QUERIES, THEY ARE PART OF THE JDK. -->
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Update Password</title>
		<link href="style.css" rel="stylesheet" type="text/css">
		<jsp:include page="style.css"/>
	</head>
</html>

<%
	/*DEFINE VARIABLES - USED TO STORE THE VALUES FROM THE USERS INPUT IN 
	 THE 'UPDATE PASSWORD' FORUM FOUND AT [users_home.jsp]'*/
	String currentPassword=request.getParameter("current");
	String Newpass=request.getParameter("new");
	String conpass=request.getParameter("confirm");
	
	//DEFINE VARIABLES - USED FOR THE SQL QUERY/DATABASE CONNECTION;
	String connurl = "jdbc:mysql://localhost:3306/users";
	Connection con=null;
	String pass="";
	
	int id=0;
	
	// IF STATEMENTS TO HANDLE PROPER CHARACTER INPUT FROM THE USER;
	// VERIFICATION, CHECKS USER INPUT WITH DATA FROM DATABASE
	if((!(null==currentPassword || currentPassword.isEmpty()) && !(null==Newpass || Newpass.isEmpty()) && !(null==conpass || conpass.isEmpty())))
	{
		try
		{
			// THIS IS NEEDED TO USE CONNECTOR/J JDBC DRIVER.
			Class.forName("com.mysql.jdbc.Driver");
			// 	OPEN NEW CONNECTION.
			con = DriverManager.getConnection(connurl, "root", "");
			// GENERATE THE SQL QUERY.
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("SELECT * from users where Password='"+currentPassword+"'");
			while(rs.next())
			{
				id=rs.getInt(1);
				pass=rs.getString(3);
			} 
			System.out.println(id+ " "+pass);
			if(pass.equals(currentPassword))
			{
				Statement st1=con.createStatement();
				int i=st1.executeUpdate("update users set Password='"+Newpass+"' where id='"+id+"'");
				out.println("PASSWORD CHANGED SUCCESSFULLY </br>");
				response.setHeader("Refresh", "2.5;url=users_home.jsp");
				out.println("REDIRECTING TO YOUR HOMEPAGE...");
				// CLOSE THE CONNECTION.
				st1.close();
				con.close();
			}
			else
			{
				out.println("INVALID CURRENT PASSWORD </br>");
				response.setHeader("Refresh", "3;url=users_home.jsp");
				out.println("REDIRECTING TO YOUR HOMEPAGE...");
			}
		}
		// PRINTS EXCEPTION ERRORS
		catch(SQLException sqe)
		{
			out.println(sqe);
		} 
	}
	else
	{
		out.println("INVALID CURRENT PASSWORD </br>");
		response.setHeader("Refresh", "3;url=users_home.jsp");
		out.println("REDIRECTING TO YOUR HOMEPAGE...");
	}
%>