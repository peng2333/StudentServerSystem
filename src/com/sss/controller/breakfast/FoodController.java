package com.sss.controller.breakfast;

import com.sss.bean.FoodSort;
import com.sss.bean.Shop;
import com.sss.service.breakfast.FoodService;
import com.sss.service.breakfast.ShopEvaluateService;
import com.sss.service.breakfast.ShopService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;


/**
 * @author 李金发666
 * @date 2018/6/8 9:17
 */
@Controller
public class FoodController {

	@Resource
	private ShopService shopService;
	@Resource
	private FoodService foodService;

	/**
	 * @author: 朱元浩  
	 * @date: 2018/6/8 20:20
	 * @Param: [sid]  
	 * @return: java.lang.String 
	 */
	@RequestMapping("/findAllFoodById")
	public String findAllFoodById(@RequestParam("sid") Integer sid ,Model model){
		// 通过id查询商家
		Shop shop = shopService.selectByPrimaryKey(sid);
		model.addAttribute("shop",shop);
		// 查询所有分类和对应的食物
		List<FoodSort> foodSortList = foodService.selectBySid(sid);
		model.addAttribute("foodSortList" , foodSortList);
		return "forward:/breakfast/food_cart.jsp";
	}
	/**
	 * @author: 李金发
	 * @Param: [sid]
	 * @return: java.lang.String
	 * 传入食品分类id跳转到对应的商家
	 */
	@RequestMapping("/findShopByFoodId")
	public String findShopByFoodId(@RequestParam("sortId") Integer sid ,Model model){
		Shop shop = shopService.findShopByFoodId(sid);
		model.addAttribute("shop",shop);
		// 查询所有分类和对应的食物
		List<FoodSort> foodSortList = foodService.selectBySid(shop.getSid());
		model.addAttribute("foodSortList" , foodSortList);
		return "forward:/breakfast/food_cart.jsp";
	}


}
