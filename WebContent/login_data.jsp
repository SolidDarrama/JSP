<!doctype html public "-//w3c//dtd html 4.0 transitional//en" "http://www.w3.org/TR/REC-html40/strict.dtd">
<!-- REFERENCE THE JSTL CORE TAGLIB [also added 'jstl-1.2.jar' into WebContent/WEB-INF/lib]-->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- THESE IMPORT STATEMENTS ARE NEEDED TO RUN THE SQL QUERIES, THEY ARE PART OF THE JDK. -->
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.*" %> 

<HTML>
	<head>
		<title>Login Redirect</title>
		<link href="style.css" rel="stylesheet" type="text/css">
		<jsp:include page="style.css"/>
	</head>
</HTML>

<%
    // SQL STATEMENT IS PRECOMPILED AND STORED IN A PREPAREDSTATEMENT OBJECT; SET TO NULL
	PreparedStatement ps = null;
	// A TABLE OF DATA REPRESENTING A DATABASE RESULT SET; SET TO NULL
	ResultSet rs = null;
	
	// RETRIEVES THE USER DATA INPUT FROM LOGIN.JSP
	String retrieved_username = request.getParameter( "input_username" );
	session.setAttribute("theUsername", retrieved_username);
    String retrieved_password = request.getParameter( "input_password" );
    session.setAttribute("thePassword", retrieved_password);
	
	//DEFINE VARIABLES - USED TO STORE THE VALUES FROM THE DATABASE
	String userName ="";
	String passWord ="";
	String firstName ="";
	String lastName ="";
   
	// THIS IS NEEDED TO USE CONNECTOR/J. IT CREATES A NEW INSTANCE OF THE CONNECTOR/J JDBC DRIVER.
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	
	// 	OPEN NEW CONNECTION.
	java.sql.Connection conn;
	
	/* TO CONNECT TO THE DATABASE, USE A JDBC URL WITH THE FOLLOWING 
    FORMAT ([XXX] DENOTES OPTIONAL URL COMPONENTS):
    JDBC:MYSQL://[HOSTNAME][:PORT]/[DBNAME][?PARAM1=VALUE1][&PARAM2=VALUE2]... 
    BY DEFAULT MYSQL'S HOSTNAME IS "LOCALHOST." THE DATABASE USED HERE IS 
    CALLED "USERS" AND MYSQL'S DEFAULT USER IS "ROOT". IF WE HAD A DATABASE 
    PASSWORD WE WOULD ADD "&PASSWORD=XXX" TO THE END OF THE URL.*/
	conn = DriverManager.getConnection("jdbc:mysql://localhost/Users?user=root");

	// GENERATE THE SQL QUERY.
	String query = "SELECT * from users where Username=? and Password=?";
	ps = conn.prepareStatement(query);
	
	// IF STATEMENTS TO HANDLE PROPER CHARACTER INPUT FROM THE USER;
	// VERIFICATION, CHECKS USER INPUT WITH DATA FROM DATABASE
	if((!(null==retrieved_username || retrieved_username.isEmpty()) && !(null==retrieved_password || retrieved_password.isEmpty())))
	{
		try
		{
			ps.setString(1, retrieved_username);
			ps.setString(2, retrieved_password);
			rs = ps.executeQuery();
			if(rs.next())
			{ 
				userName = rs.getString("Username");
				passWord = rs.getString("Password");
				if(retrieved_username.equals(userName) && retrieved_password.equals(passWord))
				{
					session.setAttribute("userName",userName);
					session.setAttribute("passWord", passWord); 
				// 	response.sendRedirect("users_home.jsp"); 
					response.setHeader("Refresh", "1.5;url=users_home.jsp");
					out.println("REDIRECTING TO YOUR HOMEPAGE...");
				} 
			}
			else
			{
				response.setHeader("Refresh", "3;url=login.jsp");
				out.println("ERROR: INCORRECT USERNAME OR PASSWORD </br>");
				out.println("RETURNING TO THE LOGIN PAGE...");
			}
			// CLOSE THE CONNECTION.
			rs.close();
			ps.close(); 
			conn.close();
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
		out.println("ERROR: FAILED TO FILL A REQUISITE</br>");
		out.println("RETURNING TO THE LOGIN PAGE...");
	}
%>