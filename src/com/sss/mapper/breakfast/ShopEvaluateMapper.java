package com.sss.mapper.breakfast;

import com.sss.bean.ShopEvaluate;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

/**
 * @author 李金发666
 * @date 2018/6/20 23:30
 */
public interface ShopEvaluateMapper extends Mapper<ShopEvaluate> {

	@Select("SELECT AVG(star) FROM shop_evaluate WHERE shop_id=#{sid}")
	public Double findStarBySid(@Param("sid") Integer sid);

	@Select("SELECT COUNT(1) FROM shop_evaluate WHERE shop_id = #{sid} AND star=#{star}")
	public Integer findEvaluateList(@Param("sid")Integer sid,@Param("star") Integer star);
//	@Select("SELECT COUNT(1) FROM shop_evaluate WHERE shop_id = #{shopId} GROUP BY star DESC")
//	public List<Integer> shopEvaluateCountList(@Param("shopId") Integer shopId);

}
