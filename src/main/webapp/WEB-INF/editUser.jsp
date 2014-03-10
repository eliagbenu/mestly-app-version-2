<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
	<title>Edit Your Profile</title>  	
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />

	<link href="static/css/bootstrap.min.css" rel="stylesheet" media="screen">	
	<link href="static/css/stylesheet.css" rel="stylesheet" media="screen">    
    <script src="static/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="static/js/bootstrap.min.js" type="text/javascript"></script>	    
    <script src="static/js/js_eli.js" type="text/javascript"></script>        
    <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBRHivIhkXUKCEKeED6vH8kqh2uyCLnQ4Y&sensor=true">
    </script>

	<link href="static/css/google_map_eli.css" rel="stylesheet" type="text/css">    
	<link href="static/css/stylesheet_eli.css" rel="stylesheet" type="text/css">    


  </head>
  <body>

	<c:import url="header.jsp"/>  	
  	<div class="container">
  				<div class="jumbotron">

					<div class="row">
						<div class="col-md-5">
							
							<form method="post" action="/#" class="form-horizontal" role="form" 
							 enctype="multipart/form-data">
								<h2 class="form-signin-heading">Select Image</h2>
								<div class="row">
									<div class="col-md-12">
										<div style="width: 200px; height: 150px;">
											<img src="/static/img/import.png" alt="Picture">
										</div>
									</div>
									
							    </div>
							    <div class="row">
									<div class="col-sm-12">
								    	<input type="file" name="file" size="50" id="file-to-upload"
								    	title="Please upload an image that is 640 x 480 px"
								    	 class="btn btn-default" data-toggle="tooltip" data-placement="left"/>
								    </div>
							    </div>
							    <div class="row">
									<div class="col-sm-12">
								    	<input type="submit" value="Update image" class="btn btn-primary btn-block">
								    </div>
							    </div>							    
							</form>								
						    
						</div>

						<div class="col-md-7">

							<form method="post" action="/addTag" class="form-horizontal" role="form">
								<h2 class="form-signin-heading">Edit Tags</h2>
								<div class="row">
									<div class="col-sm-2">
										<label for="tag"  data-container="body" data-toggle="popover" data-placement="top" data-content="Examples include tech,mester,EIT,staff etc" id="tag-label">Tags
										</label>
									</div>
									<div class="col-sm-8">
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

			<div class="row">
				<form action="/updateLocation" method="post" class="form-horizontal" role="form">
					<div class="col-md-10 col-md-offset-2">
						<h2 class="form-signin-heading">Update location</h2>	

						<c:choose>
						  <c:when test="${user.locationCo_ordinates.size() == 0}">
						    <!--<p class='my_error'> Your location is not set</p>-->
	
						<input type="hidden" id="Init_latField" name="Init_latField" >
						<input type="hidden" id="Init_lngField" name="Init_lngField" >
	
						  </c:when>
						  <c:otherwise>
						    <!--<div class='my_info'>Update your location from latitude ${user.locationCo_ordinates.get(0)} and longitude ${user.locationCo_ordinates.get(1)}</div>	-->

    					<input type="hidden" id="Init_latField" name="Init_latField" value="${user.locationCo_ordinates.get(0)}">
						<input type="hidden" id="Init_lngField" name="Init_lngField" value="${user.locationCo_ordinates.get(1)}">
					  
						  </c:otherwise>
						</c:choose>

						<script src="static/js/js_google_unset_map_eli.js" type="text/javascript"></script>   						    
						<div id="unset-map-canvas">
						</div>		

						<input type="hidden" id="latField" name="latField" >
						<input type="hidden" id="lngField" name="lngField">

				    	<input type="submit" class="btn btn-primary" value="Update location">					
					</div>

				</form>
			</div>

			<div class="row">
				<div class="col-md-3">
					<button type="button" class="btn btn-primary" id="save-all-changes" 
					        data-loading-text="Saving...">Save Changes
					</button>		
				</div>
			</div>

		</div>
  	</div>
				
	    
  </body>
</html>