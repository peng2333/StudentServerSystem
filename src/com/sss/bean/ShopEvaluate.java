package com.sss.bean;

import javax.persistence.Id;
import java.util.Date;

/** 商家评价类
 * @author 李金发666
 * @date 2018/6/14 20:54
 */
public class ShopEvaluate {

	private Integer shopId;         //对应商家id
	@Id
	private Integer evaluateId;     // 评价id
	private String evaluateName;    //评价用户姓名
	private String evaluateContent; //评价内容
	private Double star;            // 评价星级
	private Date evaluatTime;       // 评价时间
	private String recommend;       // 推荐商品

	public String getEvaluateContent() {
		return evaluateContent;
	}

	public Integer getEvaluateId() {
		return evaluateId;
	}

	public void setEvaluateId(Integer evaluateId) {
		this.evaluateId = evaluateId;
	}

	public void setEvaluateContent(String evaluateContent) {
		this.evaluateContent = evaluateContent;
	}

	public Integer getShopId() {
		return shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public String getEvaluateName() {
		return evaluateName;
	}

	public void setEvaluateName(String evaluateName) {
		this.evaluateName = evaluateName;
	}

	public Double getStar() {
		return star;
	}

	public void setStar(Double star) {
		this.star = star;
	}

	public Date getEvaluatTime() {
		return evaluatTime;
	}

	public void setEvaluatTime(Date evaluatTime) {
		this.evaluatTime = evaluatTime;
	}

	public String getRecommend() {
		return recommend;
	}

	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}
}
