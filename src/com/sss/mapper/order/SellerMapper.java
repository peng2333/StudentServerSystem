package com.sss.mapper.order;

import com.sss.bean.Shop;
import org.apache.ibatis.annotations.*;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface SellerMapper extends Mapper<Shop>{


    @Select("SELECT * FROM shop")
    @Results(value = {
            @Result(property = "sid",column = "sid"),
            @Result(property = "shopName",column = "shop_name"),
            @Result(property = "shopIntroduce",column = "shop_introduce"),
            @Result(property = "shopCount",column = "shop_count"),
            @Result(property = "shopSortId",column = "shop_sort_id"),
            @Result(property = "workTime",column = "work_time"),
            @Result(property = "imageUrl",column = "image_url"),
    })
    public List<Shop> selectSellerAll();

    @Delete("DELETE FROM shop WHERE sid = #{sid}")
    public void deleteBySid(@Param("sid") Integer sid);

    @Update("UPDATE shop SET shop_name=#{shopName},shop_introduce=#{shopIntroduce},shop_count=#{shopCount},shop_sort_id=#{shopSortId},work_time=#{workTime},image_url=#{imageUrl} WHERE sid = #{sid}")
    public void edit(Shop shop);

    @Insert("INSERT INTO shop (shop_name,shop_introduce,shop_count,shop_sort_id,work_time,image_url) VALUES (#{shopName},#{shopIntroduce},#{shopCount},#{shopSortId},#{workTime},#{imageUrl})")
    public void addSeller(Shop shop);
}
