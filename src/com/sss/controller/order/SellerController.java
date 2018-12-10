package com.sss.controller.order;

import com.sss.bean.Seller;
import com.sss.bean.Shop;
import com.sss.service.order.SellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/seller")
public class SellerController {

    @Autowired
    private SellerService sellerService;

    @RequestMapping("/findAllSeller")
    public @ResponseBody Seller findAll(@RequestParam("page")Integer page, @RequestParam("limit")Integer limit){

        List<Shop> data = sellerService.findAll(page,limit);
        Seller seller = new Seller();
        seller.setCode(0);
        seller.setMsg("");
        seller.setCount(data.size());
        seller.setData(data);
        return seller;
    }

    @RequestMapping("/deleteSeller")
    public void delete(@RequestParam("sid")Integer sid){
        sellerService.delete(sid);
    }

    @RequestMapping("/editSeller")
    public String editSeller(@ModelAttribute Shop shop){
        sellerService.edit(shop);
        return "/admin/admin_seller";
    }

    @RequestMapping("/addSeller")
    public String addSeller(@ModelAttribute Shop shop){
        sellerService.addSeller(shop);
        return "/admin/admin_seller";
    }
}
