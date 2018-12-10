package com.sss.service.competition.impl;

import com.sss.bean.History;
import com.sss.bean.Measurement;
import com.sss.bean.User;
import com.sss.mapper.competition.HistoryMapper;
import com.sss.mapper.competition.MeasurementMapper;
import com.sss.service.competition.MeasurementService;
import org.junit.Test;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author 魏彤羽
 */
@Service
@Transactional
public class MeasurementImpl implements MeasurementService {
    @Resource
    private MeasurementMapper measurementMapper;
    @Resource
    private HistoryMapper historyMapper;

    /**

     * 魏彤羽
     * 查询所有
     *
     * @return
     */
    @Override
    public List<Measurement> findAll() {
        return measurementMapper.selectAll();
    }

    /**
     * 魏彤羽
     * 根据id查询详情
     *
     * @param id
     * @return
     */
    @Override
    public Measurement findById(Integer id) {
        return measurementMapper.selectByPrimaryKey(id);
    }

    /**
     * 魏彤羽
     * 根据题目名称模糊查询
     *
     * @param condition
     * @return
     */
    @Override
    public List<Measurement> findByCondition(String condition) {
        Example example = new Example(Measurement.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andLike("content", "%" + condition.substring(0, condition.length() - 1) + "%");
        List<Measurement> measurements = measurementMapper.selectByExample(example);
        return measurements;
    }

    /**
     * 魏彤羽
     * 根据困难等级查询
     *
     * @param level
     * @return
     */
    @Override
    public List<Measurement> findByLevel(String level) {
        Example example = new Example(Measurement.class);
        Example.Criteria criteria = example.createCriteria();
        System.err.println("service传入的level：" + level);
        criteria.andEqualTo("level", level);
        List<Measurement> measurements = measurementMapper.selectByExample(example);
        System.err.println("service返回的list：" + measurements);
        return measurements;
    }

    /**
     * 魏彤羽
     * 添加
     * @param measurement
     */
    @Override
    public void insert(Measurement measurement) {
        measurementMapper.insert(measurement);
    }

    /**
     * 魏彤羽
     * 根据id删除
     *
     * @param id
     */
    @Override
    public void deleteById(Integer id) {
        measurementMapper.deleteByPrimaryKey(id);
    }

    /**
     * 魏彤羽
     * 根据id更新
     *
     * @param measurement
     */
    @Override
    public void updateById(Measurement measurement) {
        measurementMapper.updateByPrimaryKey(measurement);
    }
    /**
     * 杨晨
     * 历史记录查询
     */
    @Override
    public List<Measurement> findUserHistory(User user) {
        if(user==null){
            return null;
        }
        //根据id查询所对应的历史记录
        Example example = new Example(History.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("uid",user.getUid());
        List<Measurement> list = measurementMapper.selectByExample(example);
        return list;
    }


    /**
     * 添加题库
     * 朱锦祥
     */
    @Override
    public void addMeasurement(Measurement measurement) {
        measurementMapper.insert(measurement);
    }
}
