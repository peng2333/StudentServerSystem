package com.sss.bean;

import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;

/**
 * @program: StudentServerSystem
 * @author: 朱元浩
 * @create: 2018-06-08 08:18
 **/
@Table(name = "shop")
public class Shop {
    @Id
    private Integer sid;    //id
    @Column(name = "shop_name")
    private String shopName;    //名字
    @Column(name = "shop_introduce")
    private String shopIntroduce;   //介绍

    private Double shopStar = 0.0;    //星级

	@Column(name = "shop_notice")
	private String shopNotice; // 商家公告
	private List<Integer> shopStarList; //商家各星级评价人数

	@Column(name = "shop_count")
    private Integer shopCount;  //销量
    @Column(name = "shop_sort_id")
    private Integer shopSortId;     //分类id
    @Column(name = "work_time")
    private String workTime;   //营业时间
    @Column(name = "image_url")
    private String imageUrl;    //图片路径
    @Column(name = "shop_faces")
    private String shopFaces;   //商家牌面

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public String getShopIntroduce() {
        return shopIntroduce;
    }

    public void setShopIntroduce(String shopIntroduce) {
        this.shopIntroduce = shopIntroduce;
    }


    public Integer getShopCount() {
        return shopCount;
    }

    public void setShopCount(Integer shopCount) {
        this.shopCount = shopCount;
    }

    public Integer getShopSortId() {
        return shopSortId;
    }

    public void setShopSortId(Integer shopSortId) {
        this.shopSortId = shopSortId;
    }

    public String getWorkTime() {
        return workTime;
    }

    public void setWorkTime(String workTime) {
        this.workTime = workTime;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

	public Double getShopStar() {
		return shopStar;
	}

	public void setShopStar(Double shopStar) {
		this.shopStar = shopStar;
	}

	public List<Integer> getShopStarList() {
		return shopStarList;
	}

	public void setShopStarList(List<Integer> shopStarList) {
		this.shopStarList = shopStarList;
	}

	public String getShopNotice() {
		return shopNotice;
	}

	public void setShopNotice(String shopNotice) {
		this.shopNotice = shopNotice;
	}

    public String getShopFaces() {
        return shopFaces;
    }

    public void setShopFaces(String shopFaces) {
        this.shopFaces = shopFaces;
    }
}
