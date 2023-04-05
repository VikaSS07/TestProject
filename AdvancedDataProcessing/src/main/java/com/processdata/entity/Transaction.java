package com.processdata.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Transaction
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int transid;
	private double orderId;
	private double date;
	private double order_quantity;
	private double sales;
	private String ship_mode;
	private double profit;
	private double unit_price;
	private String cust_name;
	private String cust_segment;
	private String product_category;
	
	
	public int getTransid() {
		return transid;
	}

	public void setTransid(int transid) {
		this.transid = transid;
	}

	public double getDate() {
		return date;
	}

	@Override
	public String toString() {
		return "Transaction [orderId=" + orderId + ", date=" + date + ", order_quantity=" + order_quantity + ", sales="
				+ sales + ", ship_mode=" + ship_mode + ", profit=" + profit + ", unit_price=" + unit_price
				+ ", cust_name=" + cust_name + ", cust_segment=" + cust_segment + ", product_category="
				+ product_category + "]";
	}

	public void setDate(double date) {
		this.date = date;
	}

	public double getOrderId() {
		return orderId;
	}

	public void setOrderId(double d) {
		this.orderId = d;
	}

	public double getOrder_quantity() {
		return order_quantity;
	}

	public void setOrder_quantity(double d) {
		this.order_quantity = d;
	}
	public double getSales() {
		return sales;
	}
	public void setSales(double sales) {
		this.sales = sales;
	}
	public String getShip_mode() {
		return ship_mode;
	}
	public void setShip_mode(String ship_mode) {
		this.ship_mode = ship_mode;
	}
	public double getProfit() {
		return profit;
	}
	public void setProfit(double profit) {
		this.profit = profit;
	}
	public double getUnit_price() {
		return unit_price;
	}
	public void setUnit_price(double unit_price) {
		this.unit_price = unit_price;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	public String getCust_segment() {
		return cust_segment;
	}
	public void setCust_segment(String cust_segment) {
		this.cust_segment = cust_segment;
	}
	public String getProduct_category() {
		return product_category;
	}
	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	} 
	
}