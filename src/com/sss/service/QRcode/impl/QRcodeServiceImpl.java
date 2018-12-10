package com.sss.service.QRcode.impl;

import com.sss.bean.QRcode;
import com.sss.mapper.QRcode.QRcodeMapper;
import com.sss.service.QRcode.QRcodeService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;

@Service
@Transactional
public class QRcodeServiceImpl implements QRcodeService {

    @Resource
    private QRcodeMapper qRcodeMapper;

    @Override
    public void add(QRcode qRcode) {
        qRcodeMapper.add(qRcode);
    }

    @Override
    public String findByOrdersNum(String ordersNumber) {
        Example example = new Example(QRcode.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("ordersNumber",ordersNumber);
        QRcode qRcode = qRcodeMapper.selectOneByExample(example);
        return qRcode.getQrname();
    }
}

