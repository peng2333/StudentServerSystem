package com.sss.mapper.competition;

import com.sss.bean.Ranking;
import com.sss.bean.User;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * @author 魏彤羽
 */
public interface RankingMapper extends Mapper<Ranking> {
    @Select("SELECT u.*\n" +
            "FROM ranking r,`user` u\n" +
            "where r.uid=u.uid\n" +
            "ORDER BY r.number DESC ")
   public List<User> selectRankList();
}
