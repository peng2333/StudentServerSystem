package com.sss.mapper.breakfast;

import com.sss.bean.FoodBuyRecord;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import tk.mybatis.mapper.common.Mapper;

/**
 * @author 李金发666
 * @date 2018/6/19 20:54
 */
public interface FoodBuyRecordMapper extends Mapper<FoodBuyRecord> {


	@Update("UPDATE food_buy_record SET buy_count=buy_count+#{number} WHERE fid=#{fid} AND uid=#{uid}")
	public Integer updateBuyCount(@Param("fid")Integer fid, @Param("uid")Integer uid,@Param("number")Integer number);


}
