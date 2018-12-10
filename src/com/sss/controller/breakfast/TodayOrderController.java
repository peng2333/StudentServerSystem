package com.sss.controller.breakfast;

import com.sss.bean.*;
import com.sss.service.QRcode.QRcodeService;
import com.sss.service.breakfast.FoodService;
import com.sss.service.breakfast.ShopService;
import com.sss.service.breakfast.TodayOrderService;
import com.sss.service.indexViews.IndexViewsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller

public class TodayOrderController {
    @Resource
    private IndexViewsService indexViewsService;

    /**
     * @author 蔺思卓
     * <p>
     * 用于查询今日订单，返回了一个Order集合，将Orders集合orders存进了request作用f's'sssssssssssssssss
     */
    @Resource
    private TodayOrderService todayOrderService;

    @Resource
    private FoodService foodService;

    @Resource
    private ShopService shopService;

    @Resource
    private QRcodeService qRcodeService;

    @RequestMapping("/todayOrder")
    public String todayOrder(HttpSession httpSession, Model model) {
        User user = (User) httpSession.getAttribute("user");
        // 如果用户为空,则跳转到登录页面
        if(user == null){
            return "/user/login";
        }
        Integer uid = user.getUid();
        Date date = new Date();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String sdate = dateFormat.format(date);

        List<FoodOrders> byDate = todayOrderService.findByDate(uid, sdate);
        model.addAttribute("date", sdate);
        double count = 0;

        ArrayList<TodayFoodOrderVo> foodsList = new ArrayList<>();
        ArrayList<List> ffos = new ArrayList<>();
        ArrayList<String> pathNames = new ArrayList<>();
        for (FoodOrders f : byDate) {
            count += f.getOrdersPrice();
            List<FoodFoodOrder> ffo = todayOrderService.findByOrdersNum(f.getOrdersNumber());
            ffos.add(ffo);
            String pathName =  qRcodeService.findByOrdersNum(f.getOrdersNumber());
            pathNames.add(pathName);
        }
        if (ffos != null) {
            for (List<FoodFoodOrder> ffo : ffos) {
                TodayFoodOrderVo todayFoodOrderVo = new TodayFoodOrderVo();
                List<FoodOrdersVo2> foods = new ArrayList<>();
                for (FoodFoodOrder f : ffo) {
                    FoodOrdersVo2 vo = new FoodOrdersVo2();
                    Food byFid = todayOrderService.findByFid(f.getFid());
                    vo.setFood(byFid);
                    vo.setFoodNumber(f.getFoodNumber());
                    vo.setPriceSum(f.getPriceSum());
                    foods.add(vo);

                }
                todayFoodOrderVo.setFood(foods);
                foodsList.add(todayFoodOrderVo);
            }
        }

        //二维码查询
        for (int i = 0 ; i < foodsList.size();i++ ){
            foodsList.get(i).setPathName(pathNames.get(i));
        }
        model.addAttribute("lists", foodsList);
        model.addAttribute("Total", count);
        return "/user/message_3";
    }

    @RequestMapping("/yestodayOrder")
    public String yestodayOrder(HttpSession httpSession, Model model, HttpServletRequest request, HttpServletResponse response){
        /*用于统计访问 交流互助中心 的访问量 xiongtianci*/
        // 获得cookie
        Cookie cookie3 = null;
        Cookie[] cookies = request.getCookies();
        if(cookies != null){
            for(Cookie c : cookies){
                if(c.getName().equals("cookie3")){
                    cookie3 = c;
                }
            }
        }

        // 获得访问路径
        String path = request.getServletPath();
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
            if(cookie3 == null){
                cookie3 = new Cookie("cookie3","3");
                // cookie为null；说明是第一次此ip为访问 或者 是20min后又一次访问
                // 直接将访问路径和时间存入数据库
                indexViewsService.addVisit(path);
                // 将cookie存入response中
                cookie3.setPath("/");
                cookie3.setMaxAge(60*20);
                response.addCookie(cookie3);
            }
        }
        /*用于统计访问 交流互助中心 的访问量*/

        //查询热门商品 start  （5条）
        List<Food> foodList = foodService.selectByNumber(5);
        model.addAttribute(foodList);
        //查询热门商品 end

        //查询热门商家 start
        List<Shop> shops = shopService.selectAll();
        Collections.sort(shops, new Comparator<Shop>() {
            @Override
            public int compare(Shop o1, Shop o2) {
                Double d1 = o1.getShopStar();
                Double d2 = o2.getShopStar();
                return (int) Math.floor(d2-d1);
            }
        });
        List<Shop> shopList = new ArrayList<Shop>();
        for (int i = 0; i < 4; i++) {
            shopList.add(shops.get(i));
            System.err.println(shops.get(i).getShopName());
        }
        model.addAttribute(shopList);
        //查询热门商家 end

        User user = (User) httpSession.getAttribute("user");
        if (user == null) {
            model.addAttribute("msg", "您还未登录");
            return "breakfast/index";
        }
        Integer uid = user.getUid();
        Date date = new Date();
        long l = date.getTime();
        l = l - (1000 * 60 * 60 * 24);
        date.setTime(l);
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String sdate = df.format(date);
        List<FoodOrders> byDate = todayOrderService.findByDate(uid, sdate);
        System.out.println(byDate);
        if (byDate.size() == 0) {
            model.addAttribute("msg", "您昨日未购买");
            return "breakfast/index";
        }
        System.out.println(1);
        double count = 0;
        List<FoodFoodOrder> ffo = null;
        for (FoodOrders f : byDate) {
            count += f.getOrdersPrice();
            ffo = todayOrderService.findByOrdersNum(f.getOrdersNumber());
        }

        List<FoodOrdersVo2> foods = new ArrayList<>();
        if (ffo != null) {
            for (FoodFoodOrder f : ffo) {
                FoodOrdersVo2 vo = new FoodOrdersVo2();
                Food byFid = todayOrderService.findByFid(f.getFid());
                vo.setFood(byFid);
                vo.setFoodNumber(f.getFoodNumber());
                System.out.println(f.getPriceSum());
                vo.setPriceSum(f.getPriceSum());

                foods.add(vo);
            }
        }

        model.addAttribute("list", foods);

        return "breakfast/index";
    }
}
