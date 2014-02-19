<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Settings</title>
	<link href="static/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="static/css/stylesheet.css" rel="stylesheet" media="screen">
</head>
<body> 
	<c:import url="header.jsp"/>
	<div class="container">
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
					<form method="post" action="/addTag" class="form-horizontal" role="form">
						<h2 class="form-signin-heading">Edit Tags</h2>
						<div class="row">
							<div class="col-sm-10">
						    	<input type="text" class="form-control" name="tag" placeholder="Use tags to describe who you are.">
						    </div>
							<div class="col-sm-2">
						    	<button type="submit" class="btn btn-primary btn-block">Add</button>
						    </div>
					    </div>
					</form>
					<c:if test="${param.tagError != null}">
						<div class="alert alert-danger alert-dismissable">
							<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
							A tag must be at least 2 characters long.
						</div>
					</c:if>
					<div class="row">
						<div class="col-sm-12">
							<c:forEach items="${user.tagList}" var="tag">
								<a type="button" class="btn btn-primary tagButton" href="/removeTag?tag=${tag}" rows="5">${tag} <span class="glyphicon glyphicon-remove"></span></a>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>			
</body>
</html>