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
<%--        <div class="col">--%>
<%--            <nav class="navbar navbar-dark bg-primary">--%>
<%--                <h4>Dice Game</h4>--%>
<%--            </nav>--%>
<%--        </div>--%>
        <div class="p-5 text-center bg-primary text-white">
            <h1 class="mb-3">Dice Game</h1>
        </div>
        <br>
        <div class="col">
            <h4>Connected User: <c:out value="${sessionScope.gameState.user.nom}"/></h4>
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
        <div>
            <h2>Game over!</h2>
            <br>
            <div>
                | Your Score: <c:out value="${sessionScope.gameState.user.oldScore}" />
                | Best Score: <c:out value="${sessionScope.gameState.user.bestScore}" /> |
            </div>
            <br>
            <div>
                <table>
                    <c:forEach items="${sessionScope.dicelist}" var="dices">
                        <tr>
                            <td>Dice ${dices.getDiceNum()} : ${dices.getDiceRes()}</td>
                        </tr>
                    </c:forEach>
                </table>
                <c:remove var="dicelist" scope="session" />
            </div>
        </div>
    </body>

</html>