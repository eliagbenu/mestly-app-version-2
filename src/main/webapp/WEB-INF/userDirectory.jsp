<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<title>User Directory : Mestly</title>
	<meta http-equiv="cache-control" content="max-age=0" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
	<meta http-equiv="pragma" content="no-cache" />

	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link href="static/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="static/css/stylesheet.css" rel="stylesheet" media="screen">
    <script src="static/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="static/js/js_user_directory_eli.js" type="text/javascript"></script>        
</head>
<body>

<c:import url="header.jsp"/>
<div class="container">
	<div class="jumbotron">
		<div class="row">
			<div class="col-sm-12">
				<h1 class="user-directory-header">User Directory</h1>
				<p class="user-directory-user-list">
				list collapses to show list of users or no users in list
				</p>				
			</div>
		</div>
	</div>
</div>
</body>
</html>