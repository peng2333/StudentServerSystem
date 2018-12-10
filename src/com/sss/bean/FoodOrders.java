package com.sss.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author 李金发666
 * @date 2018/6/8 16:38
 * 外卖订单对象
 */

@Table(name = "food_orders")
public class FoodOrders {
	@Id
    @Column(name = "orders_number")
	private String ordersNumber;    // 订单编号 k

    @Column(name = "create_time")
	private String createTime;        // 订单创建时间 k

    @Column(name = "orders_remark")
	private String ordersRemark;    // 订单备注 k

    @Column(name = "orders_price")
	private Double ordersPrice;     // 订单总价

    @Column(name = "orders_state")
	private Integer ordersState;    // 订单状态 k

	private Integer sid;            // 订单对应商家id

	private Integer uid;            // 订单对应用户id k


	private List<FoodOrdersVo2> foodVoList;    // 订单所包含的商品

	public String getOrdersNumber() {
		return ordersNumber;
	}

	public void setOrdersNumber(String ordersNumber) {
		this.ordersNumber = ordersNumber;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public Double getOrdersPrice() {
		return ordersPrice;
	}

	public void setOrdersPrice(Double ordersPrice) {
		this.ordersPrice = ordersPrice;
	}

	public String getOrdersRemark() {
		return ordersRemark;
	}

	public void setOrdersRemark(String ordersRemark) {
		this.ordersRemark = ordersRemark;
	}

	public Integer getOrdersState() {
		return ordersState;
	}

	public void setOrdersState(Integer ordersState) {
		this.ordersState = ordersState;
	}

	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public List<FoodOrdersVo2> getFoodVoList() {
		return foodVoList;
	}

	public void setFoodVoList(List<FoodOrdersVo2> foodVoList) {
		this.foodVoList = foodVoList;
	}
}
