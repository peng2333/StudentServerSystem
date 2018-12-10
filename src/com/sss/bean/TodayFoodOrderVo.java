package com.sss.bean;

import java.util.List;

public class TodayFoodOrderVo {

    private String pathName;
    public List<FoodOrdersVo2> food;


    public void setPathName(String pathName) {
        this.pathName = pathName;
    }

    public void setFood(List<FoodOrdersVo2> food) {
        this.food = food;
    }

    public String getPathName() {

        return pathName;
    }

    public List<FoodOrdersVo2> getFood() {
        return food;
    }
}
