<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- THESE IMPORT STATEMENTS ARE NEEDED TO RUN THE SQL QUERIES, THEY ARE PART OF THE JDK. -->
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.*,java.util.*"%>
<%@ page import="java.sql.*" %> 


<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Shopping Cart</title>
		<link href="style.css" rel="stylesheet" type="text/css">
		<jsp:include page="style.css"/>
	</head>
	<body>
	
		<%
			try
			{
				// NEEDED TO USE CONNECTOR/J JDBC DRIVER.
				Class.forName("com.mysql.jdbc.Driver");
				//SELECTING THE LAST ROW WITHIN THE TABLE: checkbox
				String query="SELECT * FROM checkbox ORDER BY id DESC LIMIT 1;";
				//OPEN NEW CONNECTION.
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/Users?user=root");
				// GENERATE THE SQL QUERY.
				Statement stmt = conn.createStatement();
				// ASSIGNS THE SQL QUERY TO ResultSet VARIABLE
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
		%>
		<!-- 	THE HTML IS DISPLAYED AND FUNCTIONING ONLY WHEN THE JSP WHILE STATEMENT IS APPROVED -->
					<tr>
						<p style="font-size: 35px;">Shopping Cart</p>
						<p id="date"></p>
						<p style="font-size: 20px;">Current Selected Items List</p>
					    <td><%=rs.getString("name") %></td>
					    <p style="font-size: 20px;">Shipping Information</p>
					</tr>
					
					<!-- RETREIVES THE USER INPUT FOR SHIPPING REQUEST FOUND ON album_process.jsp -->
					<% 	out.println(request.getParameter("FullName")); %><br>
					<% 	out.println(request.getParameter("Address")); %><br>
					<% 	out.println(request.getParameter("City")); %><br>
					<% 	out.println(request.getParameter("State")); %>
		
					<FORM NAME="form1" METHOD="POST">
				         <br><INPUT TYPE="HIDDEN" NAME="buttonName">
				        <INPUT TYPE="BUTTON" VALUE="CLEAR CART" ONCLICK="button1()">
		    		</FORM>
		    		
		    		<script language="Javascript">
						// 	FUNCTION CONJUNCTION WITH TR TAGS BELOW
						// TO SHOWCASE THE DATE BELOW WITHIN THE TR TAGS, LOCATED BELOW
						var d = new Date();
						document.getElementById("date").innerHTML = d;
						// FUNCTION CONJUNCTION WITH FORM/INPUT BELOW
						// FUNCTION TO DELETE EVERY ROW WITHIN THE GIVEN DATABASE TABLE
					    function button1()
					    {
					        document.form1.buttonName.value = "yes";
					        form1.submit();
					    } 
					</script>
		<%
				}
				// 	JSP FUNCTION C0NJECTION WITH THE CODE FORM/INPUT ABOVE
		        if(request.getParameter("buttonName") != null) {
				    // Use TRUNCATE
				    String sql = "TRUNCATE checkbox";
				    // Execute deletion
				    stmt.executeUpdate(sql);
				    // Use DELETE
				    sql = "DELETE FROM checkbox";
				    // Execute deletion
				    stmt.executeUpdate(sql);
		        }
				// CLOSE THE CONNECTION.
			    rs.close();
			    stmt.close();
			    conn.close();
			}
			// PRINTS EXCEPTION ERRORS
			catch(Exception e)
			{
				e.printStackTrace();
			}
		%>
		
	</body>
</html>