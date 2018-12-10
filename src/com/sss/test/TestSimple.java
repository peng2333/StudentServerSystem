package com.sss.test;

import com.sss.util.CndsHttp;
import com.sss.util.SimpleHttpClient;
import org.junit.Test;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.util.Map;


public class TestSimple {
    @Test
    public void show() throws IOException {
        SimpleHttpClient simpleHttpClient = new SimpleHttpClient();
        CndsHttp cndsHttp = new CndsHttp();
        String targetUrl = "https://so.csdn.net/so/search/s.do?q=nullpointerexception&t=blog&u=wgj85";
        simpleHttpClient.repitle(targetUrl);
        Map<String, String> listMap = simpleHttpClient.getListMap();
        System.out.println(listMap.size());
   /* if (!targetUrl.contains(url)){
        cndsHttp.repitle(url);
        Map<String, String> oneMap = cndsHttp.getOneMap();

    }*/


    }

}
