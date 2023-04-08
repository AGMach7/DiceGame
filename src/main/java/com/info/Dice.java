package com.info;

public class Dice {
	
	private int diceNum;
	private int diceRes;

	public Dice(int diceNum, int diceRes) {
		this.diceNum = diceNum;
		this.diceRes = diceRes;
	}

	public int getDiceNum() {
		return diceNum;
	}

	public void setDiceNum(int diceNum) {
		this.diceNum = diceNum;
	}

	public int getDiceRes() {
		return diceRes;
	}

	public void setDiceRes(int diceRes) {
		this.diceRes = diceRes;
	}

	public String toString(){
		return "[Dice Num: "+this.getDiceNum()+", Dice Res: "+this.getDiceRes()+"]";
	}
}