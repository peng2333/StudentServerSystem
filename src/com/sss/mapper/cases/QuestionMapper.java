package com.sss.mapper.cases;

import com.sss.bean.Question;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.common.Mapper;

import javax.annotation.Resources;
import java.util.List;

/**
 * Created by ZhangPeng on 2018/6/7
 */
@Service
@Transactional
public interface QuestionMapper extends Mapper<Question> {

    /**
     *@Author:XiongTianCi
     *@Description:查询置顶内容，同时绑定提问user
     *@return:查询的所有置顶Question对象
     */
    @Select("select * from question q where q.qtype=#{qtype} and q.qstick=#{qstick}")
    @Results({
            @Result(property = "qid",column = "qid"),
            @Result(property = "qbt",column = "qbt"),
            @Result(property = "qs",column = "qs"),
            @Result(property = "uid",column = "uid"),
            @Result(property = "djs",column = "djs"),
            @Result(property = "qtime",column = "qtime"),
            @Result(property = "qstate",column = "qstate"),
            @Result(property = "qstick",column = "qstick"),
            @Result(property = "qtype",column = "qtype"),
            @Result(property = "qfierce",column = "qfierce"),
            @Result(property = "answerList",many = @Many(select = "com.sss.mapper.cases.AnswerMapper.findAnswerListWithQid"),column = "qid"),
            @Result(property = "user",one = @One(select = "com.sss.mapper.user.UserMapper.selectByPrimaryKey"),column = "uid")
    })
    List<Question> findByQtypeAndQstick(@Param("qtype") String qtype,@Param("qstick") String qstick);


    /**
     *@Author:XiongTianCi
     *@Description:通过问题标题qbt模糊查询此分类中的内容；每个问题对象绑定其user对象
     *@return:问题Question集合
     */
    @Select("select * from question q where q.qtype=#{qtype} and q.qbt like #{qbt}")
    @Results({
            @Result(property = "qid",column = "qid"),
            @Result(property = "qbt",column = "qbt"),
            @Result(property = "qs",column = "qs"),
            @Result(property = "uid",column = "uid"),
            @Result(property = "djs",column = "djs"),
            @Result(property = "qtime",column = "qtime"),
            @Result(property = "qstate",column = "qstate"),
            @Result(property = "qstick",column = "qstick"),
            @Result(property = "qtype",column = "qtype"),
            @Result(property = "qfierce",column = "qfierce"),
            @Result(property = "user",one = @One(select = "com.sss.mapper.user.UserMapper.selectByPrimaryKey"),column = "uid")
    })
    List<Question> findByQtypeAndQbt(@Param("qtype") String qtype,@Param("qbt") String qbt);

    /**
     *@Author:XiongTianCi
     *@Description:首页查询此分类中的内容；每个问题对象绑定其user对象
     *@return:问题Question集合
     */
    @Select("select * from question q where q.qbt like #{qbt}")
    @Results({
            @Result(property = "qid",column = "qid"),
            @Result(property = "qbt",column = "qbt"),
            @Result(property = "qs",column = "qs"),
            @Result(property = "uid",column = "uid"),
            @Result(property = "djs",column = "djs"),
            @Result(property = "qtime",column = "qtime"),
            @Result(property = "qstate",column = "qstate"),
            @Result(property = "qstick",column = "qstick"),
            @Result(property = "qtype",column = "qtype"),
            @Result(property = "qfierce",column = "qfierce"),
            @Result(property = "user",one = @One(select = "com.sss.mapper.user.UserMapper.selectByPrimaryKey"),column = "uid")
    })
    List<Question> findByQtypeAndQbt4(@Param("qtype") String qtype,@Param("qbt") String qbt);

    /**
     *@Author：HuaHu
     *@Description:通过导读条点击内容查询此分类中的内容(只查询不置顶的内容)
     *@return:问题Question集合
     */
    @Select("select * from question q where q.qtype=#{qtype} and q.qstick='0'")
    @Results({
            @Result(property = "qid",column = "qid"),
            @Result(property = "qbt",column = "qbt"),
            @Result(property = "qs",column = "qs"),
            @Result(property = "uid",column = "uid"),
            @Result(property = "djs",column = "djs"),
            @Result(property = "qtime",column = "qtime"),
            @Result(property = "qstate",column = "qstate"),
            @Result(property = "qstick",column = "qstick"),
            @Result(property = "qtype",column = "qtype"),
            @Result(property = "qfierce",column = "qfierce"),
            @Result(property = "user",one = @One(select = "com.sss.mapper.user.UserMapper.selectByPrimaryKey"),column = "uid")
    })
    List<Question> find(@Param("qtype") String qtype);

    /**
     *@Author：HuaHu
     *@Description:查询已结/未结此分类中的内容（只查询不置顶的内容）
     *@return:问题Question集合
     */
    @Select("SELECT * FROM question WHERE qstate = #{qstate} AND qtype = #{qtype} AND qstick = '0'")
    @Results({
            @Result(property = "qid",column = "qid"),
            @Result(property = "qbt",column = "qbt"),
            @Result(property = "qs",column = "qs"),
            @Result(property = "uid",column = "uid"),
            @Result(property = "djs",column = "djs"),
            @Result(property = "qtime",column = "qtime"),
            @Result(property = "qstate",column = "qstate"),
            @Result(property = "qstick",column = "qstick"),
            @Result(property = "qtype",column = "qtype"),
            @Result(property = "qfierce",column = "qfierce"),
            @Result(property = "user",one = @One(select = "com.sss.mapper.user.UserMapper.selectByPrimaryKey"),column = "uid")
    })
    public List<Question> findQstate(@Param("qstate")Integer qstate,@Param("qtype") String qtype);

    /**
     *@Author：HuaHu
     *@Description:按最新查询此分类中的内容(已确定分类和是否解决)
     *@return:问题Question集合
     */
    @Select("SELECT * FROM question WHERE qtype=#{qtype}  AND qstate=#{qstate} AND qstick = '0' ORDER BY qtime DESC")
    @Results({
            @Result(property = "qid",column = "qid"),
            @Result(property = "qbt",column = "qbt"),
            @Result(property = "qs",column = "qs"),
            @Result(property = "uid",column = "uid"),
            @Result(property = "djs",column = "djs"),
            @Result(property = "qtime",column = "qtime"),
            @Result(property = "qstate",column = "qstate"),
            @Result(property = "qstick",column = "qstick"),
            @Result(property = "qtype",column = "qtype"),
            @Result(property = "qfierce",column = "qfierce"),
            @Result(property = "user",one = @One(select = "com.sss.mapper.user.UserMapper.selectByPrimaryKey"),column = "uid")
    })
    public List<Question> findQtimeByQstateAndQtype(@Param("qstate")Integer qstate,@Param("qtype") String qtype);

    /**
     *@Author：HuaHu
     *@Description:按最新查询此分类中的内容（已确定分类）
     *@return:问题Question集合
     */
    @Select("SELECT * FROM question WHERE qtype=#{qtype} AND qstick = '0' ORDER BY qtime DESC")
    @Results({
            @Result(property = "qid",column = "qid"),
            @Result(property = "qbt",column = "qbt"),
            @Result(property = "qs",column = "qs"),
            @Result(property = "uid",column = "uid"),
            @Result(property = "djs",column = "djs"),
            @Result(property = "qtime",column = "qtime"),
            @Result(property = "qstate",column = "qstate"),
            @Result(property = "qstick",column = "qstick"),
            @Result(property = "qtype",column = "qtype"),
            @Result(property = "qfierce",column = "qfierce"),
            @Result(property = "user",one = @One(select = "com.sss.mapper.user.UserMapper.selectByPrimaryKey"),column = "uid")
    })
    public List<Question> findQtimeByQtype(@Param("qtype") String qtype);

    /**
     *@Author：HuaHu
     *@Description:按最新查询此分类中的内容（查询所有数据）
     *@return:问题Question集合
     */
    @Select("SELECT * FROM question WHERE qstick = '0' ORDER BY qtime DESC")
    @Results({
            @Result(property = "qid",column = "qid"),
            @Result(property = "qbt",column = "qbt"),
            @Result(property = "qs",column = "qs"),
            @Result(property = "uid",column = "uid"),
            @Result(property = "djs",column = "djs"),
            @Result(property = "qtime",column = "qtime"),
            @Result(property = "qstate",column = "qstate"),
            @Result(property = "qstick",column = "qstick"),
            @Result(property = "qtype",column = "qtype"),
            @Result(property = "qfierce",column = "qfierce"),
            @Result(property = "user",one = @One(select = "com.sss.mapper.user.UserMapper.selectByPrimaryKey"),column = "uid")
    })
    public List<Question> findQtime();

    /**
     *@Author：HuaHu
     *@Description:按最新查询此分类中的内容（已确定是否解决）
     *@return:问题Question集合
     */
    @Select("SELECT * FROM question WHERE qstick = '0' AND qstate=#{qstate} ORDER BY qtime DESC")
    @Results({
            @Result(property = "qid",column = "qid"),
            @Result(property = "qbt",column = "qbt"),
            @Result(property = "qs",column = "qs"),
            @Result(property = "uid",column = "uid"),
            @Result(property = "djs",column = "djs"),
            @Result(property = "qtime",column = "qtime"),
            @Result(property = "qstate",column = "qstate"),
            @Result(property = "qstick",column = "qstick"),
            @Result(property = "qtype",column = "qtype"),
            @Result(property = "qfierce",column = "qfierce"),
            @Result(property = "user",one = @One(select = "com.sss.mapper.user.UserMapper.selectByPrimaryKey"),column = "uid")
    })
    public List<Question> findQtimeByQstate(@Param("qstate")Integer qstate);

    /**
     *@Author：HuaHu
     *@Description:在首页点击知识互助中心时在首页展示所有数据
     *@return:问题Question集合
     */
    @Select("SELECT * FROM question WHERE qstick = '0'")
    @Results({
            @Result(property = "qid",column = "qid"),
            @Result(property = "qbt",column = "qbt"),
            @Result(property = "qs",column = "qs"),
            @Result(property = "uid",column = "uid"),
            @Result(property = "djs",column = "djs"),
            @Result(property = "qtime",column = "qtime"),
            @Result(property = "qstate",column = "qstate"),
            @Result(property = "qstick",column = "qstick"),
            @Result(property = "qtype",column = "qtype"),
            @Result(property = "qfierce",column = "qfierce"),
            @Result(property = "user",one = @One(select = "com.sss.mapper.user.UserMapper.selectByPrimaryKey"),column = "uid")
    })
    public List<Question> findAll();

    /**
     *@Author：HuaHu
     *@Description:查询所有已解决或未解决的数据(不确定分类)
     *@return:问题Question集合
     */
    @Select("SELECT * FROM question WHERE qstick = '0' AND qstate=#{qstate}")
    @Results({
            @Result(property = "qid",column = "qid"),
            @Result(property = "qbt",column = "qbt"),
            @Result(property = "qs",column = "qs"),
            @Result(property = "uid",column = "uid"),
            @Result(property = "djs",column = "djs"),
            @Result(property = "qtime",column = "qtime"),
            @Result(property = "qstate",column = "qstate"),
            @Result(property = "qstick",column = "qstick"),
            @Result(property = "qtype",column = "qtype"),
            @Result(property = "qfierce",column = "qfierce"),
            @Result(property = "user",one = @One(select = "com.sss.mapper.user.UserMapper.selectByPrimaryKey"),column = "uid")
    })
    public List<Question> findByQstate(@Param("qstate")Integer qstate);

    /**
     *@Author：HuaHu
     *@Description:按热议查询此分类中的内容(已确定分类和是否解决)
     *@return:问题Question集合
     */
    @Select("SELECT * FROM question WHERE qtype=#{qtype}  AND qstate=#{qstate} AND qstick = '0' ORDER BY djs DESC")
    @Results({
            @Result(property = "qid",column = "qid"),
            @Result(property = "qbt",column = "qbt"),
            @Result(property = "qs",column = "qs"),
            @Result(property = "uid",column = "uid"),
            @Result(property = "djs",column = "djs"),
            @Result(property = "qtime",column = "qtime"),
            @Result(property = "qstate",column = "qstate"),
            @Result(property = "qstick",column = "qstick"),
            @Result(property = "qtype",column = "qtype"),
            @Result(property = "qfierce",column = "qfierce"),
            @Result(property = "user",one = @One(select = "com.sss.mapper.user.UserMapper.selectByPrimaryKey"),column = "uid")
    })
    public List<Question> findDjsByQstateAndQtype(@Param("qstate")Integer qstate,@Param("qtype") String qtype);

    /**
     *@Author：HuaHu
     *@Description:按热议查询此分类中的内容（已确定分类）
     *@return:问题Question集合
     */
    @Select("SELECT * FROM question WHERE qtype=#{qtype} AND qstick = '0' ORDER BY djs DESC")
    @Results({
            @Result(property = "qid",column = "qid"),
            @Result(property = "qbt",column = "qbt"),
            @Result(property = "qs",column = "qs"),
            @Result(property = "uid",column = "uid"),
            @Result(property = "djs",column = "djs"),
            @Result(property = "qtime",column = "qtime"),
            @Result(property = "qstate",column = "qstate"),
            @Result(property = "qstick",column = "qstick"),
            @Result(property = "qtype",column = "qtype"),
            @Result(property = "qfierce",column = "qfierce"),
            @Result(property = "user",one = @One(select = "com.sss.mapper.user.UserMapper.selectByPrimaryKey"),column = "uid")
    })
    public List<Question> findDjsByQtype(@Param("qtype") String qtype);

    /**
     *@Author：HuaHu
     *@Description:按热议查询此分类中的内容（查询所有数据）
     *@return:问题Question集合
     */
    @Select("SELECT * FROM question WHERE qstick = '0' ORDER BY djs DESC")
    @Results({
            @Result(property = "qid",column = "qid"),
            @Result(property = "qbt",column = "qbt"),
            @Result(property = "qs",column = "qs"),
            @Result(property = "uid",column = "uid"),
            @Result(property = "djs",column = "djs"),
            @Result(property = "qtime",column = "qtime"),
            @Result(property = "qstate",column = "qstate"),
            @Result(property = "qstick",column = "qstick"),
            @Result(property = "qtype",column = "qtype"),
            @Result(property = "qfierce",column = "qfierce"),
            @Result(property = "user",one = @One(select = "com.sss.mapper.user.UserMapper.selectByPrimaryKey"),column = "uid")
    })
    public List<Question> findDjs();

    /**
     *@Author：HuaHu
     *@Description:按热议查询此分类中的内容（已确定是否解决）
     *@return:问题Question集合
     */
    @Select("SELECT * FROM question WHERE qstick = '0' AND qstate=#{qstate} ORDER BY djs DESC")
    @Results({
            @Result(property = "qid",column = "qid"),
            @Result(property = "qbt",column = "qbt"),
            @Result(property = "qs",column = "qs"),
            @Result(property = "uid",column = "uid"),
            @Result(property = "djs",column = "djs"),
            @Result(property = "qtime",column = "qtime"),
            @Result(property = "qstate",column = "qstate"),
            @Result(property = "qstick",column = "qstick"),
            @Result(property = "qtype",column = "qtype"),
            @Result(property = "qfierce",column = "qfierce"),
            @Result(property = "user",one = @One(select = "com.sss.mapper.user.UserMapper.selectByPrimaryKey"),column = "uid")
    })
    public List<Question> findDjsByQstate(@Param("qstate")Integer qstate);


    /**
     *@Author:XiongTianCi
     *@Description:用于 知识互助中心 的搜索功能
     *@return:问题Question集合
     */
    @Select("SELECT * FROM question WHERE qtype=#{qtype} AND qbt LIKE '%' #{search} '%'")
    @Results({
            @Result(property = "qid",column = "qid"),
    @Result(property = "qbt",column = "qbt"),
    @Result(property = "qs",column = "qs"),
    @Result(property = "uid",column = "uid"),
    @Result(property = "djs",column = "djs"),
    @Result(property = "qtime",column = "qtime"),
    @Result(property = "qstate",column = "qstate"),
    @Result(property = "qstick",column = "qstick"),
    @Result(property = "qtype",column = "qtype"),
    @Result(property = "qfierce",column = "qfierce"),
    @Result(property = "user",one = @One(select = "com.sss.mapper.user.UserMapper.selectByPrimaryKey"),column = "uid")
})
    List<Question> findBySearchText(@Param("qtype") String qtype,@Param("search") String search);

    @Select("select uid from question where qid = #{qid}")
    Integer findUidByQid(@Param("qid") Integer qid);

    @Update("UPDATE question SET djs = djs + 1 WHERE qid = #{qid}")
    void updateDjs(@Param("qid") Integer qid);


    /**
    *@Author:XiongTianCi
    *@Description:实现首页中置顶功能，查询回复次数最多的4个置顶question
    *@return:
    */
    @Select("SELECT * FROM question q , (SELECT COUNT(*) cou,a.qid aq FROM answer a GROUP BY a.qid ORDER BY cou DESC) t WHERE q.qid=t.aq")
    @Results({
            @Result(property = "qid",column = "qid"),
            @Result(property = "qbt",column = "qbt"),
            @Result(property = "qs",column = "qs"),
            @Result(property = "uid",column = "uid"),
            @Result(property = "djs",column = "djs"),
            @Result(property = "qtime",column = "qtime"),
            @Result(property = "qstate",column = "qstate"),
            @Result(property = "qstick",column = "qstick"),
            @Result(property = "qtype",column = "qtype"),
            @Result(property = "qfierce",column = "qfierce"),
            @Result(property = "answerList",many = @Many(select = "com.sss.mapper.cases.AnswerMapper.findAnswerListWithQid"),column = "qid"),
            @Result(property = "user",one = @One(select = "com.sss.mapper.user.UserMapper.selectByPrimaryKey"),column = "uid")
    })
    List<Question> findQuestionForIndex();
}
