package com.sss.controller.cases;

import com.sss.util.XderhuoUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 用于处理和雪酱相关的信息
 * @author XDerhuo
 */
@Controller
@RequestMapping("/xj")
public class CaseXueJiangController {
    /**
     * 接受一个字符串参数，返回一个json字符串
     * @author XDerhuo
     */
    private XderhuoUtil xderhuoUtil = new XderhuoUtil();
    @RequestMapping("/question")
    public @ResponseBody String xjanswer(@RequestParam("question")String question){
        String message = xderhuoUtil.getMessage(question);
        return message;
    }
}
