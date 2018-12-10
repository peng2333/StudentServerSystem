package com.sss.bean;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author 李金发666
 * @date 2018/6/12 16:16
 */
@Table(name = "food_food_orders")
public class FoodOrdersVo2 {
	@Id
	private Food food;
	private Integer foodNumber;
	private Double priceSum;

	public Food getFood() {
		return food;
	}

	public void setFood(Food food) {
		this.food = food;
	}

	public Integer getFoodNumber() {
		return foodNumber;
	}

	public void setFoodNumber(Integer foodNumber) {
		this.foodNumber = foodNumber;
	}

	public Double getPriceSum() {
		priceSum = food.getFprice() * foodNumber;
		return priceSum;
	}

	public void setPriceSum(Double priceSum) {
		this.priceSum = priceSum;
	}
}
