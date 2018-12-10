package com.sss.service.cases.impl;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sss.bean.Question;
import com.sss.bean.User;
import com.sss.mapper.cases.AnswerMapper;
import com.sss.mapper.cases.QuestionMapper;
import com.sss.mapper.user.UserMapper;
import com.sss.service.cases.CaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


/**
 * @Author WangShuang
 * @Description 事务管理
 */
@Service
@Transactional
public class CaseServiceImpl implements CaseService {
    /**
     * @Author WangShuang
     * @Description 通过mapper进行操作
     */
    @Resource
    private UserMapper userMapper;

    @Resource
    private AnswerMapper answerMapper;

    @Resource
    private QuestionMapper questionMapper;


    /**
     * @Author WangShuang
     * @Description 查询回答数最多的用户
     */
    @Override
    public PageInfo<User> findMaxAnswerUser() {
        PageHelper.startPage(1, 12);
        List<User> userList = answerMapper.findMaxAnswerUser();
        return new PageInfo<>(userList);
    }

    /**
     * @Author liangkai
     * 发帖 在Question插入一条数据
     */
    @Override
    public void insert(Question question) {
        questionMapper.insert(question);
    }

    /**
     * @Author WangShuang
     * @Description 周榜中最多得回答数
     */
    @Override
    public Integer selectAnswerNum(Integer uid) {
        Integer count = answerMapper.selectMaxAnswer(uid);
        return count;
    }

    /**
     * @Author:XiongTianCi
     * @Description:完成 通过ajax查询置顶内容 功能
     * @return:查询的结果--Question对象集合
     */
    @Override
    public List<Question> findByQtypeAndQstick(String qtype) {
        // 第二个参数：1--置顶
        return questionMapper.findByQtypeAndQstick(qtype, "1");
    }

    /**
     * @Author:XiongTianCi
     * @Description:通过问题标题qbt模糊查询此分类中的内容
     * @return:问题Question集合
     */
    @Override
    public List<Question> findByQtypeAndQbt(String qtype, String qbt) {
        // 通过qtype和qbt查询
        List<Question> qList = questionMapper.findByQtypeAndQbt(qtype, qbt);
        //
        return qList;
    }

    /**
     * @Author:XiongTianCi
     * @Description:首页模糊查询此分类中的内容
     * @return:问题Question集合
     */
    @Override
    public List<Question> findByQtypeAndQbt4(String qtype, String qbt) {
        // 通过qtype和qbt查询
        List<Question> qList = questionMapper.findByQtypeAndQbt4(qtype, qbt);
        //
        return qList;
    }

    /**
     * @Author：HuaHu
     * @Description:通过导读条点击内容查询此分类中的内容
     * @return:问题Question集合
     */
    public PageInfo<Question> find(String qtype) {
        PageHelper.startPage(1, 10);
        List<Question> list = questionMapper.find(qtype);
        return new PageInfo<>(list);
    }

    /**
     * @Author：HuaHu
     * @Description:查询已结/未结此分类中的内容
     * @return:问题Question集合
     */
    public PageInfo<Question> findQstate(Integer qstate, String qtype) {
        PageHelper.startPage(1, 10);
        List<Question> list = questionMapper.findQstate(qstate, qtype);
        return new PageInfo<>(list);
    }

    /**
     * @Author：HuaHu
     * @Description:按最新查询此分类中的内容(已确定分类和是否解决)
     * @return:问题Question集合
     */
    public PageInfo<Question> findQtimeByQstateAndQtype(Integer qstate, String qtype) {
        PageHelper.startPage(1, 10);
        List<Question> list = questionMapper.findQtimeByQstateAndQtype(qstate, qtype);
        return new PageInfo<>(list);
    }

    /**
     * @Author：HuaHu
     * @Description:按最新查询此分类中的内容（已确定是否解决）
     * @return:问题Question集合
     */
    public PageInfo<Question> findQtimeByQstate(Integer qstate) {
        PageHelper.startPage(1, 10);
        List<Question> list = questionMapper.findQtimeByQstate(qstate);
        return new PageInfo<>(list);
    }

    /**
     * @Author：HuaHu
     * @Description:按最新查询此分类中的内容（已确定分类）
     * @return:问题Question集合
     */
    public PageInfo<Question> findQtimeByQtype(String qtype) {
        PageHelper.startPage(1, 10);
        List<Question> list = questionMapper.findQtimeByQtype(qtype);
        return new PageInfo<>(list);
    }

    /**
     * @Author：HuaHu
     * @Description:按最新查询此分类中的内容（查询所有数据）
     * @return:问题Question集合
     */
    public PageInfo<Question> findQtime() {
        PageHelper.startPage(1, 10);
        List<Question> list = questionMapper.findQtime();
        return new PageInfo<>(list);
    }

    /**
     * @Author：HuaHu
     * @Description:在首页点击知识互助中心时在首页展示所有数据
     * @return:问题Question集合
     */
    public PageInfo<Question> findAll() {
        PageHelper.startPage(1, 10);
        List<Question> list = questionMapper.findAll();
        return new PageInfo<>(list);
    }

    /**
     * @Author：HuaHu
     * @Description:查询所有已解决或未解决的数据(不确定分类)
     * @return:问题Question集合
     */
    public PageInfo<Question> findByQstate(Integer qstate) {
        PageHelper.startPage(1, 10);
        List<Question> list = questionMapper.findByQstate(qstate);
        return new PageInfo<>(list);
    }

    /**
     * @Author：HuaHu
     * @Description:按热议查询此分类中的内容(已确定分类和是否解决)
     * @return:问题Question集合
     */
    public PageInfo<Question> findDjsByQstateAndQtype(Integer qstate, String qtype) {
        PageHelper.startPage(1, 10);
        List<Question> list = questionMapper.findDjsByQstateAndQtype(qstate, qtype);
        return new PageInfo<>(list);
    }

    /**
     * @Author：HuaHu
     * @Description:按热议查询此分类中的内容（已确定分类）
     * @return:问题Question集合
     */
    public PageInfo<Question> findDjsByQtype(String qtype) {
        PageHelper.startPage(1, 10);
        List<Question> list = questionMapper.findDjsByQtype(qtype);
        return new PageInfo<>(list);
    }

    /**
     * @Author：HuaHu
     * @Description:按热议查询此分类中的内容（已确定是否解决）
     * @return:问题Question集合
     */
    public PageInfo<Question> findDjsByQstate(Integer qstate) {
        PageHelper.startPage(1, 10);
        List<Question> list = questionMapper.findDjsByQstate(qstate);
        return new PageInfo<>(list);
    }

    /**
     * @Author：HuaHu
     * @Description:按热议查询此分类中的内容（查询所有数据）
     * @return:问题Question集合
     */
    public PageInfo<Question> findDjs() {
        PageHelper.startPage(1, 10);
        List<Question> list = questionMapper.findDjs();
        String jsonStr = JSON.toJSONString(list);
        return new PageInfo<>(list);
    }


    /**
     * @Author:XiongTianCi
     * @Description:用于 知识互助中心 的搜索功能
     * @return:问题Question集合
     */

    public PageInfo<Question> findBySearchText(String qtype, String searchText) {
        PageHelper.startPage(1, 10);
        List<Question> list = questionMapper.findBySearchText(qtype, searchText);
        return new PageInfo<>(list);
    }

    @Override
    public Integer findUidByQid(Integer qid) {
        return questionMapper.findUidByQid(qid);
    }

    @Override
    public void updateDjs(Integer qid) {
        questionMapper.updateDjs(qid);
    }


    /**
     * @Author:XiongTianCi
     * @Description:通过ajax查询分类中question对象
     * @return:
     */
    public List<Question> findQuestionByQtype(String qtype) {
        List<Question> list = null;
        // 判断qtype
        if ("首页".equals(qtype)) {
            // 开启分页，查询4个
            PageHelper.startPage(1, 4);
            // 首页，查询回答次数最多的4个置顶question
            list = questionMapper.findQuestionForIndex();
        }

        return list;
    }
}
