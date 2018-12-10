package com.sss.mapper.breakfast;

import com.sss.bean.Shop;
import com.sss.bean.ShopSort;
import org.apache.ibatis.annotations.*;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface ShopMapper extends Mapper<Shop> {

    /**
     * @author: 朱元浩
     * @date: 2018/6/14 21:20
     * @Param: []
     * @return: java.util.List<com.sss.bean.ShopSort>
     * @Description: 查询所有商家分类
     */
    @Select("select * from shop_sort")
    @Results({
            @Result(property = "shopSortId",column = "shop_sort_id"),
            @Result(property = "shopSortName",column = "shop_sort_name"),
            @Result(property = "shopId",column = "shop_id"),
    })
    List<ShopSort> selectAllShopSort();

	/**
	 * 查询所有商家
	 * @author: 李金发
	 * @return
	 */
	@Select("select * from shop")
    @Results(id = "findShopStr",value = {
		    @Result(property = "sid",column = "sid"),
		    @Result(property = "shopName",column = "shop_name"),
		    @Result(property = "shopIntroduce",column = "shop_introduce"),
		    @Result(property = "shopStar",one = @One(select = "com.sss.mapper.breakfast.ShopEvaluateMapper.findStarBySid"),column = "sid"),
		    @Result(property = "shopCount",column = "shop_count"),
		    @Result(property = "shopSortId",column = "shop_sort_id"),
		    @Result(property = "workTime",column = "work_time"),
		    @Result(property = "imageUrl",column = "image_url"),
		    @Result(property = "shopNotice",column = "shop_notice"),
		    @Result(property = "shopFaces",column = "shop_faces")
    })
    public List<Shop> selectAllShop();

	/**
	 * 根据商家id查询对应商家
	 * @author: 李金发
	 * @param sid
	 * @return
	 */
	@Select("select * from shop where sid = #{sid}")
	@ResultMap("findShopStr")
    public Shop findShopById(@Param("sid") Integer sid);


	/**
	 * 根据商家分类id查询对应所有商家
	 * @author: 李金发
	 * @return
	 */
	@Select("select * from shop where shop_sort_id = #{shopSortId}")
	@ResultMap("findShopStr")
	public List<Shop> findShopBySortId(@Param("shopSortId") Integer shopSortId);

	/**
	 * 根据食品分类id查询对应的一个商家
	 * @author: 李金发
	 * @return
	 */
	@Select("SELECT * FROM shop,food_sort WHERE sid = shop_id AND sort_id = #{sid}")
	@ResultMap("findShopStr")
	public Shop findShopByFoodId(@Param("sid") Integer sid);


}
