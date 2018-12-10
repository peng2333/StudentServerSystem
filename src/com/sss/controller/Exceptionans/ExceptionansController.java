package com.sss.controller.Exceptionans;

import com.sss.bean.Exceptionans;
import com.sss.util.CndsHttp;
import com.sss.util.SimpleHttpClient;
import com.sss.vo.VoException;
import com.sss.util.StackoverflowUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import us.codecraft.webmagic.Spider;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping("/exception")
public class ExceptionansController {

    @RequestMapping("/find")
    @ResponseBody
    public String savePoints(@RequestBody VoException vo,Model model) throws IOException {
        String url = vo.getName();
        String types = vo.getTypes();
        System.out.println(url);
        System.out.println(types);
        String[] split = types.split(",");
        if (split[1].equals("CSDN")){
            SimpleHttpClient simpleHttpClient = new SimpleHttpClient();
            CndsHttp cndsHttp = new CndsHttp();
            String targetUrl = "https://so.csdn.net/so/search/s.do?q="+url+"&t=blog&u=wgj85";
            simpleHttpClient.repitle(url);
            Map<String, String> listMap = simpleHttpClient.getListMap();
            if (!targetUrl.contains(url)){
                cndsHttp.repitle(url);
                Map<String, String> oneMap = cndsHttp.getOneMap();
                Set<Map.Entry<String, String>> entries = listMap.entrySet();
                Iterator<Map.Entry<String, String>> iterator = entries.iterator();
                while (iterator.hasNext()){
                    Map.Entry<String, String> next = iterator.next();
                    System.out.println(next.getValue());
                }
            }
        }



        if (split[1].equals("STACKOVERFLOW")){

            StackoverflowUtil stackoverflowUtil = new StackoverflowUtil();
            Spider.create(stackoverflowUtil).addUrl("https://stackoverflow.com/search?q="+vo.getName()).thread(5).run();
            List<Exceptionans> anslist = stackoverflowUtil.getAnslist();
            for (Exceptionans exceptionans:anslist){
                System.out.println(exceptionans.getGoods());
            }
            model.addAttribute("list",anslist);
        }

        return "/exception/abnormalCollection";
    }
    }

