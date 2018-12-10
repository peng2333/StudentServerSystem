package com.sss.service.breakfast.impl;

import com.sss.bean.Shop;
import com.sss.bean.ShopSort;
import com.sss.mapper.breakfast.ShopMapper;
import com.sss.service.breakfast.ShopService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;

/**
 * @program: StudentServerSystem
 * @author: 朱元浩
 * @create: 2018-06-08 08:36
 **/
@Service
@Transactional
public class ShopServiceImpl implements ShopService {

    @Resource
    private ShopMapper shopMapper;

    /**
     * @author: 朱元浩
     * @date: 2018/6/8 8:43
     * @Param: []
     * @return: java.util.List<com.sss.bean.Shop>
     *
     *     查询所有商家
     */
    @Override
    public List<Shop> selectAll() {
        return shopMapper.selectAllShop();
    }


    /**
     * @author: 朱元浩
     * @date: 2018/6/14 21:18
     * @Param: []
     * @return: java.util.List<com.sss.bean.ShopSort>
     * @Description: 查询所有商家分类
     */
    @Override
    public List<ShopSort> selectAllShopSort() {
        return shopMapper.selectAllShopSort();
    }

    /**
     * @author: 朱元浩
     * @date: 2018/6/15 11:23
     * @Param: [shopSortId]
     * @return: java.util.List<com.sss.bean.Shop>
     * @Description: 通过分类id查询所有对应的商家
     */
    @Override
	public List<Shop> selectBySortId(Integer shopSortId) {
		//查询条件
		return shopMapper.findShopBySortId(shopSortId);
	}

	@Override
	public Shop selectByPrimaryKey(Integer sid) {
		return shopMapper.findShopById(sid);
	}

	@Override
	public Shop findShopByFoodId(Integer sid) {
		return shopMapper.findShopByFoodId(sid);
	}


}
