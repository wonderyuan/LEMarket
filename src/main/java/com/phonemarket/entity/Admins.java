package com.phonemarket.entity;

import java.io.Serializable;
import java.util.Date;

public class Admins implements Serializable{
	private Integer	adminId;
	private String adminName;
	private String adminPass;
	private String adminPhone;
	private Date adminDate;
	private Integer adminState;
	private Role adminRole;
	public Integer getAdminId() {
		return adminId;
	}
	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminPass() {
		return adminPass;
	}
	public void setAdminPass(String adminPass) {
		this.adminPass = adminPass;
	}
	public String getAdminPhone() {
		return adminPhone;
	}
	public void setAdminPhone(String adminPhone) {
		this.adminPhone = adminPhone;
	}
	public Date getAdminDate() {
		return adminDate;
	}
	public void setAdminDate(Date adminDate) {
		this.adminDate = adminDate;
	}
	public Integer getAdminState() {
		return adminState;
	}
	public void setAdminState(Integer adminState) {
		this.adminState = adminState;
	}
	public Role getAdminRole() {
		return adminRole;
	}
	public void setAdminRole(Role adminRole) {
		this.adminRole = adminRole;
	}
	public Admins(Integer adminId, String adminName, String adminPass, String adminPhone, Date adminDate,
			Integer adminState, Role adminRole) {
		super();
		this.adminId = adminId;
		this.adminName = adminName;
		this.adminPass = adminPass;
		this.adminPhone = adminPhone;
		this.adminDate = adminDate;
		this.adminState = adminState;
		this.adminRole = adminRole;
	}
	public Admins() {
		super();
	}
}
