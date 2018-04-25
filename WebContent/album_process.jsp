<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- THESE IMPORT STATEMENTS ARE NEEDED TO RUN THE SQL QUERIES, THEY ARE PART OF THE JDK. -->
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="java.sql.*" %> 

<html>
	<head>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		<jsp:include page="style.css"/>
		<title>Processing Albums</title>
		<link href="style.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<div ng-app="myApp" ng-controller="statesCtrl">
		<!-- 	ASKING USER FOR SHIPPING INFORMATION -->
		<div class="shippingForum">
			<form action="albums_selected.jsp" method="post"><br>
				<p style="font-size: 35px;">Guest Shopper Information</p>
				Full Name:  <input type="text" name="FullName" value="" /><br>
				Address:    <input type="text" name="Address" value="" /><br>
				City:       <input type="text" name="City" value="" /><br>
				States:     <input data-ng-model="query" type="text" name="State"/>
				<input type="submit" name="submit" value="submit" />
			</form>
		</div>
	</body>
</html>

<%
	// CREATE VARIABLES + ARRAY VARIABLE TO CONTAIN EACH CHECKBOX SELECTION USING FOR LOOP
	String checkboxValue = "";
	String a[]=request.getParameterValues("voucher");
	for(int i=0;i<a.length;i++){
		checkboxValue+="-"+a[i]+"<br>";
	}
	/*DEFINE VARIABLES - USED TO STORE THE VALUES FROM THE USERS INPUT IN 
	THE 'REGISTRATION' FORUM FOUND AT [login.jsp]'*/
	    
    try
    {
    	// THIS IS NEEDED TO USE CONNECTOR/J JDBC DRIVER.
        Class.forName("com.mysql.jdbc.Driver");
		// OPEN NEW CONNECTION.
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "");
     	// GENERATE THE SQL QUERY.
		Statement st=conn.createStatement();
		//INSERT INPUT VALUES INTO THE DATABASE TABLE "users"
        int i=st.executeUpdate("INSERT into checkbox(name)values('"+checkboxValue+"')");
        
//         out.println("DATA IS SUCCESSFULLY INSERTED! </br>");
// 		response.setHeader("Refresh", "2.5;url=albums_selected.jsp");
// 		out.println("REDIRECTING YOU TO THE SHOPPING CART PAGE...");
		
		// CLOSE THE CONNECTION.
		st.close(); 
		conn.close();
    }
 	// PRINTS EXCEPTION ERRORS
	catch(SQLException sqe)
	{
		out.println(sqe);
	} 

%>