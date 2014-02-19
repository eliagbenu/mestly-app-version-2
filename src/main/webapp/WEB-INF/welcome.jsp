<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<title>Welcome to Mestly</title>
	<link href="static/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="static/css/stylesheet.css" rel="stylesheet" media="screen">
</head>
<body>
	<c:import url="header.jsp"/>

	<div class="jumbotron">
		<div class="container">
			<c:if test="${param.deleted != null}">
				<div class="alert alert-success alert-dismissable">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					Your account was successfully deleted. 
				</div>
			</c:if>	
			<h1>Welcome to Mestly</h1>
			<p> Mestly is a social networking application for developers. It helps them create a beautiful online presence and find people with similar interests. It is a prettier version of Linkedin and a competitor to Zerply.</p>
			<p>
				<a class="btn btn-primary btn-lg" role="button" href="/signup">Get started now</a>
			</p>

		</div>
	</div>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>	
</body>
</html>

