package com.sss.service.competition.impl;

import com.sss.bean.Ranking;
import com.sss.bean.User;
import com.sss.mapper.competition.RankingMapper;
import com.sss.service.competition.RankingService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 魏彤羽
 */
@Service
@Transactional
public class RankingServiceImpl implements RankingService {

    @Resource
    private RankingMapper rankingMapper;

    /**
     * 魏彤羽
     * 查询所有
     * @return
     */
    @Override
    public List<Ranking> findAll() {
        return rankingMapper.selectAll();
    }

    /**
     * 魏彤羽
     * 根据uid查询详情
     * @param uid
     * @return
     */
    @Override
    public Ranking findByUid(Integer uid) {
        return rankingMapper.selectByPrimaryKey(uid);
    }

    /**
     * 魏彤羽
     * 添加
     * @param ranking
     */
    @Override
    public void insert(Ranking ranking) {
        rankingMapper.insert(ranking);
    }

    /**
     * 魏彤羽
     * 根据uid删除
     * @param uid
     */
    @Override
    public void deleteByUid(Integer uid) {
        rankingMapper.deleteByPrimaryKey(uid);
    }

    /**
     * 魏彤羽
     * 根据uid更新
     * @param ranking
     */
    @Override
    public void updateByUid(Ranking ranking) {
        rankingMapper.updateByPrimaryKey(ranking);
    }

    @Override
    public List<User> selectRankList(){
        return rankingMapper.selectRankList();
    };
}
