package com.sss.controller.cases;

import com.github.pagehelper.PageInfo;
import com.sss.bean.Question;
import com.sss.bean.User;
import com.sss.service.cases.CaseService;
import com.sss.service.indexViews.IndexViewsService;
import com.sss.vo.ASVo;
import com.sss.vo.QtypeVo;
import com.sss.vo.SearchVo;
import com.sss.vo.UserVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by ZhangPeng on 2018/6/7
 */
@Controller
@RequestMapping("/case")
public class CaseController {
    /**
    *@Author:XiongTianCi
    *@Description:获得用于统计访问量的service
    *@return:
    */
    @Resource
    private IndexViewsService indexViewsService;

    /**
     * @Author:XiongTianCi
     * @Description:获得 caseService
     */
    @Resource
    private CaseService caseService;

    /**
     * 发帖
     *
     * @authro liangkai
     * 2018/6/8
     */
    @RequestMapping("/addCard")
    public String addCard(HttpServletRequest request, @RequestParam(name = "title") String title, @RequestParam(name = "class") String qtype, @RequestParam(name = "content") String qtext) {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            return "/user/login";
        } else {
            System.out.printf(user.getName() + user.getUid());
            Question qs = new Question();
            qs.setQbt(title);
            qs.setQtype(qtype);
            qs.setQs(qtext);
            Date date = new Date();
            qs.setQtime(date);
            qs.setUid(user.getUid());
            caseService.insert(qs);
            return "redirect:/case/WangShuang";
        }
    }

    /**
     * @Author WangShuang
     * @Description 周榜的用户信息
     */
    @RequestMapping("/WangShuang")
    public String findMaxAnswerUser(HttpServletRequest request, HttpServletResponse response) {
        /*用于统计访问 交流互助中心 的访问量 xiongtianci*/
        // 获得cookie
        Cookie cookie2 = null;
        Cookie[] cookies = request.getCookies();
        if(cookies != null){
            for(Cookie c : cookies){
                if(c.getName().equals("cookie2")){
                    cookie2 = c;
                }
            }
        }

        // 获得访问路径
        String path = request.getServletPath();
//        System.out.println("啦啦啦啦啦：" + path);
        // 给指定的路径命名
        if(path.contains("netdisk")){
            path = "资源中心";
        }else if(path.contains("case")){
            path = "交流互助中心";
        }else if(path.contains("yestodayOrder")){
            path = "早点服务";
        }else if(path.contains("measurement")){
            path = "竞赛";
        }else if(path.contains("exception")){
            path = "异常";
        }else{
            path = null;
        }

        // 处理;path必须不为null时，才进行统计资源访问情况
        if(path != null){
            // 判断ipCookie是否为空;不为空，则在20min之内
            if(cookie2 == null){
                cookie2 = new Cookie("cookie2","2");
                // cookie为null；说明是第一次此ip为访问 或者 是20min后又一次访问
                // 直接将访问路径和时间存入数据库
                indexViewsService.addVisit(path);
                // 将cookie存入response中
                cookie2.setPath("/");
                cookie2.setMaxAge(60*20);
                response.addCookie(cookie2);
            }
        }
        /*用于统计访问 交流互助中心 的访问量*/


        PageInfo<User> pageInfo = caseService.findMaxAnswerUser();
        List<UserVo> UserVoList = new ArrayList<>();
        for (User user : pageInfo.getList()) {
            Integer num = caseService.selectAnswerNum(user.getUid());
            UserVo userVo = new UserVo();
            userVo.setUser(user);
            userVo.setAnswerNum(num);
            UserVoList.add(userVo);
        }
        request.getSession().setAttribute("UserVoList", UserVoList);
        return "forward:/case/find?qtype=4&results=";
    }

    /**
     * @Author:XiongTianCi
     * @Description:通过ajax查询置顶内容
     */
    @RequestMapping(value = "/qtypeAjax", method = {RequestMethod.POST, RequestMethod.GET})
    public @ResponseBody
    QtypeVo ajax(@RequestBody(required = false) QtypeVo qtypeVo) {
        // 通过 qtype 查询各分类的置顶内容
        List<Question> qList = caseService.findByQtypeAndQstick(qtypeVo.getQtype());

        // 处理每个问题的创建时间；今天、一天前、两天前、三天前、日期str
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        // 遍历每个问题，处理qtime，获得qtimeStr
        for (Question q : qList) {
            q.setQtimeStr(dateFormat.format(q.getQtime()));
        }
        // 将查询的结果封装进vo中
        qtypeVo.setqList(qList);

        // 返回结果
        return qtypeVo;
    }

    /**
    *@Author:XiongTianCi
    *@Description:通过ajax查询 首页 对应的内容
    *@return:
    */
    @RequestMapping(value="/qtypeAjax2")
    public @ResponseBody QtypeVo qtypeAjax2(@RequestBody QtypeVo qtypeVo){
        List<Question> qList = null;
        // 判断qtype
        if(qtypeVo.getQtype().equals("首页")){
            qList = caseService.findQuestionByQtype(qtypeVo.getQtype());
        }

        // 处理每个问题的创建时间；
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        // 遍历每个问题，处理qtime，获得qtimeStr
        for (Question q : qList) {
            q.setQtimeStr(dateFormat.format(q.getQtime()));
        }
        // 将查询的结果封装进vo中
        qtypeVo.setqList(qList);

        // 返回结果
        return qtypeVo;
    }

    /**
     * @Author:XiongTianCi
     * @Description:搜索框联想功能
     * @return:返回一个封装了查询结果Question集合的vo类
     */
    @RequestMapping(value = "/associateSearch", method = {RequestMethod.POST, RequestMethod.GET})
    public @ResponseBody
    ASVo associateSearch(@RequestBody(required = false) ASVo vo) {
        // 获得ajax数据
        String qtype = vo.getQtype();
        String searchName = vo.getSearchName();

        // searchName 为模糊查询
        StringBuilder sb = new StringBuilder();
        sb.append("%");
        if (searchName != null && searchName.trim().length() != 0) {
            String[] arr = searchName.split("");
            for (String str : arr) {
                sb.append(str).append("%");
            }

            // 使用service进行查询
            List<Question> qList = null;
            /*首页进行单独查询*/
            if(qtype.equals("首页")){
                qList = caseService.findByQtypeAndQbt4(qtype,sb.toString());
                /*首页进行单独查询*/
            }else{
                qList = caseService.findByQtypeAndQbt(qtype, sb.toString());
            }
            // 将查询结果封装进vo中
            vo.setqList(qList);

            // 返回
            return vo;
        } else {
            // searchName为空将返回null
            return null;
        }

    }


    /**
     * @Author:HuaHu
     * @Description:按导读条查询综合内容
     * @return:将查询结果存放到request域中
     */
    @RequestMapping("/find")
    public String find(@RequestParam("qtype") Integer qtype,@RequestParam("results") Integer results,Model model) {
        String strQtype = "";
        if (qtype == 4) {
            PageInfo<Question> pageInfo = caseService.findAll();
            model.addAttribute("pageInfo", pageInfo);
            model.addAttribute("qtype", qtype);
            model.addAttribute("ZH", 3);
            if(results!=null){
                return "/cases/results";
            }
            return "/cases/case";
        } else {
            if (qtype == 0) {
                strQtype = "传智热点";
            }
            if (qtype == 1) {
                strQtype = "生活日常";
            }
            if (qtype == 2) {
                strQtype = "学术难疑";
            }
            if (qtype == 3) {
                strQtype = "技术分享";
            }
            if (qtype == 4) {
                strQtype = "首页";
            }
        }
        PageInfo<Question> pageInfo = caseService.find(strQtype);

        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("qtype", qtype);
        model.addAttribute("ZH", 3);
        if(results!=null){
            return "/cases/results";
        }
        return "/cases/case";

    }

    /**
     * @Author:HuaHu
     * @Description:搜索 未结/已结 内容
     * @return:将查询结果存放到request域中
     */
    @RequestMapping("/findQstate")
    public String findQstate(@RequestParam("qstate") Integer qstate, @RequestParam("qtype") Integer qtype,@RequestParam("results") Integer results, Model model) {
        System.out.println(6666666);
        String strQtype = "";
        if(qtype == 4 || qtype==null){
            PageInfo<Question> pageInfo = caseService.findByQstate(qstate);
            model.addAttribute("pageInfo", pageInfo);
            model.addAttribute("qtype", qtype);
            model.addAttribute("qstate", qstate);
            model.addAttribute("ZH", 3);

            if(results!=null){
                return "/cases/results";
            }else{
                return "/cases/case";
            }
        } else {
            if (qtype == 0) {
                strQtype = "传智热点";
            }
            if (qtype == 1) {
                strQtype = "生活日常";
            }
            if (qtype == 2) {
                strQtype = "学术难疑";
            }
            if (qtype == 3) {
                strQtype = "技术分享";
            }

        }
        System.out.println(strQtype);
       PageInfo<Question> pageInfo = caseService.findQstate(qstate, strQtype);
       //PageInfo<Question> pageInfo = caseService.findByQstate(qstate);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("qtype", qtype);
        model.addAttribute("qstate", qstate);
        model.addAttribute("ZH", 3);
        if(results!=null){
            return "/cases/results";
        }else{

            return "/cases/case";
        }
    }

    /**
     * @Author:HuaHu
     * @Description:按最新搜索
     * @return:将查询结果存放到request域中
     */
    @RequestMapping("/findTime")
    public String findQime(@RequestParam("qstate") Integer qstate, @RequestParam("qtype") Integer qtype,@RequestParam("results") Integer results, Model model) {
        // new InternalResourceViewResolver();
        PageInfo<Question> pageInfo = null;
        if (qstate == null && qtype == 4) {

            pageInfo = caseService.findQtime();
            model.addAttribute("pageInfo", pageInfo);
            model.addAttribute("qstate", qstate);
            model.addAttribute("qtype", qtype);
            model.addAttribute("ZH", 3);
            model.addAttribute("qhuahu", 0);
          if(results !=null){
              return "/cases/results";
          }
            return "/cases/case";
        } else if (qstate == null) {
            String strQtype = "";
            if (qtype == 0) {
                strQtype = "传智热点";
            }
            if (qtype == 1) {
                strQtype = "生活日常";
            }
            if (qtype == 2) {
                strQtype = "学术难疑";
            }
            if (qtype == 3) {
                strQtype = "技术分享";
            }

            pageInfo = caseService.findQtimeByQtype(strQtype);
            model.addAttribute("pageInfo", pageInfo);
            model.addAttribute("qtype", qtype);
            model.addAttribute("ZH", 3);
            model.addAttribute("qhuahu", 0);

            if(results!=null){
                return "/cases/results";
            }
            return "/cases/case";
        } else if (qtype == 4) {
            pageInfo = caseService.findQtimeByQstate(qstate);
            model.addAttribute("pageInfo", pageInfo);
            model.addAttribute("qstate", qstate);
            model.addAttribute("qtype", qtype);
            model.addAttribute("ZH", 3);
            model.addAttribute("qhuahu", 0);
            if(results !=null){
                return "/cases/results";
            }
            return "/cases/case";
        } else {
            String strQtype = "";
            if (qtype == 0) {
                strQtype = "传智热点";
            }
            if (qtype == 1) {
                strQtype = "生活日常";
            }
            if (qtype == 2) {
                strQtype = "学术难疑";
            }
            if (qtype == 3) {
                strQtype = "技术分享";
            }

            pageInfo = caseService.findQtimeByQstateAndQtype(qstate, strQtype);
            model.addAttribute("pageInfo", pageInfo);
            model.addAttribute("qstate", qstate);
            model.addAttribute("qtype", qtype);
            model.addAttribute("ZH", 3);
            model.addAttribute("qhuahu", 0);

            if(results!=null){
                return "/cases/results";
            }
            return "/cases/case";
        }

    }

    /**
     * @Author:HuaHu
     * @Description:按热议搜索
     * @return:将查询结果存放到request域中
     */
    @RequestMapping("/findDjs")
    public String findDjs(@RequestParam("qstate") Integer qstate, @RequestParam("qtype") Integer qtype,@RequestParam("results") Integer results, Model model) {
        // new InternalResourceViewResolver();
        PageInfo<Question> pageInfo = null;
        if (qstate == null && qtype == 4) {

            pageInfo = caseService.findDjs();
            model.addAttribute("pageInfo", pageInfo);
            model.addAttribute("qstate", qstate);
            model.addAttribute("qtype", qtype);
            model.addAttribute("ZH", 3);
            model.addAttribute("qhuahu", 1);
            if(results !=null){
                return "/cases/results";
            }
                return "/cases/case";
        } else if (qstate == null) {
            String strQtype = "";
            if (qtype == 0) {
                strQtype = "传智热点";
            }
            if (qtype == 1) {
                strQtype = "生活日常";
            }
            if (qtype == 2) {
                strQtype = "学术难疑";
            }
            if (qtype == 3) {
                strQtype = "技术分享";
            }

            pageInfo = caseService.findDjsByQtype(strQtype);
            model.addAttribute("pageInfo", pageInfo);
            model.addAttribute("qtype", qtype);
            model.addAttribute("ZH", 3);
            model.addAttribute("qhuahu", 1);

            if(results!=null){
                return "/cases/results";
            }
            return "/cases/case";
        } else if (qtype == 4) {
            pageInfo = caseService.findDjsByQstate(qstate);
            model.addAttribute("pageInfo", pageInfo);
            model.addAttribute("qstate", qstate);
            model.addAttribute("qtype", qtype);
            model.addAttribute("ZH", 3);
            model.addAttribute("qhuahu", 1);
            if(results!=null){
                return "/cases/results";
            }
            return "/cases/case";
        } else {
            String strQtype = "";
            if (qtype == 0) {
                strQtype = "传智热点";
            }
            if (qtype == 1) {
                strQtype = "生活日常";
            }
            if (qtype == 2) {
                strQtype = "学术难疑";
            }
            if (qtype == 3) {
                strQtype = "技术分享";
            }
            pageInfo = caseService.findDjsByQstateAndQtype(qstate, strQtype);
            model.addAttribute("pageInfo", pageInfo);
            model.addAttribute("qstate", qstate);
            model.addAttribute("qtype", qtype);
            model.addAttribute("ZH", 3);
            model.addAttribute("qhuahu", 1);

            if(results!=null){
                return "/cases/results";
            }
            return "/cases/case";
        }

    }


    /**
     * @Author:XiongTianCi
     * @Description:通过搜索框搜索时的跳转功能
     * @return:
     */
    @RequestMapping("/results")
    public String searchByText(String qtype, Model model) {
        // 获得
        System.out.println("进来了");
        System.out.println(qtype);


        return "/cases/results";
    }

    /**
     * @Author:XiongTianCi
     * @Description:用于 知识互助中心 的搜索功能
     * @return:转发到results.jsp页面，展示搜索的结果
     */
    @RequestMapping("/searchTextAndQtype")
    public String searchTextAndQtype(SearchVo searchVo, Model model) {

        PageInfo<Question> pageInfo = null;
        // 获得qtype
        String qtype = searchVo.getQtype();
        // 获得搜索框内容
        String searchText = searchVo.getSearchText();

        pageInfo= caseService.findBySearchText(qtype, searchText);

        int strQtype =4;
//        if (qtype.equals("传智热点")) {
//            strQtype = 0;
//        }
//        if (qtype.equals("生活日常")) {
//            strQtype = 1;
//        }
//        if (qtype.equals("学术难疑")) {
//            strQtype = 2;
//        }
//        if (qtype.equals("技术分享")) {
//            strQtype = 3;
//        }
        // 将数据存放到model中
        model.addAttribute("pageInfo", pageInfo);

        model.addAttribute("qtype", strQtype);
        model.addAttribute("searchText", searchText);

        // 转发到results.jsp页面
        return "/cases/results";
    }

    /**
     * @Author:ZhangPeng
     * @Description:点击帖子进入详情前给改帖子添加点击数
     */
    @RequestMapping("/todetails")
    public String todetails(@RequestParam("qid") Integer qid, HttpServletRequest request) {
        Integer uid = caseService.findUidByQid(qid);
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            return "redirect:/details/show?qid=" + qid + "";
        }
        if (user.getUid() != uid) {
            caseService.updateDjs(qid);
        }
        return "redirect:/details/show?qid=" + qid + "";
    }

}
