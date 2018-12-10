package com.sss.mapper.netdisk;

import com.sss.bean.Share;
import org.apache.ibatis.annotations.*;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * Created by ZhangJun on 2018/6/7.
 */
public interface ShareMapper extends Mapper<Share> {

    @Select("select share_id from share where user_id=#{userId} order by share_id desc limit 1")
    int selectLastShareId(int userId);

    @Insert("insert into share(name,count,create_date,user_id,type) values(#{name},#{count},${create_date},#{user_id},${type})")
    void insertShare(Share share);


    @Select("select share_id,name,count,create_date,user_id,type from share where type=1")
    List<Share> selectAllPublic();


    @Delete("delete from share where share_id=#{id}")
    void deleteById(@Param("id")int id);

    @Select("select * from share where user_id=#{id} and type=-1")
    List<Share> selectAllPrivate(@Param("id")int id);

    @Select("select * from share where share_id=#{id}")
    Share getShare(@Param("id")int id);

    @Select("select * from share")
    @Results({
            @Result(property = "name",column = "name"),
            @Result(property = "share_id",column = "share_id"),
            @Result(property = "user_id",column = "user_id"),
            @Result(property = "create_date",column = "create_date"),
            @Result(property = "count",column = "count"),
            @Result(property = "type",column = "type"),
            @Result(property = "count",column = "count"),
            @Result(property = "type",column = "type"),
            @Result(property = "downloads",one = @One(select = "com.sss.mapper.netdisk.DownloadsMapper.findById"),column = "share_id"),
    })

    public List<Share> findAllShare();
}
