<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Settings</title>
	<link href="static/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="static/css/stylesheet.css" rel="stylesheet" media="screen">
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>	
    <script src="static/js/bootstrap.min.js" type="text/javascript"></script>	    

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

				<!--	<a type="button" class="btn btn-danger btn-lg btn-block" href="/delete">Delete</a>
				-->
					<!-- Button trigger modal -->
					<a type="button" class="btn btn-danger btn-lg btn-block" data-toggle="modal" data-target="#myModal">
					  Delete
					</a>

					<!-- start of Modal -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
					      </div>
					      <div class="modal-body">
					        Are you sure you want to delete your account?

					      </div>
					      <div class="modal-footer">
					        <form action="/delete"> 
					        	<input type="submit" class="btn btn-danger btn-block" value="Yes">
					        </form>					      	
					        <button type="button" class="btn btn-primary btn-block" data-dismiss="modal">No</button>

<!--					        <button type="button" class="btn btn-primary">Save changes</button> -->

					      </div>
					    </div>
					  </div>
					</div>
					<!-- end of Modal -->


				</div>

				<div class="col-md-7 col-md-offset-1">

				</div>

			</div>
		</div>
	</div>


</body>
</html>