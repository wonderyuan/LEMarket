package com.phonemarket.entity;

import java.io.Serializable;
import java.util.List;

public class Goods  implements Serializable{
	private Integer goodsId;
	private String goodsName;
	private Double goodsPrice;
	private Integer goodsNum;
	private GoodsType goodsType;
	private Memory goodsMemory;
	private String goodsColor;
	private String goodsImg;
	private Integer goodsState;
	private String goodsDesc;
	private Integer goodsVolume;
	
	private List<Evaluate> evaList;
	
	public List<Evaluate> getEvaList() {
		return evaList;
	}
	public void setEvaList(List<Evaluate> evaList) {
		this.evaList = evaList;
	}
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public Double getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(Double goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public Integer getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(Integer goodsNum) {
		this.goodsNum = goodsNum;
	}
	public GoodsType getGoodsType() {
		return goodsType;
	}
	public void setGoodsType(GoodsType goodsType) {
		this.goodsType = goodsType;
	}
	public Memory getGoodsMemory() {
		return goodsMemory;
	}
	public void setGoodsMemory(Memory goodsMemory) {
		this.goodsMemory = goodsMemory;
	}
	public String getGoodsColor() {
		return goodsColor;
	}
	public void setGoodsColor(String goodsColor) {
		this.goodsColor = goodsColor;
	}
	public String getGoodsImg() {
		return goodsImg;
	}
	public void setGoodsImg(String goodsImg) {
		this.goodsImg = goodsImg;
	}
	public Integer getGoodsState() {
		return goodsState;
	}
	public void setGoodsState(Integer goodsState) {
		this.goodsState = goodsState;
	}
	public String getGoodsDesc() {
		return goodsDesc;
	}
	public void setGoodsDesc(String goodsDesc) {
		this.goodsDesc = goodsDesc;
	}
	public Integer getGoodsVolume() {
		return goodsVolume;
	}
	public void setGoodsVolume(Integer goodsVolume) {
		this.goodsVolume = goodsVolume;
	}
	public Goods() {
		super();
	}
	public Goods(Integer goodsId, String goodsName, Double goodsPrice, Integer goodsNum, GoodsType goodsType,
			Memory goodsMemory, String goodsColor, String goodsImg, Integer goodsState, String goodsDesc,
			Integer goodsVolume) {
		super();
		this.goodsId = goodsId;
		this.goodsName = goodsName;
		this.goodsPrice = goodsPrice;
		this.goodsNum = goodsNum;
		this.goodsType = goodsType;
		this.goodsMemory = goodsMemory;
		this.goodsColor = goodsColor;
		this.goodsImg = goodsImg;
		this.goodsState = goodsState;
		this.goodsDesc = goodsDesc;
		this.goodsVolume = goodsVolume;
	}
	public Goods(String goodsName, Double goodsPrice, Integer goodsNum, GoodsType goodsType,
			Memory goodsMemory, String goodsColor, String goodsImg, String goodsDesc) {
		super();
		this.goodsName = goodsName;
		this.goodsPrice = goodsPrice;
		this.goodsNum = goodsNum;
		this.goodsType = goodsType;
		this.goodsMemory = goodsMemory;
		this.goodsColor = goodsColor;
		this.goodsImg = goodsImg;
		this.goodsDesc = goodsDesc;
	}
}
