package com.sss.service.cases;

import com.github.pagehelper.PageInfo;
import com.sss.bean.Question;
import com.sss.bean.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by ZhangPeng on 2018/6/7
 */
public interface CaseService {

    /**
     * @Author WangShuang
     * @Description 周榜查询回答数最多的12个用户
     */
    PageInfo<User> findMaxAnswerUser();

    /**
     * @Author liangkai
     * @Description 发帖，往Question表中插入一条数据
     */
    void insert(Question question);

    /**
     * @Author WangShuang
     * @Description 周榜中最多得回答数
     */
    Integer selectAnswerNum(Integer uid);

    /**
     * @Author:XiongTianCi
     * @Description:完成 通过ajax查询置顶内容 功能
     */
    List<Question> findByQtypeAndQstick(String qtype);

    /**
     * @Author:XiongTianCi
     * @Description:通过问题标题qbt模糊查询此分类中的内容
     * @return:问题Question集合
     */
    List<Question> findByQtypeAndQbt(String qtype, String qbt);

    /**
     * @Author:XiongTianCi
     * @Description:首页模糊查询此分类中的内容
     * @return:问题Question集合
     */
    List<Question> findByQtypeAndQbt4(String qtype, String qbt);

    /**
     * @Author：HuaHu
     * @Description:通过导读条点击内容查询此分类中的内容
     * @return:问题Question集合
     */
    PageInfo<Question> find(String qtype);

    /**
     * @Author：HuaHu
     * @Description:查询已结/未结此分类中的内容
     * @return:问题Question集合
     */
    PageInfo<Question> findQstate(Integer qstate, String qtype);

    /**
     * @Author：HuaHu
     * @Description:按最新查询此分类中的内容(已确定分类和是否解决)
     * @return:问题Question集合
     */
    PageInfo<Question> findQtimeByQstateAndQtype(Integer qstate, String qtype);

    /**
     * @Author：HuaHu
     * @Description:按最新查询此分类中的内容（已确定分类）
     * @return:问题Question集合
     */
    PageInfo<Question> findQtimeByQtype(String qtype);

    /**
     * @Author：HuaHu
     * @Description:按最新查询此分类中的内容（已确定是否解决）
     * @return:问题Question集合
     */
    PageInfo<Question> findQtimeByQstate(Integer qstate);

    /**
     * @Author：HuaHu
     * @Description:按最新查询此分类中的内容（查询所有数据）
     * @return:问题Question集合
     */
    PageInfo<Question> findQtime();

    /**
     * @Author：HuaHu
     * @Description:在首页点击知识互助中心时在首页展示所有数据
     * @return:问题Question集合
     */
    PageInfo<Question> findAll();

    /**
     * @Author：HuaHu
     * @Description:查询所有已解决或未解决的数据(不确定分类)
     * @return:问题Question集合
     */
    PageInfo<Question> findByQstate(Integer qstate);

    /**
     * @Author：HuaHu
     * @Description:按热议查询此分类中的内容(已确定分类和是否解决)
     * @return:问题Question集合
     */
    PageInfo<Question> findDjsByQstateAndQtype(Integer qstate, String qtype);

    /**
     * @Author：HuaHu
     * @Description:按热议查询此分类中的内容（已确定分类）
     * @return:问题Question集合
     */
    PageInfo<Question> findDjsByQtype(String qtype);

    /**
     * @Author：HuaHu
     * @Description:按热议查询此分类中的内容（已确定是否解决）
     * @return:问题Question集合
     */
    PageInfo<Question> findDjsByQstate(Integer qstate);

    /**
     * @Author：HuaHu
     * @Description:按热议查询此分类中的内容（查询所有数据）
     * @return:问题Question集合
     */
    PageInfo<Question> findDjs();

    /**
     * @Author:XiongTianCi
     * @Description:用于 知识互助中心 的搜索功能
     * @return:问题Question集合
     */
    PageInfo<Question> findBySearchText(String qtype, String searchText);

    /**
     * @Author:ZhangPeng
     * @Description:通过问题的qid找到提问者id
     */
    Integer findUidByQid(Integer qid);

    /**
     * @Author:ZhangPeng
     * @Description:更新帖子点击数
     */
    void updateDjs(Integer qid);

    /**
     * @Author:XiongTianCi
     * @Description:通过ajax查询分类中question对象
     * @return:
     */
    List<Question> findQuestionByQtype(String qtype);
}
