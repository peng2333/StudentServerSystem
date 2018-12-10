package com.sss.mapper.cases;

import com.sss.bean.Answer;
import com.sss.bean.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * Created by ZhangPeng on 2018/6/7
 */
public interface AnswerMapper extends Mapper<Answer> {

    /**
    *@Author WangShuang
    *@Description 周榜中用户的回答数
     * @param uid
    */
    @Select("SELECT COUNT(1) FROM answer WHERE uid = #{uid} AND dbest = 1")
    Integer selectMaxAnswer(@Param("uid") Integer uid);


    /**
    *@Author WangShuang
    *@Description 周榜中回答数最多的用户
    */
    @Select("SELECT u.* FROM answer a,user u WHERE a.uid=u.uid AND a.dbest = 1 GROUP BY a.uid ORDER BY COUNT(1) DESC")
    List<User> findMaxAnswerUser();


    /**
    *@Author:XiongTianCi
    *@Description:通过qid查询此问题下的回答次数
    *@return:回答次数
    */
    @Select("SELECT * FROM answer a WHERE a.`qid`=#{qid}")
    List<Answer> findAnswerListWithQid(@Param("qid") String qid);
 }
