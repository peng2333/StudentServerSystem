package com.sss.controller.competition;

import com.sss.bean.Ranking;
import com.sss.bean.User;
import com.sss.service.competition.RankingService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author 魏彤羽
 */
@Controller
@RequestMapping("/ranking")
public class RankingController {
    @Resource
    private RankingService rankingService;

    /**
     * 魏彤羽
     * 查询所有
     * @return
     */
    @RequestMapping("/findAll")
    public String findAll(){
        List<Ranking> rankingList = rankingService.findAll();
        return "";
    }

    /**
     * 魏彤羽
     * 根据uid查询详情
     * @param uid
     * @return
     */
    @RequestMapping("/findByUid")
    public Ranking findById(Integer uid){
        Ranking ranking = rankingService.findByUid(uid);
        return ranking;
    }

    /**
     * 魏彤羽
     * 添加
     * @param ranking
     * @return
     */
    @RequestMapping("/insert")
    public String insert(Ranking ranking){
        rankingService.insert(ranking);
        return "";
    }

    /**
     * 魏彤羽
     * 根据uid删除
     * @param uid
     * @return
     */
    @RequestMapping("/deleteByUid")
    public String deleteByUid(Integer uid){
        rankingService.deleteByUid(uid);
        return "";
    }

    /**
     * 魏彤羽
     * 根据uid更新
     * @param ranking
     * @return
     */
    public String update(Ranking ranking){
        rankingService.updateByUid(ranking);
        return "";
    }
    /***
     * @author LiangKai
     */
    @RequestMapping(value = "/rankingList",method={RequestMethod.POST, RequestMethod.GET})
    public @ResponseBody List<User> RankingList(){
        List<User> list=rankingService.selectRankList();
        List<User> userList=new ArrayList<User>();
        userList.add(list.get(0));
        userList.add(list.get(1));
        userList.add(list.get(2));
        return userList;
    }
}
