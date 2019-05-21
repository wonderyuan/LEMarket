package com.phonemarket.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Evaluate  implements Serializable{
	private Integer evaId;
	private Users evaUser;
	private String evaContent;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date evaDate;
	private Goods evaGoods;
	private Integer evaState;
	private Integer evaLevel;
	private List<Evaimg> imgList;
	
	public Evaluate(Integer evaId, Users evaUser, String evaContent, Date evaDate, Goods evaGoods, Integer evaState,
			Integer evaLevel, List<Evaimg> imgList) {
		super();
		this.evaId = evaId;
		this.evaUser = evaUser;
		this.evaContent = evaContent;
		this.evaDate = evaDate;
		this.evaGoods = evaGoods;
		this.evaState = evaState;
		this.evaLevel = evaLevel;
		this.imgList = imgList;
	}
	public List<Evaimg> getImgList() {
		return imgList;
	}
	public void setImgList(List<Evaimg> imgList) {
		this.imgList = imgList;
	}
	public Integer getEvaId() {
		return evaId;
	}
	public void setEvaId(Integer evaId) {
		this.evaId = evaId;
	}
	public Users getEvaUser() {
		return evaUser;
	}
	public void setEvaUser(Users evaUser) {
		this.evaUser = evaUser;
	}
	public String getEvaContent() {
		return evaContent;
	}
	public void setEvaContent(String evaContent) {
		this.evaContent = evaContent;
	}
	public Date getEvaDate() {
		return evaDate;
	}
	public void setEvaDate(Date evaDate) {
		this.evaDate = evaDate;
	}
	public Goods getEvaGoods() {
		return evaGoods;
	}
	public void setEvaGoods(Goods evaGoods) {
		this.evaGoods = evaGoods;
	}
	public Integer getEvaState() {
		return evaState;
	}
	public void setEvaState(Integer evaState) {
		this.evaState = evaState;
	}
	public Integer getEvaLevel() {
		return evaLevel;
	}
	public void setEvaLevel(Integer evaLevel) {
		this.evaLevel = evaLevel;
	}
	public Evaluate(Integer evaId, Users evaUser, String evaContent, Date evaDate, Goods evaGoods, Integer evaState,
			Integer evaLevel) {
		super();
		this.evaId = evaId;
		this.evaUser = evaUser;
		this.evaContent = evaContent;
		this.evaDate = evaDate;
		this.evaGoods = evaGoods;
		this.evaState = evaState;
		this.evaLevel = evaLevel;
	}
	public Evaluate(Users evaUser, String evaContent, Date evaDate, Goods evaGoods, Integer evaState,
			Integer evaLevel) {
		super();
		this.evaUser = evaUser;
		this.evaContent = evaContent;
		this.evaDate = evaDate;
		this.evaGoods = evaGoods;
		this.evaState = evaState;
		this.evaLevel = evaLevel;
	}
	public Evaluate() {
		super();
	}
}
