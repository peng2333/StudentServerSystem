package com.sss.service.competition.impl;

import com.sss.bean.Measurement;
import com.sss.bean.User;
import com.sss.mapper.competition.MeasurementMapper;
import com.sss.mapper.user.UserMapper;
import com.sss.service.competition.BackstageService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class BackstageServiceImpl implements BackstageService {

    @Resource
    private MeasurementMapper  measurementMapper;
    @Resource
    private UserMapper userMapper;


    @Override
    public List<Measurement> Alllist() {
        List<Measurement> list = measurementMapper.selectAll();
        return measurementMapper.selectAll();
    }

    @Override
    public Measurement findobj(Integer id) {
        Example example = new Example(Measurement.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("id",id);
        Measurement measurement = measurementMapper.selectOneByExample(example);
        measurement.setUser(userMapper.selectByPrimaryKey(measurement.getUid()));
        return measurementMapper.selectOneByExample(example);
    }

    @Override
    public void updata(Measurement obj) {
        measurementMapper.updateByPrimaryKey(obj);
    }

    @Override
    public void deleteObj(Integer id) {
        measurementMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<Measurement> findByCondition(String condition) {
        Example example = new Example(Measurement.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andLike("content","%"+condition+"%");
        return measurementMapper.selectByExample(example);
    }

    @Override
    public void inssue(Integer id) {
        List<Measurement> measurements = measurementMapper.selectAll();
        for (Measurement m : measurements) {
            if(id.equals(m.getId()) ){
                System.out.println("找到对应的对象");
                m.setOmgcool("1");
            }else {
                System.err.println("不是对应的对象");
                m.setOmgcool("0");
            }
            measurementMapper.updateByPrimaryKey(m);
        }

    }
}
