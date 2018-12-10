package com.sss.util;


import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import org.junit.Test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

/**
 * 用来和机器人——雪酱进行对话的工具类
 * @author XDerhuo
 */
public class XderhuoUtil {
    //存储APIkey
    public static final String API_KEY = "86e0994e65b946808714287009932c5f";
    //存储接口请求地址
    public static final String API_URL = "http://www.tuling123.com/openapi/api";

    /**
     * 拼接出我们的接口请求地址
     *
     * @param msg 需要发送的消息
     * @return
     */
    private  String setParameter(String msg) {
        //在接口请求中 中文要用URLEncoder encode成UTF-8
        try {
            return API_URL + "?key=" + API_KEY + "&info=" + URLEncoder.encode(msg, "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 拿到消息回复的内容的方法
     * @param json 请求接口得到的JSON
     * @return text的部分
     */
    private  String getString(String json){
        try {

            JSONObject jsonObject = JSONObject.parseObject(json);
            String text = jsonObject.getString("text");
            return text;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 提供对外公开的方法用于最终拿到机器人回复的消息
     * @param msg 传入你需要发送的信息
     * @return 机器人对你的回复
     */
    public  String getMessage(String msg){
        return getString(getHTML(setParameter(msg)));
    }


    private  String getHTML(String url) {
        StringBuffer buffer = new StringBuffer();
        BufferedReader bufferedReader = null;
        try {
            //创建URL对象
            URL u = new URL(url);
            //打开连接
            HttpURLConnection connection = (HttpURLConnection) u.openConnection();
            //从连接中拿到InputStream并由BufferedReader进行读取
            bufferedReader = new BufferedReader(new InputStreamReader(connection.getInputStream(),"UTF-8"));
            String line = "";
            //循环每次加入一行HTML内容 直到最后一行
            while ((line = bufferedReader.readLine()) != null) {
                buffer.append(line);
            }
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            try {
                //结束时候关闭释放资源
                bufferedReader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return buffer.toString();
    }

    @Test
    public void test(){
        String s = "你好";
        System.out.println(s);
        String message = getMessage(s);
        System.out.println(message);

    }
}
