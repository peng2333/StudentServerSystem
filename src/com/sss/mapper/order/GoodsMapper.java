package com.sss.mapper.order;

import com.sss.bean.Food;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import tk.mybatis.mapper.common.Mapper;

public interface GoodsMapper extends  Mapper<Food>{

    @Delete("delete from food where fid=#{fid}")
    public void deleteByFid(@Param("fid") Integer fid);

    @Update("UPDATE food SET fname=#{fname},fprice=#{fprice},food_sales=#{foodSales},image_url=#{imageUrl},sort_id=#{sortId} WHERE fid = #{fid}")
    public void edit( Food food);

    @Insert("INSERT INTO food (fname, fprice,image_url,sort_id,food_sales) VALUES (#{fname},#{fprice},#{imageUrl},#{sortId},#{foodSales})")
    public void addGoods(Food food);
}
