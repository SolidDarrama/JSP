<!-- 	JSP CODE; RETRIEVING NAME -->
<%
   String name = request.getParameter( "username" );
   session.setAttribute( "theName", name );
%>
<HTML>
	<head>
		<title>Login Redirect</title>
		<link href="style.css" rel="stylesheet" type="text/css">
		<jsp:include page="style.css"/>
		<meta http-equiv="refresh" content="1.5;users_home.jsp" />
	</head>
	<body>
		<p>REDIRECTING YOU TO HOMEPAGE...</p>
	</body>
</HTML>