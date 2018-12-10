package com.sss.util;


import java.io.IOException;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.fasterxml.jackson.core.JsonParser;
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
import org.jsoup.select.Elements;
import us.codecraft.webmagic.selector.Json;

public class SimpleHttpClient {
    private static final  Map<String,String> listMap = new HashMap<>();

    // 使用HttpClient获取博客
    public  void repitle(String urll) throws ClientProtocolException, IOException {
       // String targetUrl = "https://so.csdn.net/so/search/s.do?q=nullpointerexception&t=blog&u=wgj85";

        // 1.建立HttpClient对象
        CloseableHttpClient client = HttpClients.createDefault();

        // 2.建立Get请求
        HttpGet get = new HttpGet(urll);

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
          //  System.out.println(s);

            String[] split = s.split(" </dl>");
            System.out.println(split.length+"【】【】【】【】【】【】【】");
            int i = 0;
            for (String s1 : split) {
                i++;
                if (i <= split.length-1){


               /*System.out.println("============");
                System.out.println(s1);
                System.out.println("============");*/
                Document doc = Jsoup.parse(s1);//html为内容
                Element e_dd = doc.getElementsByTag("dd").get(1);//根据标签名找title元素
                Element e_a = doc.getElementsByTag("a").get(1);
                String title = e_dd.text();//获取标签的文字

                String url = e_a.toString();
                String[] split1 = url.split("\"");
                listMap.put(title,split1[1]);
                System.out.println(title+"【】【】");
                System.out.println(split1[1]+"【】【】【】");



                }else {

                    break;
                }
            }



          Set<Map.Entry<String, String>> entries = listMap.entrySet();
            Iterator<Map.Entry<String, String>> it = entries.iterator();
            while (it.hasNext()){
                Map.Entry<String, String> next = it.next();

                System.out.println("key:=  "+next.getKey());
                System.out.println("value:  +"+next.getValue());
            }

        }

    }

    public Map<String, String> getListMap() {
        return listMap;
    }


}
