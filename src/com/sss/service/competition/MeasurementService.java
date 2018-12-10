package com.sss.service.competition;

import com.sss.bean.History;
import com.sss.bean.Measurement;
import com.sss.bean.User;

import java.util.List;

/**
 * @author 魏彤羽
 */
public interface MeasurementService {
    /**
     * 魏彤羽
     * 查询所有
     *
     * @return
     */
    List<Measurement> findAll();

    /**
     * 魏彤羽
     * 根据id查询详情
     *
     * @param id
     * @return
     */
    Measurement findById(Integer id);

    /**
     * 魏彤羽
     * 根据题目名称模糊查询
     *
     * @param condition
     * @return
     */
    List<Measurement> findByCondition(String condition);

    /**
     * 魏彤羽
     * 根据困难等级查询
     *
     * @param level
     * @return
     */
    List<Measurement> findByLevel(String level);

    /**
     * 魏彤羽
     * 添加
     *
     * @param measurement
     */
    void insert(Measurement measurement);

    /**
     * 魏彤羽
     * 根据id删除
     *
     * @param id
     */
    void deleteById(Integer id);

    /**
     * 魏彤羽
     * 根据id更新
     *
     * @param measurement
     */
    void updateById(Measurement measurement);

     List<Measurement> findUserHistory(User user );


    /**
     * 添加题库
     * 朱锦祥
     */
    void addMeasurement(Measurement measurement);
}
