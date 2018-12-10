package com.sss.mapper.user;

import com.sss.bean.*;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.annotations.Result;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface UserMapper extends Mapper<User> {
    @Select("select * from user where username = #{user.username} and password = #{user.password}")
    User selectByUsernamePassword(@Param("user") User user);

    @Select("select * from question where uid = #{uid}")
    List<Question> findQuestionByUid(@Param("uid") Integer uid);

    @Select("select * from question where qid = #{qid}")
    Question findQuestionByQid(@Param("qid") Integer qid);

    @Select("SELECT COUNT(1) FROM answer  WHERE qid=#{qid} ")
    Integer findAnswerNum(@Param("qid") Integer qid);

    @Select("SELECT * FROM answer  WHERE qid=#{qid} ")
    List<Answer> findAnswerByQid(@Param("qid") Integer qid);

    @Select("SELECT * FROM answer  WHERE uid=#{uid} ")
    List<Answer> findAnswerByUid(@Param("uid") Integer uid);

    @Select("SELECT * FROM message WHERE q_uid=#{quid}")
    @Results({
            @Result(property = "mid",column = "mid"),
            @Result(property = "qid",column = "qid"),
            @Result(property = "quid",column = "q_uid"),
            @Result(property = "auid",column = "a_uid")
    })
    List<Message> findMessageByQuid(@Param("quid") Integer quid);

    @Select("SELECT *FROM user")
    List<User> showAllStudent();

    @Delete("DELETE FROM question WHERE uid = #{uid}")
    void deleteQue(@Param("uid") Integer uid);

    @Delete("DELETE FROM answer WHERE uid = #{uid}")
    void deleteAns(@Param("uid") Integer uid);

    @Select("select name from user where uid = #{uid}")
    String findName(@Param("uid") Integer uid);

}
