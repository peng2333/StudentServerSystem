package com.sss.service.breakfast.impl;

import com.sss.bean.FoodBuyRecord;
import com.sss.bean.FoodOrders;
import com.sss.bean.FoodOrdersVo2;
import com.sss.mapper.breakfast.FoodOrderMapper;
import com.sss.mapper.breakfast.FoodOrdersVo2Mapper;
import com.sss.mapper.breakfast.FoodBuyRecordMapper;
import com.sss.service.breakfast.FoodOrderService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @author 李金发666
 * @date 2018/6/8 20:26
 */
@Service
@Transactional
public class FoodOrderServiceImpl implements FoodOrderService {

	@Resource
	private FoodOrderMapper foodOrderMapper;
	@Resource
	private FoodOrdersVo2Mapper FoodOrdersVo2Mapper;
	@Resource
	private FoodBuyRecordMapper foodBuyRecordMapper;


	@Override
	public void addFoodOrder(FoodOrders foodOrders, Integer uid) {
		// 生成uuid并设置为订单编号
		String uuid = UUID.randomUUID().toString();
		uuid = uuid.replace("-", "");
		foodOrders.setOrdersNumber(uuid);
		// 设置订单总价
		Double sum = 0.0;
		for (FoodOrdersVo2 vo2 : foodOrders.getFoodVoList()) {
			sum += vo2.getPriceSum();
			FoodOrdersVo2Mapper.insertOrdersVo(vo2, uuid);
			// 设置对应用户的食物购买数量
			Integer i = foodBuyRecordMapper.updateBuyCount(vo2.getFood().getFid(), uid, vo2.getFoodNumber());
			if (i == 0) {
				foodBuyRecordMapper.insert(new FoodBuyRecord(vo2.getFood().getFid(), uid, vo2.getFoodNumber()));
			}
		}
		foodOrders.setOrdersPrice(sum);
		// 设置订单创建时间
		Date d = new Date();
		SimpleDateFormat format0 = new SimpleDateFormat("yyyy-MM-dd");
		String time = format0.format(d.getTime());
		foodOrders.setCreateTime(time);
		// 设置订单状态,当前默认为 1(订单已经完成)
		foodOrders.setOrdersState(1);

		foodOrderMapper.insert(foodOrders);
	}

	/**
	 * 查询所有订单,并返回一个包含订单总价和 对应订单食物购买总数的二维小数数组
	 * 李金发
	 *
	 * @return
	 */
	@Override
	public double[][] findAllFoodOrder() {
		List<FoodOrders> foodOrdersList = foodOrderMapper.selectAllFoodOrder();

		double[][] points = new double[foodOrdersList.size()][2];
		for (int i = 0; i < foodOrdersList.size(); i++) {
			points[i][0] = foodOrdersList.get(i).getOrdersPrice();
			points[i][1] = foodOrdersList.get(i).getFoodVoList().size();
		}

		return points;
	}


}
