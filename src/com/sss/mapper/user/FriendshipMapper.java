package com.sss.mapper.user;

import com.sss.bean.Friendship;
import com.sss.vo.AddFriendVo;
import com.sss.vo.OnlineUserVo;
import org.apache.ibatis.annotations.*;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * Created by ZhangPeng on 2018/6/20
 */
public interface FriendshipMapper extends Mapper<Friendship> {

    @Select("SELECT u.*,f.group_id FROM `user` u , friendship f WHERE u.uid = f.uid2 AND f.uid1 = #{uid}")
    @Results({
            @Result(property = "username", column = "name"),
            @Result(property = "id", column = "uid"),
            @Result(property = "avatar", column = "imageurl"),
            @Result(property = "sign", column = "signature"),
            @Result(property = "groupId", column = "group_id")
    })
    List<OnlineUserVo> findFriends(@Param("uid") Integer uid);

    @Select("select * from addFriend where uid = #{uid}")
    @Results({
            @Result(property = "afid",column = "afid"),
            @Result(property = "sendUid",column = "send_uid"),
            @Result(property = "remark",column = "remark"),
            @Result(property = "groupId",column = "group_id"),
            @Result(property = "uid",column = "uid"),
            @Result(property = "stime",column = "stime"),
            @Result(property = "user",one=@One(select = "com.sss.mapper.user.UserMapper.selectByPrimaryKey"),column = "send_uid"),
    })
    List<AddFriendVo> findAddMsgByUid(@Param("uid") Integer uid);
}
