package com.phonemarket.entity;

import java.io.Serializable;
import java.util.List;

public class Role  implements Serializable{
	private Integer roleId;
	private String roleName;
	private List<Funs> roleFuns;
	
	
	public Role(Integer roleId, String roleName, List<Funs> roleFuns) {
		super();
		this.roleId = roleId;
		this.roleName = roleName;
		this.roleFuns = roleFuns;
	}
	public List<Funs> getRoleFuns() {
		return roleFuns;
	}
	public void setRoleFuns(List<Funs> roleFuns) {
		this.roleFuns = roleFuns;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public Role() {
		super();
	}
	public Role(Integer roleId, String roleName) {
		super();
		this.roleId = roleId;
		this.roleName = roleName;
	}
}
