package com.sss.service.breakfast;

import com.sss.bean.Shop;
import com.sss.bean.ShopSort;

import java.util.List;

public interface ShopService {

    /**
     * 查询所有商家
     * @return
     */
    List<Shop> selectAll();


    /**
     * 查询所有商家分类
     * @return
     */
    List<ShopSort> selectAllShopSort();

    /**
     * 通过分类id查询所有对应的商家
     * @param shopSortId
     * @return
     */
    List<Shop> selectBySortId(Integer shopSortId);

	/**
	 * 查询对应商家
	 * @param sid
	 * @return
	 */
	Shop selectByPrimaryKey(Integer sid);

	public Shop findShopByFoodId(Integer sid);
}
