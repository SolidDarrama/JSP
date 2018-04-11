<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!-- THESE IMPORT STATEMENTS ARE NEEDED TO RUN THE SQL QUERIES, THEY ARE PART OF THE JDK. -->
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="java.sql.*" %> 

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>New User Registration</title>
		<link href="style.css" rel="stylesheet" type="text/css">
		<jsp:include page="style.css"/>
	</head>
</html>

<%  
	/*DEFINE VARIABLES - USED TO STORE THE VALUES FROM THE USERS INPUT IN 
	THE 'REGISTRATION' FORUM FOUND AT [login.jsp]'*/
 	String username = request.getParameter("new_username");
    String password = request.getParameter("new_password");
    String firstname = request.getParameter("new_fname");
    String lastname = request.getParameter("new_lname");
        
    
	// IF STATEMENTS TO HANDLE PROPER CHARACTER INPUT FROM THE USER;
	// VERIFICATION, CHECKS USER INPUT WITH DATA FROM DATABASE
   	if((!(null==username || username.isEmpty()) && !(null==password || password.isEmpty()) && !(null==firstname || firstname.isEmpty()) && !(null==lastname || lastname.isEmpty())))
   	{
        try
        {
        	// THIS IS NEEDED TO USE CONNECTOR/J JDBC DRIVER.
	        Class.forName("com.mysql.jdbc.Driver");
//	     	OPEN NEW CONNECTION.
	        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "");
	     	// GENERATE THE SQL QUERY.
			Statement st=conn.createStatement();
			//INSERT INPUT VALUES INTO THE DATABASE TABLE "users"
	        int i=st.executeUpdate("INSERT into users(Username,Password,Firstname,Lastname)values('"+username+"','"+password+"','"+firstname+"','"+lastname+"')");
	        
	        out.println("DATA IS SUCCESSFULLY INSERTED! </br>");
			response.setHeader("Refresh", "2.5;url=login.jsp");
			out.println("REDIRECTING YOU BACK TO THE LOGIN PAGE...");
        }
     	// PRINTS EXCEPTION ERRORS
		catch(SQLException sqe)
		{
			out.println(sqe);
		} 
    }
   	else
   	{
   		response.setHeader("Refresh", "3;url=login.jsp");
   		out.println("ERROR: FAILED TO FILL A REQUISITE </br>");
   		out.println("RETURNING TO THE LOGIN PAGE...");
   	}
%>