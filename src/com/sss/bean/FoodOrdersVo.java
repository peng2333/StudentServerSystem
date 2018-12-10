package com.sss.bean;

import java.util.ArrayList;
import java.util.List;

/**
 * @author 李金发666
 * @date 2018/6/11 21:12
 */
public class FoodOrdersVo {

	// 购买数量
	private List<Integer> foodNumber = new ArrayList<Integer>();
	// 食品id
	private List<Integer> fid = new ArrayList<Integer>();

	// 对应食品vo
	private List<FoodOrdersVo2> foodOrdersVo2s = new ArrayList<FoodOrdersVo2>();
	public List<Integer> getFoodNumber() {
		return foodNumber;
	}

	public void setFoodNumber(List<Integer> foodNumber) {
		this.foodNumber = foodNumber;
	}

	public List<Integer> getFid() {
		return fid;
	}

	public void setFid(List<Integer> fid) {
		this.fid = fid;
	}

	public List<FoodOrdersVo2> getFoodOrdersVo2s() {
		return foodOrdersVo2s;
	}

	public void setFoodOrdersVo2s(List<FoodOrdersVo2> foodOrdersVo2s) {
		this.foodOrdersVo2s = foodOrdersVo2s;
	}
}
