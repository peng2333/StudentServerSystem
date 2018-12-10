package com.sss.service.order;

import com.sss.bean.Shop;

import java.util.List;

public interface SellerService {
    public List<Shop> findAll(Integer page, Integer limit);

    public void delete(Integer sid);

    public void edit(Shop shop);

    public void addSeller(Shop shop);
}
