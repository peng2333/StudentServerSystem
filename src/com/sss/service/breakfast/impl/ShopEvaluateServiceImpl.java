package com.sss.service.breakfast.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sss.bean.ShopEvaluate;
import com.sss.mapper.breakfast.ShopEvaluateMapper;
import com.sss.service.breakfast.ShopEvaluateService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author 李金发666
 * @date 2018/6/20 23:27
 */
@Service
@Transactional
public class ShopEvaluateServiceImpl implements ShopEvaluateService {

	@Resource
	private ShopEvaluateMapper shopEvaluateMapper;

	@Override
	public PageInfo<ShopEvaluate> findAllBySid(String sid, Integer page) {
		PageHelper.startPage(page,10);

		Example example = new Example(ShopEvaluate.class);
		Example.Criteria criteria = example.createCriteria();
		criteria.andEqualTo("shopId",sid);

		return new PageInfo<>(shopEvaluateMapper.selectByExample(example));
	}

	@Override
	public List<Integer> findEvaluateList(Integer sid) {
		List<Integer> integers = new ArrayList<>();
		for (int i = 1; i < 6; i++) {
			integers.add(shopEvaluateMapper.findEvaluateList(sid,i));
		}
		return integers;
	}
}
