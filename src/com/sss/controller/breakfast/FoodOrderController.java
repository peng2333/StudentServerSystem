package com.sss.controller.breakfast;


import com.sss.bean.*;
import com.sss.service.breakfast.FoodOrderService;
import com.sss.service.breakfast.FoodService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author 李金发666
 * @date 2018/6/8 17:57
 */
@Controller
public class FoodOrderController {
	@Resource
	private FoodOrderService foodOrderService;
	@Resource
	private FoodService foodService;
	/**
	 * 订单结算
	 *
	 * @return
	 */
	@RequestMapping("/addFoodOrder")
	public String addFoodOrder(FoodOrders foodOrders, HttpServletRequest request) {
		List<FoodOrdersVo2> vo2List = (List<FoodOrdersVo2>) request.getSession().getAttribute("Vo2List");
		User user = (User) request.getSession().getAttribute("user");
		String sid = (String) request.getSession().getAttribute("sid");
		foodOrders.setUid(user.getUid());
		foodOrders.setFoodVoList(vo2List);
		foodOrders.setSid(Integer.parseInt(sid));
		foodOrderService.addFoodOrder(foodOrders,user.getUid());
		String ordersNumber = foodOrders.getOrdersNumber();
		System.out.println(ordersNumber);
		return "redirect:/createQRcode?ordersNumber="+ordersNumber;
	}


	/**
	 * 跳转到订单结算页面并显示对应数据
	 */
	@RequestMapping("/commitOrders")
	public String commitOrders(FoodOrdersVo FoodOrdersVo, String sid, HttpServletRequest request) {
		List<FoodOrdersVo2> Vo2List = FoodOrdersVo.getFoodOrdersVo2s();
		System.out.println(1111);
		for (int i = 0; i < FoodOrdersVo.getFid().size(); i++) {
			System.out.println("id:"+FoodOrdersVo.getFid().get(i));
			System.out.println("Number:"+FoodOrdersVo.getFoodNumber().get(i));
		}
		for (int i = 0; i < FoodOrdersVo.getFid().size(); i++) {
			// 遍历查询id对应食品,并添加进list中
			Food food = foodService.selectFoodById(FoodOrdersVo.getFid().get(i));
			FoodOrdersVo2 foodOrdersVo2 = new FoodOrdersVo2();
			foodOrdersVo2.setFood(food);
			foodOrdersVo2.setFoodNumber(FoodOrdersVo.getFoodNumber().get(i));
			Vo2List.add(foodOrdersVo2);
		}
		request.getSession().setAttribute("Vo2List",Vo2List);
		request.getSession().setAttribute("sid",sid);
		return "redirect:/breakfast/submit_order.jsp";
	}

}