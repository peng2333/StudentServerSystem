package com.sss.bean;

import javax.persistence.Column;
import javax.persistence.Table;

@Table(name = "food_food_order")
public class FoodFoodOrder {
    private String ordersNmuber;
    private Integer fid;
    private Integer foodNumber;
    private  Double priceSum;

    public void setOrdersNmuber(String ordersNmuber) {
        this.ordersNmuber = ordersNmuber;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public void setFoodNumber(Integer foodNumber) {
        this.foodNumber = foodNumber;
    }

    public void setPriceNum(Double priceSum) {
        this.priceSum = priceSum;
    }

    public String getOrdersNmuber() {

        return ordersNmuber;
    }

    public Integer getFid() {
        return fid;
    }

    public Integer getFoodNumber() {
        return foodNumber;
    }

    public Double getPriceSum() {
        return priceSum;
    }


}
