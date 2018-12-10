package com.sss.mapper.QRcode;

import com.sss.bean.QRcode;
import org.apache.ibatis.annotations.Insert;
import tk.mybatis.mapper.common.Mapper;

public interface QRcodeMapper extends Mapper<QRcode> {
    @Insert("INSERT INTO Qrcode (qrname, qctime, order_number) VALUES (#{qrname}, #{qctime}, #{ordersNumber}) ")
    public void add(QRcode qRcode);
}
