package com.sss.bean;

import javax.persistence.Column;
import javax.persistence.Table;
import java.util.Date;

@Table(name = "Qrcode")
public class QRcode {


    private String qrname;
    private Date qctime;
    @Column(name = "order_number")
    private String  ordersNumber;
    public void setQrname(String qrname) {
        this.qrname = qrname;
    }

    public void setQctime(Date qctime) {
        this.qctime = qctime;
    }

    public void setOrdersNumber(String ordersNumber) {
        this.ordersNumber = ordersNumber;
    }

    public String getQrname() {

        return qrname;
    }

    public Date getQctime() {
        return qctime;
    }

    public String getOrdersNumber() {
        return ordersNumber;
    }


}
