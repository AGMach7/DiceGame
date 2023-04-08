package com.info;

public class User {

	private String nom;

	private String prenom;

	private String login;

	private String password;

	private double score;
	private double oldScore;

	private double bestScore;

	public User() {
	}

	public User(String nom, String prenom, String login, String password) {
		this.nom = nom;
		this.prenom = prenom;
		this.login = login;
		this.password = password;
		this.score = 0;
		this.bestScore = 0;
	}

	@Override
	public String toString() {
		return "Utilisateur [ nom=" + nom + ", prenom=" + prenom + ", login=" + login  +
			   ", password=" + password + ", score=" + score + ", bestScore=" + bestScore + "]";
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public double getOldScore() {
		return score;
	}

	public void setOldScore(double score) {
		this.score = score;
	}

	public double getBestScore() {
		return bestScore;
	}

	public void setBestScore(double score) {
		if (score > this.bestScore) {
			this.bestScore = score;
		}
	}
}
