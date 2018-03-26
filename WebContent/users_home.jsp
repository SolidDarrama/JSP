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
	      Follow <%= session.getAttribute( "theName" ) %>
	    </a>
	  </div>
	  
	  <h1><%= session.getAttribute( "theName" ) %><small>  District Beatz Member</small></h1>
	</header>
</html>