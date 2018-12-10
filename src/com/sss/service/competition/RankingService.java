package com.sss.service.competition;

import com.sss.bean.Ranking;
import com.sss.bean.User;

import java.util.List;

/**
 * @author 魏彤羽
 */
public interface RankingService {
    /**
     * 魏彤羽
     * 查询所有
     * @return
     */
    List<Ranking> findAll();

    /**
     * 魏彤羽
     * 根据uid查询详情
     * @param uid
     * @return
     */
    Ranking findByUid(Integer uid);

    /**
     * 魏彤羽
     * 添加
     * @param ranking
     */
    void insert(Ranking ranking);

    /**
     * 魏彤羽
     * 根据uid删除
     * @param uid
     */
    void deleteByUid(Integer uid);

    /**
     * 魏彤羽
     * 根据uid更新
     * @param ranking
     */
    void updateByUid(Ranking ranking);
    /**
     * @author  LiangKai
     * Rank
     */
    List<User> selectRankList();
}
