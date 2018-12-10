package com.sss.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @program: StudentServerSystem
 * @author: 朱元浩
 * @create: 2018-06-08 21:18
 **/
@Table(name="food")
public class Food {

	@Id
	private Integer fid;    //食物id
	private String fname;   //食物名称
	private Double fprice;   //食物价钱
	private Integer foodSales;  //销量

	@Column(name = "image_url")
	private String imageUrl;    //食物图片路径
	@Column(name = "sort_id")
	private Integer sortId;   //分类外键


	public void setFid(Integer fid) {
		this.fid = fid;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public void setFprice(Double fprice) {
		this.fprice = fprice;
	}

	public void setFoodSales(Integer foodSales) {
		this.foodSales = foodSales;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public void setSortId(Integer sortId) {
		this.sortId = sortId;
	}

	public Integer getFid() {

		return fid;
	}

	public String getFname() {
		return fname;
	}

	public Double getFprice() {
		return fprice;
	}

	public Integer getFoodSales() {
		return foodSales;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public Integer getSortId() {
		return sortId;
	}

}

