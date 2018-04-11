<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		<title>Login</title>
		<link href="style.css" rel="stylesheet" type="text/css">
		<jsp:include page="style.css"/>
	</head>
	<body>
		<div class="login-page">
		  <div class="form">
		  
		    <form class="register-form" METHOD=POST ACTION="new_user_regist.jsp">
		      <input type="text" NAME=new_username placeholder="username"/>
		      <input type="password" NAME=new_password placeholder="password"/>
		      <input type="text" NAME=new_fname placeholder="firstname"/>
		      <input type="text" NAME=new_lname placeholder="lastname"/>
		      <button>create</button>
		      <p class="message">Already registered? <a href="#">Sign In</a></p>
		    </form>
		    
		    <form class="login-form" METHOD=POST ACTION="login_data.jsp">
		      <input type="text" NAME=input_username placeholder="username"/>
		      <input type="password" NAME=input_password placeholder="password"/>
		      <button>login</button>
		      <p class="message">Not registered? <a href="#">Create an account</a></p>
		    </form>
		    
		  </div>
		</div>
	</body>
	
<!-- TRANSITION; SIGN IN MENU - CREATE AN ACCOUNT MENU -->
<!-- JAVASCRIPT CODE -->

	<script>
		$('.message a').click(function(){
			$('form').animate({height: "toggle", opacity: "toggle"}, "slow")
		})
	</script>
</html>


