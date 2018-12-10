package com.sss.mapper.user;

import com.sss.bean.UserQRCode;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

/**
 * @program: StudentServerSystem
 * @author: 朱元浩
 * @create: 2018-06-28 20:34
 **/
public interface UserQRCodeMapper extends Mapper<UserQRCode> {

    @Select("select * from user_QRCode where uid = #{uid}")
    UserQRCode selectByUid(@Param("uid") Integer uid);
}
