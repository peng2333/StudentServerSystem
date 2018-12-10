package com.sss.bean;
/**
 * @author 李金发666
 * @date 2018/6/19 20:40
 * 用户购买食品数量中间表
 */
public class FoodBuyRecord {
	private Integer fid;    // 用户id
	private Integer uid;    // 食品id
	private Integer buyCount ;  // 用户对应购买数量

	public FoodBuyRecord() {
	}

	public FoodBuyRecord(Integer fid, Integer uid, Integer buyCount) {

		this.fid = fid;
		this.uid = uid;
		this.buyCount = buyCount;
	}

	@Override
	public String toString() {
		return "FoodBuyRecord{" +
				"fid=" + fid +
				", uid=" + uid +
				", buyCount=" + buyCount +
				'}';
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getBuyCount() {
		return buyCount;
	}

	public void setBuyCount(Integer buyCount) {
		this.buyCount = buyCount;
	}

	public Integer getFid() {

		return fid;
	}

	public void setFid(Integer fid) {
		this.fid = fid;
	}
}
