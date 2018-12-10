package com.sss.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @program: StudentServerSystem
 * @author: 朱元浩
 * @create: 2018-06-14 21:09
 **/
@Table(name = "shop_sort")
public class ShopSort {
    @Id
    @Column(name = "shop_sort_id")
    private Integer shopSortId;     //分类id

    @Column(name = "shop_sort_name")
    private String shopSortName;    //分类名字

    @Override
    public String toString() {
        return "ShopSort{" +
                "shopSortId=" + shopSortId +
                ", shopSortName='" + shopSortName + '\'' +
                '}';
    }

    public Integer getShopSortId() {
        return shopSortId;
    }

    public void setShopSortId(Integer shopSortId) {
        this.shopSortId = shopSortId;
    }

    public String getShopSortName() {
        return shopSortName;
    }

    public void setShopSortName(String shopSortName) {
        this.shopSortName = shopSortName;
    }
}
