<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="navbar navbar-default navbar-static-top" role="navigation">
  	<div class="container">

		<div class="navbar-header">
  			<a href="/dashboard"><img class="logo" src="/static/MestlyLogoSmall.png" height="40"></a>
		</div>    	
		<div class="navbar-collapse collapse">
			<c:choose>
				<c:when test="${sessionScope.username != null}">
					<ul class="nav navbar-nav navbar-right">
			        	<li><a href="/logout">Logout</a></li>
			        	<li><a href="/userDirectory">User Directory</a></li>			        	
			        	<li><a href="/user/${sessionScope.username}">View Profile</a></li>
			        	<li><a href="/editUser">Edit My Profile</a></li>
			        	<li><a href="/dashboard">Dashboard</a></li>			        	
			      	  	<li><a href="/settings">Settings</a></li>
			      	  	<li><a href="/settings">${sessionScope.username}</a></li>			      	  	
		      		</ul>
				</c:when>
				<c:otherwise>
					<ul class="nav navbar-nav navbar-right">
			        	<li><a class="user-directory-menu-item" href="/userDirectory">User Directory</a></li>
			        	<li><a href="/signup">Sign Up</a></li>			        	
			      	  	<li><a href="/signin">Sign In</a></li>			      	  	
		      		</ul>
				</c:otherwise>
			</c:choose>	      	
    	</div>
  	</div>
</div>
   

       
