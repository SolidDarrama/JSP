<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>User Homepage</title>
		<link href="style.css" rel="stylesheet" type="text/css">
		<jsp:include page="style.css"/>
	</head>
	
<!-- THE HEADER TAG CONTAINS THE USER'S HOMEPAGE BANNER -->
	<header>
	  <figure class="profile-banner">
	  	<img src="https://unsplash.it/975/300" alt="Profile banner" />
	  </figure>

	  <figure class="profile-picture" 
	    style="background-image: url('http://unsplash.it/150/150')">
	  </figure>
	  
	  <div class="profile-stats">
	    <ul>
	      <li>2 <span>Projects</span></li>
	      <li>0 <span>Commits</span></li>
	      <li>4 <span>Following</span></li>
	      <li>10<span>Followers</span></li>
	    </ul>
	    <a href="javascript:void(0);" class="follow">
	      Follow <%= session.getAttribute("theUsername") %>
	    </a>
	  </div>
	  
	  <h1><%= session.getAttribute("theUsername") %><small>  District Beatz Member</small></h1>

	
<!-- ADDED MYFUNCTON - JAVASCRIPT CODE; REVEALS OPTION TO CHANGE PASSWORD -->
		<div style="position: relative; z-index: 1; background-color: white;">
			<button onclick="myFunction()">Update Password</button>
		
			<div id="myDIV" style="display: none">
			  	<form action="update_password.jsp" method="post">
					<table>
						<tr><td>Current Password</td><td><input type="password" name="current" ></td></tr>
						<tr><td>New Password</td><td><input type="password" name="new"></td></tr>
						<tr><td>Confirm Password</td><td><input type="password" name="confirm"></td></tr>
						<tr><td><input type="submit" value="Change Password"></td></tr>
					</table>
				</form>
			</div>
			
			<script language="javascript">
				function myFunction() {
				    var x = document.getElementById("myDIV");
				    if (x.style.display === "none") {
				        x.style.display = "block";
				    } else {
				        x.style.display = "none";
				    }
				}
			</script>
		</div>	
	</header>

</html>