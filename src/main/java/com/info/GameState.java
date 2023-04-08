package com.info;

import java.util.ArrayList;
import java.util.List;

public class GameState {

	private User user;

	private boolean gameOver = false;

	private List<Message> messages = new ArrayList<Message>();

	private static int diceCounter = 0;

	public int getDiceCounter() {
		return diceCounter;
	}

	public void setDiceCounter(int diceCounter) {
		this.diceCounter = diceCounter;
	}

	public static void incrementDiceCounter(){
		diceCounter += 1;
	}

	public void reinit() {
		gameOver = false;
		messages = new ArrayList<Message>();
		user.setOldScore(user.getScore());
		user.setScore(0);
		this.diceCounter = 0;
	}

	public String toString() {
		return "GameState [Score=" + user.getScore() + ", messages=" + messages + "]";
	}

	public void addMessage(Message ms) {
		messages.add(ms);
	}

	public GameState(User user) {
		this.user = user;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public boolean isGameOver() {
		return gameOver;
	}

	public void setGameOver(boolean gameOver) {
		this.gameOver = gameOver;
	}

	public List<Message> getMessages() {
		return messages;
	}

	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}
}
