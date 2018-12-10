package com.sss.controller.order;

import com.sss.bean.Food;
import com.sss.bean.Goods;
import com.sss.service.order.GoodsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/goods")
public class GoodsController {

    @Resource
    private GoodsService goodsService;

    @RequestMapping("/findAllGoods")
    public @ResponseBody Goods findAll(@RequestParam("page")Integer page, @RequestParam("limit")Integer limit){
        Goods goods = goodsService.findAll(page, limit);
        return goods;
    }

    @RequestMapping("/deleteGoods")
    public void delete(@RequestParam("fid") Integer fid){
        goodsService.deleteByFid(fid);
    }

    @RequestMapping("/editGoods")
    public String edit(@ModelAttribute Food  food){
        System.out.println("1111111111111111111111111111111111111111111");
        goodsService.edit(food);
        return "/admin/admin_goods";
    }

    @RequestMapping("/addGoods")
    public String addGoods(@ModelAttribute Food food){
        goodsService.addGoods(food);
        return "/admin/admin_goods";
    }
}
