package com.sss.util;

import com.swetake.util.Qrcode;
import jp.sourceforge.qrcode.QRCodeDecoder;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

/**
 * @program: StudentServerSystem
 * @author: 朱元浩
 * @create: 2018-06-28 16:17
 * 生成二维码和解析二维码
 **/
public class QRCodeUtils {

    /**
     * @author: 朱元浩
     * @date: 2018/6/28 16:23
     * @Param: []
     * @return: void
     * @Description: 生成二维码
     */
    public static void createQRCode(String qrData , File file) throws IOException {

        //计算二维码图片的高宽比
        // API文档规定计算图片宽高的方式 ，v是本次测试的版本号
        int v =6;
        int width = 67 + 12 * (v - 1);
        int height = 67 + 12 * (v - 1);

        Qrcode x = new Qrcode();
        /**
         * 纠错等级分为
         * level L : 最大 7% 的错误能够被纠正；
         * level M : 最大 15% 的错误能够被纠正；
         * level Q : 最大 25% 的错误能够被纠正；
         * level H : 最大 30% 的错误能够被纠正；
         */
        x.setQrcodeErrorCorrect('L');
        x.setQrcodeEncodeMode('B');//注意版本信息 N代表数字 、A代表 a-z,A-Z、B代表 其他)
        x.setQrcodeVersion(v);//版本号  1-40

        //加密字符串
        char[] c = qrData.toCharArray();
        for (int i = 0; i < c.length; i++) {
            c[i] = (char)(c[i]^20000);
        }
        qrData = new String(c);
        byte[] d = qrData.getBytes("utf-8");//汉字转格式需要抛出异常
        //缓冲区
        BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);

        //绘图
        Graphics2D gs = bufferedImage.createGraphics();

        gs.setBackground(Color.white);
        gs.setColor(Color.black);
        gs.clearRect(0, 0, width, height);

        //偏移量
        int pixoff = 2;

        /**
         * 容易踩坑的地方
         * 1.注意for循环里面的i，j的顺序，
         *   s[j][i]二维数组的j，i的顺序要与这个方法中的 gs.fillRect(j*3+pixoff,i*3+pixoff, 3, 3);
         *   顺序匹配，否则会出现解析图片是一串数字
         * 2.注意此判断if (d.length > 0 && d.length < 120)
         *   是否会引起字符串长度大于120导致生成代码不执行，二维码空白
         *   根据自己的字符串大小来设置此配置
         */
        if (d.length > 0 && d.length < 500) {
            boolean[][] s = x.calQrcode(d);

            for (int i = 0; i < s.length; i++) {
                for (int j = 0; j < s.length; j++) {
                    if (s[j][i]) {
                        gs.fillRect(j * 3 + pixoff, i * 3 + pixoff, 3, 3);
                    }
                }
            }
        }
        gs.dispose();
        bufferedImage.flush();
        //设置图片格式，与输出的路径
        ImageIO.write(bufferedImage, "png", file);

    }


    /**
     * @author: 朱元浩
     * @date: 2018/6/28 16:55
     * @Param: []
     * @return: void
     * @Description: 解析二维码
     */
    public static String readQRCode(File file) throws IOException {

        //读取图片到缓冲区
        BufferedImage bufferedImage = ImageIO.read(file);
        //QRCode解码器
        QRCodeDecoder codeDecoder = new QRCodeDecoder();
        /**
         *codeDecoder.decode(new MyQRCodeImage())
         *这里需要实现QRCodeImage接口，移步最后一段代码
         */
        //通过解析二维码获得信息
        String result = new String(codeDecoder.decode(new MyQRCodeImage(bufferedImage)), "utf-8");
        //解密字符串
        char[] c = result.toCharArray();
        for (int i = 0; i < c.length; i++) {
            c[i] = (char)(c[i]^20000);
        }
        result = new String(c);
        //解密使用完再加密字符串
        createQRCode(result , file);
        return result;
    }

}
