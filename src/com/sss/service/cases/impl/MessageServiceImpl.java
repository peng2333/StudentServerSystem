package com.sss.service.cases.impl;

import com.sss.mapper.cases.MessageMapper;
import com.sss.service.cases.MessageService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * Created by ZhangPeng on 2018/6/12
 */
@Service
@Transactional
public class MessageServiceImpl implements MessageService {

    @Resource
    private MessageMapper messageMapper;


}
