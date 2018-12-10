package com.sss.controller.competition;

import com.sss.bean.Measurement;
import com.sss.bean.User;
import com.sss.service.competition.MeasurementService;
import com.sss.service.indexViews.IndexViewsService;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.jws.WebParam;
import javax.servlet.http.*;
import java.util.List;

/**
 * @author 魏彤羽
 */
@Controller
@RequestMapping("/measurement")
public class MeasurementController {
    @Resource
    private IndexViewsService indexViewsService;

    @Resource
    private MeasurementService measurementService;

    /**
     * 魏彤羽
     * 查询所有
     *
     * @return
     */
    @RequestMapping("/findAll")
    public String findAll(Model model) {
        List<Measurement> measurementList = measurementService.findAll();
        model.addAttribute("measurementList", measurementList);
        return "/competition/list";
    }

    /**
     * 魏彤羽
     * 根据id查询详情
     *
     * @param id
     * @return
     */
    @RequestMapping("/findById")
    public Measurement findById(Integer id) {
        Measurement measurement = measurementService.findById(id);
        return measurement;

    }

    /**
     * 魏彤羽
     * 根据题目名称模糊查询
     *
     * @param condition
     * @return
     */
    @RequestMapping("/findByCondition")
    public @ResponseBody
    List<Measurement> findByCondition(@RequestBody String condition) {
        List<Measurement> measurementList = measurementService.findByCondition(condition);
        return measurementList;
    }

    /**
     * 魏彤羽
     * 根据困难等级查询
     *
     * @param level
     * @return
     */
    @RequestMapping("/findByLevel")
    public String findByLevel(String level, Model model) {
        System.err.println("controller执行+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
        List<Measurement> measurementList = measurementService.findByLevel(level);
        System.err.println("controller传入level："+level);
        model.addAttribute("measurementList", measurementList);
        System.err.println("controller返回的list："+measurementList);
        return "/competition/list";
    }

    /**
     * 魏彤羽
     * 添加
     *
     * @param measurement 传入bean
     * @return
     */
    @RequestMapping("/insert")
    public String insert(Measurement measurement) {
        measurementService.insert(measurement);
        return "";
    }

    /**
     * 魏彤羽
     * 根据id删除
     *
     * @param id 传入id
     * @return
     */
    @RequestMapping("/deleteById")
    public String delete(Integer id) {
        measurementService.deleteById(id);
        return "";
    }

    /**
     * 魏彤羽
     * 根据id更新
     *
     * @param measurement 传入bean
     * @return
     */
    @RequestMapping("/updateById")
    public String update(Measurement measurement) {
        measurementService.updateById(measurement);
        return "";
    }

    /**
     * 访问主页面时加载此方法
     * 杨晨
     */
    @RequestMapping("/index")
    public String index(HttpSession session, HttpServletRequest request,HttpServletResponse response) {
        /*用于统计访问 竞赛 的访问量 xiongtianci*/
        // 获得cookie
        Cookie cookie4 = null;
        Cookie[] cookies = request.getCookies();
        if(cookies != null){
            for(Cookie c : cookies){
                if(c.getName().equals("cookie4")){
                    cookie4 = c;
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
            if(cookie4 == null){
                cookie4 = new Cookie("cookie4","1");
                // cookie为null；说明是第一次此ip为访问 或者 是20min后又一次访问
                // 直接将访问路径和时间存入数据库
                indexViewsService.addVisit(path);

                // 将cookie存入response中
                cookie4.setPath("/");
                cookie4.setMaxAge(60*20);
                response.addCookie(cookie4);
            }
            /*cookie不为null，无变化*/
        }
        /*用于统计访问 竞赛 的访问量*/

        User user = (User) session.getAttribute("user");
        request.setAttribute("user", user);
        return "/competition/index";
    }
    /**
     * 访问历史页面时加载此方法
     * 杨晨
     */
    @RequestMapping("/history")
    public String history(HttpSession session,HttpServletRequest request){
        //强行转换为user
        List<Measurement> list = measurementService.findUserHistory((User) session.getAttribute("user"));
        System.out.println(list+"------------测试---------------------------------------");
        request.setAttribute("list",list);
        return "/competition/list_history";
    }

    /**
     * 添加题库
     * 朱锦祥
     */
    @RequestMapping("/addMeasurement")
    public String addMeasurement(Measurement measurement,User user){
        measurement.setAllnumber((long)0);
        measurement.setTnumber((long)0);
        measurement.setPassrate("0%");
        measurement.setUid(user.getUid());
        measurementService.addMeasurement(measurement);
        return "/measurement/findAll";
    }
}
