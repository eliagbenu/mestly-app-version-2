<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Sign Up to Mestly</title>
	<link href="static/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="static/css/stylesheet.css" rel="stylesheet" media="screen">
</head>
<body> 
	<c:import url="header.jsp"/>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<form method="post" action="/signup" class="form-signin">
					<h2 class="form-signin-heading">This is what we need from you..</h2>
					<c:choose>
						<c:when test="${usernameError == null}">
							<input class="form-control" type="text" name="username" placeholder="Username" required autofocus>
						</c:when>
						<c:otherwise>
							<div class="form-group has-error">
				  				<label class="control-label" for="inputError">${usernameError}</label>
				  				<input class="form-control" id="inputError" type="text" name="username" placeholder="Username" required autofocus>
							</div>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${firstnameError == null}">
							<input class="form-control" type="text" name="firstname" placeholder="First Name" required>
						</c:when>
						<c:otherwise>
							<div class="form-group has-error">
				  				<label class="control-label" for="inputError">${firstnameError}</label>
				  				<input class="form-control" id="inputError" type="text" name="firstname" placeholder="First Name" required>
							</div>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${lastnameError == null}">
							<input class="form-control" type="text" name="lastname" placeholder="Last Name" required>
						</c:when>
						<c:otherwise>
							<div class="form-group has-error">
				  				<label class="control-label" for="inputError">${lastnameError}</label>
				  				<input class="form-control" id="inputError" type="text" name="lastname" placeholder="Last Name" required>
							</div>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${emailError == null}">
							<input class="form-control" type="text" name="email" placeholder="Email" required>
						</c:when>
						<c:otherwise>
							<div class="form-group has-error">
				  				<label class="control-label" for="inputError">${emailError}</label>
				  				<input class="form-control" id="inputError" type="text" name="email" placeholder="Email" required>
							</div>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${passwordError == null}">
							<input class="form-control" type="password" name="password" placeholder="Password" required>
						</c:when>
						<c:otherwise>
							<div class="form-group has-error">
				  				<label class="control-label" for="inputError">${passwordError}</label>
				  				<input class="form-control" id="inputError" type="password" name="password" placeholder="Password" required>
							</div>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${confirmPasswordError == null}">
							<input class="form-control" type="password" name="confirmPassword" placeholder="Enter Password again" required>
						</c:when>
						<c:otherwise>
							<div class="form-group has-error">
				  				<label class="control-label" for="inputError">${confirmPasswordError}</label>
				  				<input class="form-control" id="inputError" type="password" name="confirmPassword" placeholder="Enter Password again" required>
							</div>
						</c:otherwise>
					</c:choose>	
					<c:if test="${credentialsError != null}">
						<div class="form-group has-error">
							<label class="control-label" for="inputError">${credentialsError}</label>
						</div>
					</c:if>
					<input type="submit" value="Signup" class="btn btn-lg btn-primary btn-block" >
				</form>
			</div>
		</div>
	</div>
</body>
</html>  