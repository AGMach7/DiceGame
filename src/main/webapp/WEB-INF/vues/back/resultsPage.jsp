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
            <h4>Connected User: <c:out value="${sessionScope.gameState.user.nom}" /></h4>

            | <a href="${pageContext.request.contextPath}/back/bestScore">Best Scores</a>
            | <a href="${pageContext.request.contextPath}/back/ReinitGameServlet">Reinitialize the Game</a>
            | <a href="${pageContext.request.contextPath}/DeconnectServlet">Logout</a> |

            <div>
                <h4>Dice Game</h4>
                <div>
                    <h2>Game over!</h2>
                    <div>
                        | Your Score: <c:out value="${sessionScope.gameState.user.score}" />
                        | Best Score: <c:out value="${sessionScope.gameState.user.bestScore}" /> |
                        <table>
                            <c:forEach items="${sessionScope.dicelist}" var="dices">
                                <tr>
                                    <td>Dice ${dices.getDiceNum()} : ${dices.getDiceRes()}</td><br>
                                </tr>
                            </c:forEach>
                        </table>
                        <c:remove var="dicelist" scope="session" />
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>