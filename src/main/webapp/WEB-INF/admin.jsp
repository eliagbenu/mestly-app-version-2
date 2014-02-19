<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Admin Page</title>
		<link href="static/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<link href="static/css/stylesheet.css" rel="stylesheet" media="screen">
	</head>
	<body>
		<div class="jumbotron text-center">
			<h1>Hello Admin!</h1>
			<form action="/admin" method="post">
				<input class="btn btn-primary btn-large" type="submit" value="Configure Database">
			</form>
			<c:choose>
				<c:when test="${param.status == 'success'}">
					<p>Success!</p>
				</c:when>
				<c:when test="${param.status == 'fail'}">
					<p>Failed :(</p>
				</c:when>
			</c:choose>
		</div>
	</body>
</html>