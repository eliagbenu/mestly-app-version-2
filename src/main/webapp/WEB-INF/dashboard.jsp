<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<title>Mestly Dashboard</title>
	<link href="static/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="static/css/stylesheet.css" rel="stylesheet" media="screen">
</head>
<body>
	<c:import url="header.jsp"/>
	<div class="container">
		<div class="jumbotron">
			<p>Username: ${user.username}</p>
			<p>Email: ${user.email}</p>
		</div>
	</div>
</body>
</html>