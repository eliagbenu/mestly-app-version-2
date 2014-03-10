<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>Mestly Profile</title>
  <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />

  <link href="/static/css/bootstrap.min.css" rel="stylesheet" media="screen">  
  <link href="/static/css/stylesheet.css" rel="stylesheet" media="screen">    
    <script src="/static/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="/static/js/bootstrap.min.js" type="text/javascript"></script>     
    <script src="/static/js/js_eli.js" type="text/javascript"></script>        
    <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBRHivIhkXUKCEKeED6vH8kqh2uyCLnQ4Y&sensor=true">
    </script>
 

  <link href="/static/css/google_map_eli.css" rel="stylesheet" type="text/css">    

</head>
<body>
  <c:import url="header.jsp"/>
  <div class="container">
    <div class="jumbotron">
    	<div class="row">
	      <div class="col-sm-12">
            <h2 class="form-signin-heading">View Profile</h2>  


            <c:choose>
              <c:when test="${user.locationCo_ordinates.get(0) == null }">
            
            <input type="hidden" id="Init1_latField">
            <input type="hidden" id="Init1_lngField">


              </c:when>
              <c:otherwise>
            
            <input type="hidden" id="Init1_latField" value="${user.locationCo_ordinates.get(0)}">
            <input type="hidden" id="Init1_lngField" value="${user.locationCo_ordinates.get(1)}">

              </c:otherwise>
            </c:choose>

            <input type="hidden" id="Init1_latField" value="${user.locationCo_ordinates.get(0)}">
            <input type="hidden" id="Init1_lngField" value="${user.locationCo_ordinates.get(1)}">

            <script src="/static/js/js_google_plain_map_eli.js" type="text/javascript"></script>                   
            <div id="map-canvas">
            </div>    

          </div>
	      </div>
    	</div>
      
    </div>
  </div>
</body>
</html>