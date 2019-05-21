package com.phonemarket.entity;

public class Provinces {
	private String provinceId;
	private String provinceName;
	public String getProvinceId() {
		return provinceId;
	}
	public void setProvinceId(String provinceId) {
		this.provinceId = provinceId;
	}
	public String getProvinceName() {
		return provinceName;
	}
	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}
	public Provinces() {
		super();
	}
	public Provinces(String provinceId, String provinceName) {
		super();
		this.provinceId = provinceId;
		this.provinceName = provinceName;
	}
}
