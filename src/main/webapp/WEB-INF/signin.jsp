<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Sign In</title>
	<link href="static/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="static/css/stylesheet.css" rel="stylesheet" media="screen">
</head>
<body>
	<c:import url="header.jsp"/>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<form class="form-signin" method="post" action="/signin">
					<h2 class="form-signin-heading">Please Sign In</h2>
					<input class="form-control" type="text" name="username" placeholder="Username" required autofocus>
					<input class="form-control" type="password" name="password" placeholder="Password" required>
					<c:if test="${param.next != null}">
						<input type="hidden" name="next" value="${param.next}">
					</c:if>
					<c:if test="${signinError != null}">			
						<div class="form-group has-error">
			  				<label class="control-label" for="inputError">${signinError}</label>
						</div>
					</c:if>
					<input class="btn btn-lg btn-primary btn-block" type="submit" value="Sign In">
				</form>		
			</div>
		</div>
	</div>	
</body>
</html>

