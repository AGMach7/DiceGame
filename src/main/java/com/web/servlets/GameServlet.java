package com.web.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.info.Dice;
import com.info.GameState;
import com.info.Message;
import com.info.User;
import com.web.helpers.GameContextManagement;

@WebServlet("/back/GameServlet")
public class GameServlet extends HttpServlet {

	private static final String gameStart = "/WEB-INF/vues/back/userHome.jsp";
	private static final String errorPage = "/WEB-INF/vues/back/error.jsp";
	private static final String userHome = "/WEB-INF/vues/back/userHome.jsp";
	private static final String resultsPage = "/WEB-INF/vues/back/resultsPage.jsp";
	private static final int maxDiceCount = 3;

	private static boolean isDiceNumberValid(int diceNumber) {
		return diceNumber > 0 && diceNumber <= 3;
	}

	protected void play(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		GameState gameState = (GameState) session.getAttribute("gameState");
		GameContextManagement gameContext = GameContextManagement.getInstance(getServletContext());

		List<Message> messages = new ArrayList<>();

		int diceNumber = Integer.parseInt(request.getParameter("numDice"));

		if (gameState.getDiceCounter() == maxDiceCount || gameState.isGameOver()) {
			gameState.reinit();
		} else {
			if (!isDiceNumberValid(diceNumber)) {
				messages.add(new Message("Invalid Number", Message.ERROR));
				request.setAttribute("messages", messages);
				getServletContext().getRequestDispatcher(gameStart).forward(request, response);
				return;
			}
			Random randomGenerator = new Random();
			int diceResult = randomGenerator.nextInt(6) + 1;
			Dice dice = new Dice(diceNumber, diceResult);

			ArrayList<Dice> dicelist = (ArrayList<Dice>) session.getAttribute("dicelist");

			if (dicelist == null) {
				dicelist = new ArrayList<>();
				session.setAttribute("dicelist", dicelist);
			}

			if (dicelist.isEmpty()) {
				dicelist.add(dice);
				GameState.incrementDiceCounter();
				messages.add(new Message("Dice " + diceNumber + ": " + diceResult, Message.INFO));
				request.setAttribute("messages", messages);
				getServletContext().getRequestDispatcher(gameStart).forward(request, response);
			} else {
				if (dicelist.stream().anyMatch(d -> d.getDiceNum() == diceNumber)) {
					user.setScore(-1);
					user.setBestScore(user.getScore());
					gameState.reinit();
					messages.add(new Message("Number already exists.", Message.ERROR));
					request.setAttribute("messages", messages);
					getServletContext().getRequestDispatcher(resultsPage).forward(request, response);
					return;
				} else {
					dicelist.add(dice);
					messages.add(new Message("Dice " + diceNumber + ": " + diceResult, Message.INFO));
					request.setAttribute("messages", messages);
					GameState.incrementDiceCounter();
				}
				if (dicelist.size() == 2) {
					boolean stop = false;
					if (dicelist.get(1).getDiceRes() == dicelist.get(0).getDiceRes()) {
						messages.add(new Message("Same result for 2 dices", Message.INFO));
						request.setAttribute("messages", messages);
						stop = true;
					}
					if (dicelist.get(1).getDiceNum() == 2 &&
							(dicelist.get(1).getDiceRes() == 1 || dicelist.get(1).getDiceRes() == 6)) {
						messages.add(new Message("Dice 2 have 1 or 6 as result, there is no need to continue playing", Message.INFO));
						request.setAttribute("messages", messages);
						stop = true;
					}
					if (dicelist.get(0).getDiceNum() * dicelist.get(1).getDiceNum() == 3 &&
							(dicelist.get(0).getDiceRes() == dicelist.get(1).getDiceRes() + 1 ||
									dicelist.get(0).getDiceRes() == dicelist.get(1).getDiceRes() - 1)) {
						messages.add(new Message("Dice 1 and Dice 3, they have two consecutive numbers as results", Message.INFO));
						request.setAttribute("messages", messages);
						stop = true;
					}
					if (stop) {
						user.setBestScore(user.getScore());
						gameState.reinit();
						getServletContext().getRequestDispatcher(resultsPage).forward(request, response);
						return;
					} else {
						getServletContext().getRequestDispatcher(gameStart).forward(request, response);
						return;
					}
				} else if (dicelist.size() == 3) {
					if (dicelist.get(0).getDiceRes() < dicelist.get(1).getDiceRes() &&
							dicelist.get(1).getDiceRes() < dicelist.get(2).getDiceRes()) {
						messages.add(new Message("Dice 1 < Dice 2 < Dice 3\nYour score is the somme of the results", Message.INFO));
						request.setAttribute("messages", messages);
						int result = dicelist.get(0).getDiceRes() + dicelist.get(1).getDiceRes() + dicelist.get(2).getDiceRes();
						user.setScore(result);
						user.setBestScore(user.getScore());
						gameState.reinit();
					} else if (dicelist.get(0).getDiceRes() > dicelist.get(1).getDiceRes() &&
							dicelist.get(1).getDiceRes() > dicelist.get(2).getDiceRes()) {
						messages.add(new Message("Dice 1 > Dice 2 > Dice 3\nYour score is the multiplication of the results", Message.INFO));
						request.setAttribute("messages", messages);
						int result = dicelist.get(0).getDiceRes() * dicelist.get(1).getDiceRes() * dicelist.get(2).getDiceRes();
						user.setScore(result);
						user.setBestScore(user.getScore());
						gameState.reinit();
					} else {
						messages.add(new Message("Try again", Message.INFO));
						request.setAttribute("messages", messages);
						user.setScore(0);
						user.setBestScore(user.getScore());
						gameState.reinit();
					}
					if (dicelist.size() <= 2) {
						getServletContext().getRequestDispatcher(gameStart).forward(request, response);
						return;
					} else if (dicelist.size() == 3) {
						getServletContext().getRequestDispatcher(resultsPage).forward(request, response);
						return;
					}
				}
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
			ServletException, IOException {
		play(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
			ServletException, IOException {
		play(request, response);
	}
}