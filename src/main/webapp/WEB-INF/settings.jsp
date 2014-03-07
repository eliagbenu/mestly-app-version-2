<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Settings</title>
	<link href="static/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="static/css/stylesheet.css" rel="stylesheet" media="screen">
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>	
</head>
<body> 
	<c:import url="header.jsp"/>
	<div class="container">

		Modal Box - upon clicking the “Delete Account” button, trigger a modal box to pop up asking the user if he/she is sure about deleting the account (possible options should be “Yes” or “No”) then continue to process the delete account functionality based upon the user’s answer.

		<div class ="jumbotron">			
			<div class="row">
				<div class="col-md-12">
					<c:if test="${confirmation != null}">
						<div class="alert alert-success alert-dismissable">
							<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
							${confirmation}
						</div>
					</c:if>	
				</div>
				<div class="col-md-4">
					<form method="post" action="/settings" class="form-signin">
						<h2 class="form-signin-heading">Change Password</h2>
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
						<input class="btn btn-lg btn-primary btn-block" type="submit" value="Change Password">				
					</form>
					<hr>
					<h2 class="form-signin-heading">Delete Account</h2>			
					<p class="text-center">This step cannot be undone</p>
					<a type="button" class="btn btn-danger btn-lg btn-block" href="/delete">Delete</a>
				</div>

				<div class="col-md-7 col-md-offset-1">

				</div>

			</div>
		</div>
	</div>


</body>
</html>