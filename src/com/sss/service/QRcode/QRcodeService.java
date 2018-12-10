package com.sss.service.QRcode;

import com.sss.bean.FoodFoodOrder;
import com.sss.bean.QRcode;

import java.util.List;

public interface QRcodeService {
    void add(QRcode qRcode);

    String findByOrdersNum(String ordersNumber);
}
