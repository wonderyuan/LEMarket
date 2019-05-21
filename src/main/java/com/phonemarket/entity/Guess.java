package com.phonemarket.entity;

import java.io.Serializable;

public class Guess  implements Serializable{

	private Integer guessId;
	private Goods guessGoods;
	private Integer guessNum;
	private Integer favorite;
	private Users guessUser;
	public Integer getGuessId() {
		return guessId;
	}
	public void setGuessId(Integer guessId) {
		this.guessId = guessId;
	}
	public Goods getGuessGoods() {
		return guessGoods;
	}
	public void setGuessGoods(Goods guessGoods) {
		this.guessGoods = guessGoods;
	}
	public Integer getGuessNum() {
		return guessNum;
	}
	public void setGuessNum(Integer guessNum) {
		this.guessNum = guessNum;
	}
	public Integer getFavorite() {
		return favorite;
	}
	public void setFavorite(Integer favorite) {
		this.favorite = favorite;
	}
	public Users getGuessUser() {
		return guessUser;
	}
	public void setGuessUser(Users guessUser) {
		this.guessUser = guessUser;
	}
	public Guess(Integer guessId, Goods guessGoods, Integer guessNum, Integer favorite, Users guessUser) {
		super();
		this.guessId = guessId;
		this.guessGoods = guessGoods;
		this.guessNum = guessNum;
		this.favorite = favorite;
		this.guessUser = guessUser;
	}
	public Guess(Goods guessGoods, Integer guessNum, Integer favorite, Users guessUser) {
		super();
		this.guessGoods = guessGoods;
		this.guessNum = guessNum;
		this.favorite = favorite;
		this.guessUser = guessUser;
	}
	public Guess() {
		super();
	}
}
