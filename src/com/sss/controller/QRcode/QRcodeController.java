package com.sss.controller.QRcode;

import com.sss.bean.*;
import com.sss.service.QRcode.QRcodeService;
import com.sss.service.breakfast.TodayOrderService;
import com.sss.util.MyQRCodeImage;
import com.sss.util.QRCodeUtils;
import jp.sourceforge.qrcode.QRCodeDecoder;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.swetake.util.Qrcode;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping
public class QRcodeController {

    @Resource
    private QRcodeService qRcodeService;

    @Resource
    private TodayOrderService todayOrderService;

    /**
     * @author:蔺思卓
     * 实现订单完成后创建二维码
     * @return
     */
    @RequestMapping("createQRcode")
    public String create(QRcode qRcode, HttpServletRequest request, Model model) throws IOException {

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
        String qrData = qRcode.getOrdersNumber();//内容信息

        byte[] d = qrData.getBytes("utf-8");//汉字转格式需要抛出异常
        System.out.println(d.length);
        //缓冲区
        BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);

        //绘图
        Graphics2D gs = bufferedImage.createGraphics();

        gs.setBackground(Color.WHITE);
        gs.setColor(Color.BLACK);
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
        if (d.length > 0 && d.length < 120) {
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
        Date date = new Date();
        long time = date.getTime();
        File directory = new File("");
        String string = request.getServletContext().getRealPath("");//获取项目动态绝对路径
        System.out.println(string);
        qRcode.setQrname(""+time);
        qRcode.setQctime(date);
        System.out.println(qRcode);
        qRcodeService.add(qRcode);
        ImageIO.write(bufferedImage, "png", new File(string+"/breakfast/images/"+time+".png"));
        model.addAttribute("imgName",time+".png");
        return "/breakfast/order_succeed";

    }


    @RequestMapping("QRcodeCheck")
    public String check(HttpServletRequest request, Model model, HttpServletResponse response,
                        @RequestParam("file") MultipartFile file) throws IOException {
        if (!file.isEmpty()) {
            //1. 读取文件保存到某个文件夹
            //文件名
            String fileName = file.getOriginalFilename();
            //获取文件的项目的根路径
            String path = request.getSession().getServletContext().getRealPath("");
            path = path.substring(0, path.lastIndexOf("out")).replace("\\", "/");
            path += "web/user/upload/";
            //拼接成完整的指定的文件路径名，创建新文件
            String filePath = path + fileName;
            //新的文件
            File newFile = new File(filePath);
            // 这里就把获得的byte字节文件数据做操作
            byte[] bytes = file.getBytes();
            FileUtils.writeByteArrayToFile(newFile , bytes , false);
            //解析二维码

            String result = null;
            try {
                File file1 = new File(filePath);
                //读取图片到缓冲区
                BufferedImage bufferedImage = ImageIO.read(file1);
                //QRCode解码器
                QRCodeDecoder codeDecoder = new QRCodeDecoder();
                /**
                 *codeDecoder.decode(new MyQRCodeImage())
                 *这里需要实现QRCodeImage接口，移步最后一段代码
                 */
                //通过解析二维码获得信息
                result =  new String(codeDecoder.decode(new MyQRCodeImage(bufferedImage)), "utf-8");

            } catch (Exception e) {
                //二维码图片错误
                model.addAttribute("msg", "二维码无效");
                return "/admin/admin_check";
            }
            //清空临时文件
            path = path.substring(0,path.length()-1);
            FileUtils.cleanDirectory(new File(path));

            List<FoodFoodOrder> ffo = todayOrderService.findByOrdersNum(result);
            List<FoodOrdersVo2> foods = new ArrayList<>();
            for (FoodFoodOrder f : ffo) {
                FoodOrdersVo2 vo = new FoodOrdersVo2();
                Food byFid = todayOrderService.findByFid(f.getFid());
                vo.setFood(byFid);
                vo.setFoodNumber(f.getFoodNumber());
                vo.setPriceSum(f.getPriceSum());
                foods.add(vo);
            }
            model.addAttribute("list",foods);
            System.err.println(foods.size());
            return "/admin/admin_check";
        }
        model.addAttribute("msg", "二维码错误");
        return "/admin/admin_check";
    }
}
