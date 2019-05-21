package com.phonemarket.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Order  implements Serializable{
	private String orderId;
	private Users orderUser;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date orderDate;
	private Double orderPrice;
	private Integer orderState;
	private String orderUserName;
	private String orderPhone;
	private String orderAddress;
	private String orderExpressNo;
	private List<OrderDetail> detailList;
	
	public Order(String orderId, Users orderUser, Date orderDate, Double orderPrice, Integer orderState,
			String orderUserName, String orderPhone, String orderAddress, String orderExpressNo,
			List<OrderDetail> detailList) {
		super();
		this.orderId = orderId;
		this.orderUser = orderUser;
		this.orderDate = orderDate;
		this.orderPrice = orderPrice;
		this.orderState = orderState;
		this.orderUserName = orderUserName;
		this.orderPhone = orderPhone;
		this.orderAddress = orderAddress;
		this.orderExpressNo = orderExpressNo;
		this.detailList = detailList;
	}
	public String getOrderExpressNo() {
		return orderExpressNo;
	}
	public void setOrderExpressNo(String orderExpressNo) {
		this.orderExpressNo = orderExpressNo;
	}
	public List<OrderDetail> getDetailList() {
		return detailList;
	}
	public void setDetailList(List<OrderDetail> detailList) {
		this.detailList = detailList;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public Users getOrderUser() {
		return orderUser;
	}
	public void setOrderUser(Users orderUser) {
		this.orderUser = orderUser;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public Double getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(Double orderPrice) {
		this.orderPrice = orderPrice;
	}
	public Integer getOrderState() {
		return orderState;
	}
	public void setOrderState(Integer orderState) {
		this.orderState = orderState;
	}
	public String getOrderUserName() {
		return orderUserName;
	}
	public void setOrderUserName(String orderUserName) {
		this.orderUserName = orderUserName;
	}
	public String getOrderPhone() {
		return orderPhone;
	}
	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}
	public String getOrderAddress() {
		return orderAddress;
	}
	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}
	public Order(String orderId, Users orderUser, Date orderDate, Double orderPrice, Integer orderState,
			String orderUserName, String orderPhone, String orderAddress) {
		super();
		this.orderId = orderId;
		this.orderUser = orderUser;
		this.orderDate = orderDate;
		this.orderPrice = orderPrice;
		this.orderState = orderState;
		this.orderUserName = orderUserName;
		this.orderPhone = orderPhone;
		this.orderAddress = orderAddress;
	}
	public Order( Users orderUser, Date orderDate, Double orderPrice, Integer orderState,
			String orderUserName, String orderPhone, String orderAddress) {
		super();
		this.orderUser = orderUser;
		this.orderDate = orderDate;
		this.orderPrice = orderPrice;
		this.orderState = orderState;
		this.orderUserName = orderUserName;
		this.orderPhone = orderPhone;
		this.orderAddress = orderAddress;
	}
	public Order() {
		super();
	}
}
