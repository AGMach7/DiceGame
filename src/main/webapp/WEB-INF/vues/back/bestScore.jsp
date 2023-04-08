<%@page import="com.info.User"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=windows-1256" pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<!-- Bootstrap core CSS -->
		<link href="${pageContext.request.contextPath}/style/bootstrap.min.css" rel="stylesheet">
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
		<title>App Game</title>
	</head>

	<body>
		<h1>Meilleurs scores </h1>
		<table class="table">
			<c:forEach items="${requestScope.users}" var="user">
				<tr>
					<td>${user.nom}  ${user.prenom}</td>
					<td>${user.bestScore}</td>
				</tr>
			</c:forEach>
		</table>
	</body>

</html>