package com.sss.bean;

import javax.persistence.Column;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;

/**
 * @program: StudentServerSystem
 * @author: 朱元浩
 * @create: 2018-06-11 08:41
 **/
@Table(name = "food_sort")
public class FoodSort {

    @Column(name = "sort_id")
	private Integer sortId;     //分类id
	private List<Food> foodList = new ArrayList<>();

    @Column(name = "sort_name")
    private String sortName;    //分类名字

    @Column(name = "shop_id")
    private Integer shopId;     //商家id

    public FoodSort() {
    }

    public Integer getSortId() {

        return sortId;
    }

    public void setSortId(Integer sortId) {
        this.sortId = sortId;
    }

    public String getSortName() {
        return sortName;
    }

    public void setSortName(String sortName) {
        this.sortName = sortName;
    }

    public Integer getShopId() {
        return shopId;
    }

    public void setShopId(Integer shopId) {
        this.shopId = shopId;
    }

    public List<Food> getFoodList() {
        return foodList;
    }

    public void setFoodList(List<Food> foodList) {
        this.foodList = foodList;
    }
}
