<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<title>404</title>
	<link href="/static/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="/static/css/stylesheet.css" rel="stylesheet" media="screen">
</head>
<body>
	<c:import url="header.jsp"/>
	<div class="container">
		<div class="jumbotron">
			<h1>Ooops, something went wrong.</h1>
			<p>Click <a href="/welcome">here</a> to start over again.</p>
		</div>
	</div>
	<script src="/static/js/jquery-1.10.2.min.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>	
</body>
</html>