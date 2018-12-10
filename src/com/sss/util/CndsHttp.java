package com.sss.util;

import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.entity.ContentType;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CndsHttp {

    private static final Map<String,String> oneMap = new HashMap<>();
    // 使用HttpClient获取博客
    public void repitle(String url) throws ClientProtocolException, IOException {
       // String targetUrl = "https://blog.csdn.net/Luck_YYF/article/details/76619257";

        // 1.建立HttpClient对象
        CloseableHttpClient client = HttpClients.createDefault();

        // 2.建立Get请求
        HttpGet get = new HttpGet(url);

        // 3.发送Get请求
        CloseableHttpResponse res = client.execute(get);

        // 4.处理请求结果
        if (res.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
            HttpEntity entity = res.getEntity();
            ContentType contentType = ContentType.getOrDefault(entity);
            Charset charset = contentType.getCharset();
            String mimeType = contentType.getMimeType();
            // 获取字节数组
            byte[] content = EntityUtils.toByteArray(entity);
            if (charset == null) {
                // 默认编码转成字符串
                String temp = new String(content);
                String regEx = "(?=<meta).*?(?<=charset=[\\'|\\\"]?)([[a-z]|[A-Z]|[0-9]|-]*)";
                Pattern p = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
                Matcher m = p.matcher(temp);
                if (m.find() && m.groupCount() == 1) {
                    charset = Charset.forName(m.group(1));
                } else {
                    charset = Charset.forName("ISO-8859-1");
                }
            }
            //  System.out.println(new String(content, charset));
            String s = new String(content, charset);
            //System.out.println(s);

            Document doc = Jsoup.parse(s);//html为内容
            Element e_main = doc.getElementsByTag("main").get(0);//根据标签名找title元素

            /*     String title = e_dd.text();//获取标签的文字*/
            String main = e_main.toString();
            oneMap.put(url,main);
            System.out.println(e_main);

        }
    }

    public Map<String,String> getOneMap(){
        return oneMap;
    }
}
