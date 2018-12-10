package com.sss.mapper.user;

import com.sss.bean.SystemMsg;
import org.apache.ibatis.annotations.*;
import tk.mybatis.mapper.common.Mapper;

import java.util.Date;
import java.util.List;

/**
 * Created by ZhangPeng on 2018/7/2
 */
public interface SystemMsgMapper extends Mapper<SystemMsg> {

    @Select("select * from system_msg where send_id = #{uid}")
    @Results({
            @Result(property = "sendId",column = "send_id"),
            @Result(property = "receiveId",column = "receive_id"),
            @Result(property = "type",column = "type"),
            @Result(property = "stime",column = "stime"),
            @Result(property = "name",one = @One(select = "com.sss.mapper.user.UserMapper.findName"),column = "receive_id")
    })
    List<SystemMsg> selectByUid(@Param("uid") Integer uid);

    @Insert("insert into system_msg(send_id,receive_id,type,stime) values(#{sendId},#{receiveId},1,#{stime})")
    void addStstemMsg(@Param("sendId") Integer sendId,@Param("receiveId") Integer receiveId,@Param("stime") Date stime);

    @Insert("insert into system_msg(send_id,receive_id,type,stime) values(#{sendId},#{receiveId},0,#{stime})")
    void addStstemMsgFail(@Param("sendId") Integer sendId,@Param("receiveId") Integer receiveId,@Param("stime") Date stime);
}
