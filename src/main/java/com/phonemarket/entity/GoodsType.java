package com.phonemarket.entity;

import java.io.Serializable;
import java.util.List;

public class GoodsType  implements Serializable{
	private Integer typeId;
	private String typeName;
	private Integer typePid;
	private Integer typeLv;
	private String typePath;
	private Integer typeState;
	private List<Goods> goodsList;
	
	public List<Goods> getGoodsList() {
		return goodsList;
	}
	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
	}
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public Integer getTypePid() {
		return typePid;
	}
	public void setTypePid(Integer typePid) {
		this.typePid = typePid;
	}
	public Integer getTypeLv() {
		return typeLv;
	}
	public void setTypeLv(Integer typeLv) {
		this.typeLv = typeLv;
	}
	public String getTypePath() {
		return typePath;
	}
	public void setTypePath(String typePath) {
		this.typePath = typePath;
	}
	public Integer getTypeState() {
		return typeState;
	}
	public void setTypeState(Integer typeState) {
		this.typeState = typeState;
	}
	public GoodsType(Integer typeId, String typeName, Integer typePid, Integer typeLv, String typePath,
			Integer typeState) {
		super();
		this.typeId = typeId;
		this.typeName = typeName;
		this.typePid = typePid;
		this.typeLv = typeLv;
		this.typePath = typePath;
		this.typeState = typeState;
	}
	public GoodsType() {
		super();
	}
}
