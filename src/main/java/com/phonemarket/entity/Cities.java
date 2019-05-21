package com.phonemarket.entity;

public class Cities {
	private String cityId;
	private String cityName;
	private String provinceId;
	
	public String getCityId() {
		return cityId;
	}
	public void setCityId(String cityId) {
		this.cityId = cityId;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getProvinceId() {
		return provinceId;
	}
	public void setProvinceId(String provinceId) {
		this.provinceId = provinceId;
	}
	public Cities(String cityId, String cityName, String provinceId) {
		super();
		this.cityId = cityId;
		this.cityName = cityName;
		this.provinceId = provinceId;
	}
	public Cities() {
		super();
	}
}
