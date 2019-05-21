package com.phonemarket.entity;

public class Areas {
	private String areaId;
	private String areaName;
	private String cityId;
	
	public String getAreaId() {
		return areaId;
	}
	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public String getCityId() {
		return cityId;
	}
	public void setCityId(String cityId) {
		this.cityId = cityId;
	}
	public Areas(String areaId, String areaName, String cityId) {
		super();
		this.areaId = areaId;
		this.areaName = areaName;
		this.cityId = cityId;
	}
	public Areas() {
		super();
	}
}
