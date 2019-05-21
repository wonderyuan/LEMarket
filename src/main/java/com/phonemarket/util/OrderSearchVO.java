package com.phonemarket.util;

public class OrderSearchVO {
	private String orderIdKeyword;
	private String startDate;
	private String endDate;
	private String orderState;
	public String getOrderIdKeyword() {
		return orderIdKeyword;
	}
	public void setOrderIdKeyword(String orderIdKeyword) {
		this.orderIdKeyword = orderIdKeyword;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getOrderState() {
		return orderState;
	}
	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}
	public OrderSearchVO(String orderIdKeyword, String startDate, String endDate, String orderState) {
		super();
		this.orderIdKeyword = orderIdKeyword;
		this.startDate = startDate;
		this.endDate = endDate;
		this.orderState = orderState;
	}
	public OrderSearchVO() {
		super();
	}
}
