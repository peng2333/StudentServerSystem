package com.sss.controller.breakfast;

import com.github.pagehelper.PageInfo;
import com.sss.bean.Food;
import com.sss.bean.Shop;
import com.sss.bean.ShopEvaluate;
import com.sss.bean.ShopSort;
import com.sss.service.breakfast.ShopEvaluateService;
import com.sss.service.breakfast.ShopService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ShopController {

    @Resource
    private ShopService shopService;
    @Resource
    private ShopEvaluateService shopEvaluateService;


    /**
     * @author: 朱元浩
     * @date: 2018/6/15 8:36
     * @Param: [model]
     * @return: java.lang.String
     * @Description: 查询所有分类和商家
     */
    @RequestMapping("/selectAll")
    public String selectAll(Integer index , Shop shop , Model model){
        model.addAttribute("index",index);
        //查询所有分类
        List<ShopSort> allShopSort = shopService.selectAllShopSort();
        model.addAttribute("allShopSort",allShopSort);
        //查询所有商家
        if( shop.getShopSortId()!= null){
            List<Shop> shopList = shopService.selectBySortId(shop.getShopSortId());
            model.addAttribute("shopList",shopList);
        }else{
            List<Shop> shopList = shopService.selectAll();
            model.addAttribute("shopList",shopList);
        }
        return "forward:/breakfast/allShop.jsp";
    }

    /**
     * @author: 朱元浩
     * @date: 2018/6/19 11:42
     * @Param: []
     * @return: java.lang.String
     * @Description: 通过食物id查找商家
     */
    @RequestMapping("findShopByFood")
    public String findShopByFood(Food food){
        System.out.println(food.getSortId());
        List<Shop> shopList = shopService.selectBySortId(food.getSortId());
        System.out.println(shopList.size());
        Shop shop = shopList.get(0);
        return "redirect:/findAllFoodById.action?sid="+shop.getSid();
    }

    /**
     * 通过商家id查找对应的所有评价
     * @author: 李金发
     * @return
     */
    @RequestMapping("findEvaluateBySid")
    public String findEvaluateBySid(String sid, Integer page,Integer rows , Model model){
        Shop shop = shopService.selectByPrimaryKey(Integer.parseInt(sid));
        // 查询商家对应的各星级评价(1-5星)
        shop.setShopStarList(shopEvaluateService.findEvaluateList(Integer.parseInt(sid)));
        model.addAttribute(shop);
        page = page == null ? 1:page;
        PageInfo<ShopEvaluate> pageInfo = shopEvaluateService.findAllBySid(sid, page);
        //处理分页，只显示5页
        int start = 1;
        int end = 5;
        if(pageInfo.getPages() < 5){
            end = pageInfo.getPages();
        }else{
            //当前页，前2后2
            start = pageInfo.getPageNum() - 2;
            end = pageInfo.getPageNum() + 2;

            if(start < 1){
                start = 1;
                end = 5;
            }

            if(end > pageInfo.getPages()){
                end = pageInfo.getPages();
                start = pageInfo.getPages() - 4;
            }
        }

        model.addAttribute("start",start);
        model.addAttribute("end",end);
        model.addAttribute("pageInfo",pageInfo);
        return "forward:/breakfast/food_evaluate.jsp";
    }


}
