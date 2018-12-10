package com.sss.controller.chart;

import com.sss.mapper.user.UserMapper;
import io.rong.RongCloud;
import io.rong.methods.user.User;
import io.rong.models.response.TokenResult;
import io.rong.models.user.UserModel;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/chart")
public class ChartController {
    private static Logger logger = Logger.getLogger(ChartController.class);
    @Resource
    UserMapper userMapper;
    @RequestMapping("/tokenUser")
    public @ResponseBody
    String tokenUser(@RequestParam("id")String id, HttpServletRequest request) throws Exception {
        String appKey = "6tnym1br643w7";
        String appSecret = "8mUrWIHIYSO6";
        RongCloud rongCloud = RongCloud.getInstance(appKey, appSecret);
        User User = rongCloud.user;
        /**
         * API 文档: http://rongcloud.github.io/server-sdk-nodejs/docs/v1/user/user.html#register
         *
         * 注册用户，生成用户在融云的唯一身份标识 Token
         */
        com.sss.bean.User u = (com.sss.bean.User) request.getSession().getAttribute("user");
        System.out.println(u.getUid());
        UserModel user = new UserModel()
                .setId(String.valueOf(u.getUid()))
                .setName(u.getName())
                .setPortrait(u.getImageurl());
        TokenResult result = User.register(user);
        System.out.println("getToken:  " + result.toString());
        return result.toString();
    }
}
