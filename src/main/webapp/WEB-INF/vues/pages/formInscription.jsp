<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!doctype html>

<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>App Game</title>
		<!-- Bootstrap core CSS -->
		<link href="${pageContext.request.contextPath}/style/bootstrap.min.css" rel="stylesheet">
	</head>

	<body>
		<div class="container">
			<form method="post"
				  action="${pageContext.request.contextPath}/UserManagementServlet">
				<legend>Inscription</legend>
				<p>Enter your information to register on the site</p>

				<div class="form-group">
					<label for="nom">First Name<span class="requis">*</span></label>
					<input type="text" class="form-control" id="nom" name="nom" value="" size="20" maxlength="60"/>
				</div>
				<div class="form-group">
					<label for="prenom">Last Name<span class="requis">*</span></label>
					<input type="text" class="form-control" id="prenom" name="prenom" value="" size="20" maxlength="60" />
				</div>
				<div class="form-group">
					<label for="motdepasse">Password <span class="requis">*</span> </label>
					<input type="password" class="form-control" id="motdepasse" required name="password" value="" size="20" maxlength="20" placeholder="Password">
					<small id="passwordHelpInline" class="text-muted"> Must be 8-20 characters long. </small>
				</div>
				<div class="form-group">
					<label for="nom">User Name</label>
					<input type="text" class="form-control" id="login" required name=login value="" size="20" maxlength="20" />
				</div>

				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
	</body>

</html>