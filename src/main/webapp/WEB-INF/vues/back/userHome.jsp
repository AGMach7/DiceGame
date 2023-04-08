<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="com.info.GameState"%>
<%@ page language="java" contentType="text/html; charset=windows-1256" pageEncoding="windows-1256"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
		<title>Game App</title>
		<!-- Bootstrap core CSS -->
		<link href="${pageContext.request.contextPath}/style/bootstrap.min.css" rel="stylesheet">
		<!-- Custom styles for this template -->
		<link href="${pageContext.request.contextPath}/style/signin.css" rel="stylesheet">
	</head>

	<body>
	<div class="p-5 text-center bg-primary text-white">
		<h1 class="mb-3">Dice Game</h1>
	</div>
	<br>
	<div class="col">
		<ul class="nav nav-pills nav-fill">
			<a class="nav-item nav-link active" href="${pageContext.request.contextPath}/back/ReinitGameServlet">Home</a>
			<a class="nav-link nav-item" href="${pageContext.request.contextPath}/back/bestScore">Best Scores</a>
			<a class="nav-link nav-item" href="${pageContext.request.contextPath}/back/ReinitGameServlet">Reinitialize the Game</a>
			<a class="nav-link nav-item disabled" href="${pageContext.request.contextPath}/DeconnectServlet">Logout</a>
		</ul>
	</div>
	<br>
	<div class="col">
		<h4>Connected User: <c:out value="${sessionScope.gameState.user.nom}"/></h4>
	</div>
	<br>
	<div class="col">
		<div>
			<h4>My Best Score: <small class="text-muted"><c:out value="${sessionScope.gameState.user.bestScore}"/></small></h4>
		</div>
		<div>
			<form action="${pageContext.request.contextPath}/back/GameServlet">
				<div class="form-row align-items-center">
					<div class="col-sm-3 my-1">
						<input type="text" id="inputDice" class="form-control"
						   placeholder="Dice Number" name="numDice" required>
					</div>
					<div class="col-sm-3 my-1">
						<button class="btn btn-lg btn-primary" type="Submit">Roll the dice</button>
					</div>
				</div>
			</form>
			<c:forEach items="${requestScope.messages}" var="msg">
				<c:choose>
					<c:when test="${msg.type == Message.WARN}">
						<p style="color: red">${msg.text}</p>
					</c:when>
					<c:when test="${msg.type == Message.INFO}">
						<p style="color: green">${msg.text}</p>
					</c:when>
					<c:when test="${msg.type == Message.ERROR}">
						<p style="color: red">${msg.text}</p>
					</c:when>
					<c:otherwise>
						<p >${msg.text}</p>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
	</div>
	</body>

</html>