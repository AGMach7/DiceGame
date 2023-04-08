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
		<div class="col">
			<h4>connected User: <c:out value="${sessionScope.gameState.user.nom}" /></h4>

			| <a href="${pageContext.request.contextPath}/back/bestScore">Best Scores</a>
			| <a href="${pageContext.request.contextPath}/back/ReinitGameServlet">Reinitialize the Game</a>
			| <a href="${pageContext.request.contextPath}/DeconnectServlet">Logout</a> |

			<div>
				<h4>My Best Score</h4>
				<c:out value="${sessionScope.gameState.user.bestScore}" />

				<div>
					<h4>Jeu de dé</h4>
					<form action="${pageContext.request.contextPath}/back/GameServlet">
						<div class="form-row align-items-center">
							<div class="col-sm-3 my-1">
								<input type="text" id="inputDice" class="form-control"
								   placeholder="Dice Number" name="numDice" required>
							</div>
							<div class="col-sm-3 my-1">
								<button class="btn btn-lg btn-primary btn-block" type="Submit">Lancer le dé</button>
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
		</div>
	</body>

</html>