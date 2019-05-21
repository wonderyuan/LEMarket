package com.phonemarket.entity;

import java.io.Serializable;
import java.util.List;

public class Funs  implements Serializable{
	private Integer funId;
	private String funName;
	private String funUrl;
	private Funs funPid;
	private String funTarget;
	private List<Funs> funsList;
	
	public Funs(Integer funId, String funName, String funUrl, Funs funPid, String funTarget, List<Funs> funsList) {
		super();
		this.funId = funId;
		this.funName = funName;
		this.funUrl = funUrl;
		this.funPid = funPid;
		this.funTarget = funTarget;
		this.funsList = funsList;
	}
	public List<Funs> getFunsList() {
		return funsList;
	}
	public void setFunsList(List<Funs> funsList) {
		this.funsList = funsList;
	}
	public Integer getFunId() {
		return funId;
	}
	public void setFunId(Integer funId) {
		this.funId = funId;
	}
	public String getFunName() {
		return funName;
	}
	public void setFunName(String funName) {
		this.funName = funName;
	}
	public String getFunUrl() {
		return funUrl;
	}
	public void setFunUrl(String funUrl) {
		this.funUrl = funUrl;
	}
	public Funs getFunPid() {
		return funPid;
	}
	public void setFunPid(Funs funPid) {
		this.funPid = funPid;
	}
	public String getFunTarget() {
		return funTarget;
	}
	public void setFunTarget(String funTarget) {
		this.funTarget = funTarget;
	}
	public Funs(Integer funId, String funName, String funUrl, Funs funPid, String funTarget) {
		super();
		this.funId = funId;
		this.funName = funName;
		this.funUrl = funUrl;
		this.funPid = funPid;
		this.funTarget = funTarget;
	}
	public Funs() {
		super();
	}
}
