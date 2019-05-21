package com.phonemarket.entity;

import java.io.Serializable;

public class Evaimg  implements Serializable{
	private Integer evaimgId;
	private String evaimgName;
	private Integer eva;
	
	
	public Integer getEvaimgId() {
		return evaimgId;
	}
	public void setEvaimgId(Integer evaimgId) {
		this.evaimgId = evaimgId;
	}
	public String getEvaimgName() {
		return evaimgName;
	}
	public void setEvaimgName(String evaimgName) {
		this.evaimgName = evaimgName;
	}
	public Integer getEva() {
		return eva;
	}
	public void setEva(Integer eva) {
		this.eva = eva;
	}
	public Evaimg(Integer evaimgId, String evaimgName, Integer eva) {
		super();
		this.evaimgId = evaimgId;
		this.evaimgName = evaimgName;
		this.eva = eva;
	}
	public Evaimg(String evaimgName, Integer eva) {
		super();
		this.evaimgName = evaimgName;
		this.eva = eva;      
	}
	public Evaimg() {
		super();
	}
}
