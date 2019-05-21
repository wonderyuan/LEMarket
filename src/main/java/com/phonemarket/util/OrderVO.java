package com.phonemarket.util;

public class OrderVO {
	private Long totalMoney;
	private String orderMonth;
	private Integer sheets;
	public Long getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(Long totalMoney) {
		this.totalMoney = totalMoney;
	}
	public String getOrderMonth() {
		return orderMonth;
	}
	public void setOrderMonth(String orderMonth) {
		this.orderMonth = orderMonth;
	}
	public Integer getSheets() {
		return sheets;
	}
	public void setSheets(Integer sheets) {
		this.sheets = sheets;
	}
	public OrderVO(Long totalMoney, String orderMonth, Integer sheets) {
		super();
		this.totalMoney = totalMoney;
		this.orderMonth = orderMonth;
		this.sheets = sheets;
	}
	public OrderVO() {
		super();
	}
}
