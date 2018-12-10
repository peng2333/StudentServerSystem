package com.sss.controller.indexViews;

import com.sss.bean.VisitView;
import com.sss.service.indexViews.IndexViewsService;
import com.sss.service.indexViews.MapViewService;
import com.sss.vo.MapViewVo;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by XiongTianCi on 2018/6/28
 *  用于首页
 * @author tianci
 */
@Controller
public class IndexViewsController {
    @Resource
    private IndexViewsService indexViewsService;
    @Resource
    private MapViewService mapViewService;

    /**
    *@Author:XiongTianCi
    *@Description:用于记录“资源中心”的访问数据
    *@return:
    */
    @RequestMapping("/netdisk/index")
    public String netdiskIndex(HttpServletRequest request, HttpServletResponse response){
        /*用于统计访问 资源中心 的访问量 xiongtianci*/
        // 获得cookie
        Cookie cookie1 = null;
        Cookie[] cookies = request.getCookies();
        if(cookies != null){
            for(Cookie c : cookies){
                if(c.getName().equals("cookie1")){
                    cookie1 = c;
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
            if(cookie1 == null){
                cookie1 = new Cookie("cookie1","1");
                // cookie为null；说明是第一次此ip为访问 或者 是20min后又一次访问
                // 直接将访问路径和时间存入数据库
                indexViewsService.addVisit(path);

                // 将cookie存入response中
                cookie1.setPath("/");
                cookie1.setMaxAge(60*20);
                response.addCookie(cookie1);
            }
            /*cookie不为null，无变化*/
        }
        /*用于统计访问 资源中心 的访问量*/

        return  "/netdisk/index";
    }

    /**
    *@Author:XiongTianCi
    *@Description:用于显示访问记录统计
    *@return:
    */
    @RequestMapping("/admin/admin")
    private String visitView(Model model,String view){
        if(view == null){
            view = "sxt";
        }

        // 查询数据
        List<VisitView> allWithVisit = indexViewsService.findAllWithVisit();

        model.addAttribute("value1",allWithVisit.get(0).getNum());
        model.addAttribute("value2",allWithVisit.get(1).getNum());
        model.addAttribute("value3",allWithVisit.get(2).getNum());
        model.addAttribute("value4",allWithVisit.get(3).getNum());
        model.addAttribute("value5",allWithVisit.get(4).getNum());
        // 判断；view=sxt-->显示扇形图 为 zzt-->显示柱状图
        if(view.equals("zzt")){
            model.addAttribute("view","zzt");
        }else{
            model.addAttribute("view","sxt");
        }
        // 返回
        return "/admin/admin";
    }


    /**
    *@Author:XiongTianCi
    *@Description:用户访问统计每天重置
    *@return:
    */
    @RequestMapping("/index/indexViews/visitView")
    private void gengxin(HttpServletRequest request,HttpServletResponse response){
        /*记录当前用户ip地址*/
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("Proxy-Client-IP");
            }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("WL-Proxy-Client-IP");
            }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("HTTP_CLIENT_IP");
            }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("HTTP_X_FORWARDED_FOR");
            }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getRemoteAddr();
            }
        // 将ip存入数据库
        indexViewsService.addIp(ip);
        /*记录当前用户ip地址*/

        /*每天重置用户访问统计数据  暂时不进行清除；因为此方法会导致新的一天中每一个用户第一次使用时都会进行重置*/
        // 获得当前时间
        /*SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd");
        String newDate = d.format(new Date());
        // 获得存放判断是否为同一天的cookie
        Cookie cookie = null;
        Cookie[] cookies = request.getCookies();
        if(cookies != null){
            for(Cookie c : cookies){
                if(c.getName().equals("visitCookieWithDay")){
                    cookie = c;
                }
            }
        }
        //
        if(cookie != null){
            // 判断是否为同一天
            if(!cookie.getValue().equals(newDate)){
                // 不为同一天，重置数据库
                indexViewsService.resetDatabase();
                // 创建新的cookie，添加进response中，记录新的时间
                cookie = new Cookie("visitCookieWithDay",newDate);
                cookie.setPath("/");
                cookie.setMaxAge(60*60*24*365);
                response.addCookie(cookie);
            }
        }else{
            // 重置数据库
            indexViewsService.resetDatabase();
            // 创建cookie，添加进response中
            cookie = new Cookie("visitCookieWithDay",newDate);
            cookie.setPath("/");
            cookie.setMaxAge(60*60*24*365);
            response.addCookie(cookie);
        }*/
        /*每天重置用户访问统计数据*/

    }


    /**
    *@Author:XiongTianCi
    *@Description:用于地图数据展示
    *@return:
    */
    @RequestMapping("/indexView/mapView")
    private String mapView(Model model){
        // 准备各省的数据，初始化为0
        List<MapViewVo> mapVoList = new ArrayList<>();
        mapVoList.add(new MapViewVo("北京",0));
        mapVoList.add(new MapViewVo("天津",0));
        mapVoList.add(new MapViewVo("上海",0));
        mapVoList.add(new MapViewVo("重庆",0));
        mapVoList.add(new MapViewVo("河北",0));
        mapVoList.add(new MapViewVo("河南",0));
        mapVoList.add(new MapViewVo("云南",0));
        mapVoList.add(new MapViewVo("辽宁",0));
        mapVoList.add(new MapViewVo("黑龙江",0));
        mapVoList.add(new MapViewVo("湖南",0));
        mapVoList.add(new MapViewVo("安徽",0));
        mapVoList.add(new MapViewVo("山东",0));
        mapVoList.add(new MapViewVo("新疆",0));
        mapVoList.add(new MapViewVo("江苏",0));
        mapVoList.add(new MapViewVo("浙江",0));
        mapVoList.add(new MapViewVo("江西",0));
        mapVoList.add(new MapViewVo("湖北",0));
        mapVoList.add(new MapViewVo("广西",0));
        mapVoList.add(new MapViewVo("甘肃",0));
        mapVoList.add(new MapViewVo("山西",0));
        mapVoList.add(new MapViewVo("内蒙古",0));
        mapVoList.add(new MapViewVo("陕西",0));
        mapVoList.add(new MapViewVo("吉林",0));
        mapVoList.add(new MapViewVo("福建",0));
        mapVoList.add(new MapViewVo("贵州",0));
        mapVoList.add(new MapViewVo("广东",0));
        mapVoList.add(new MapViewVo("青海",0));
        mapVoList.add(new MapViewVo("西藏",0));
        mapVoList.add(new MapViewVo("四川",0));
        mapVoList.add(new MapViewVo("宁夏",0));
        mapVoList.add(new MapViewVo("海南",0));
        mapVoList.add(new MapViewVo("台湾",0));
        mapVoList.add(new MapViewVo("香港",0));
        mapVoList.add(new MapViewVo("澳门",0));
        mapVoList.add(new MapViewVo("南海诸岛",0));



        List<MapViewVo> list = mapViewService.findAll();
        // 遍历list，更改mapVoList中对应的数据
        for(MapViewVo m : mapVoList){
            for(MapViewVo m2 : list){
                if(m.getName().equals(m2.getName()) || m2.getName().contains(m.getName())){
                    m.setValue(m2.getValue());
                }
            }
        }

        JSONArray jsonArray = JSONArray.fromObject(mapVoList);
//        System.out.println(jsonArray.toString());
        /*查询用户最多的三个城市*/
        List<MapViewVo> list2 = mapViewService.findMaxCity();
        for(int a = 0; a < list2.size() ; a++){
            model.addAttribute("maxCity"+a,list2.get(a).getName());
        }
        /*查询用户最多的三个城市*/
        //
        model.addAttribute("dataMapList",jsonArray.toString()+"");
        model.addAttribute("view","dt");
        return "/admin/admin";
    }
}
