package com.phonemarket.entity;

import java.io.Serializable;

public class Banner  implements Serializable{
	private Integer bannerId;
	private String bannerName;
	private String bannerUrl;
	private String bannerImg;
	private Integer bannerState;
	public Integer getBannerId() {
		return bannerId;
	}
	public void setBannerId(Integer bannerId) {
		this.bannerId = bannerId;
	}
	public String getBannerName() {
		return bannerName;
	}
	public void setBannerName(String bannerName) {
		this.bannerName = bannerName;
	}
	public String getBannerUrl() {
		return bannerUrl;
	}
	public void setBannerUrl(String bannerUrl) {
		this.bannerUrl = bannerUrl;
	}
	public String getBannerImg() {
		return bannerImg;
	}
	public void setBannerImg(String bannerImg) {
		this.bannerImg = bannerImg;
	}
	public Integer getBannerState() {
		return bannerState;
	}
	public void setBannerState(Integer bannerState) {
		this.bannerState = bannerState;
	}
	public Banner(Integer bannerId, String bannerName, String bannerUrl, String bannerImg, Integer bannerState) {
		super();
		this.bannerId = bannerId;
		this.bannerName = bannerName;
		this.bannerUrl = bannerUrl;
		this.bannerImg = bannerImg;
		this.bannerState = bannerState;
	}
	public Banner() {
		super();
	}
}
