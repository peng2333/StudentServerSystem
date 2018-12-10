package com.sss.service.order.impl;


import com.sss.bean.Shop;
import com.sss.mapper.order.SellerMapper;
import com.sss.service.order.SellerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SellerServiceImpl implements SellerService{

    @Resource
    private SellerMapper sellerMapper;

    @Override
    public List<Shop> findAll(Integer page, Integer limit) {

        return sellerMapper.selectSellerAll();
    }

    @Override
    public void delete(Integer sid) {
        sellerMapper.deleteBySid(sid);
    }

    @Override
    public void edit(Shop shop) {
        sellerMapper.edit(shop);
    }

    @Override
    public void addSeller(Shop shop) {
        sellerMapper.addSeller(shop);
    }
}
