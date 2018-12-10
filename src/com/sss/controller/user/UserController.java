package com.sss.controller.user;

import com.alibaba.fastjson.JSONArray;
import com.sss.bean.*;
import com.sss.service.user.UserService;
import com.sss.util.DownloadUtils;
import com.sss.util.POIUtil;
import com.sss.util.QRCodeUtils;
import com.sss.util.XderhuoUtil;
import com.sss.vo.MyMessageVo;
import com.sss.vo.OnlineUserVo;
import com.sss.vo.QAVo;
import com.sss.vo.QCVo;
import org.apache.commons.io.FileUtils;
import com.sss.vo.*;
import io.rong.util.CommonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 关于User的MVC操作类
 *
 * @author 赵飞
 * 2018年6月6日 22:53:24
 * 接受任何/user的请求
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 登录
     *
     * @return 用于进行登录操作的类。接受/user/login路径
     * 返回值登录成功跳转回首页
     * 登录失败跳转回登录页面
     * 将user存进了session中
     * @author 赵飞
     */
    @RequestMapping("/login")
    public String login(User user, HttpServletRequest request, Model model, HttpServletResponse response) {
        User loginuser = userService.login(user);
        if (loginuser == null) {
            //登录失败
            model.addAttribute("msg", "用户名密码错误");
            return "/user/login";
        } else {
            //登录成功
            //存储作用域session
            request.getSession().setAttribute("user", loginuser);
            UserQRCode userQRCode = userService.selectByqrDataUid(loginuser.getUid());
            request.getSession().setAttribute("userQRCode", userQRCode);
            request.getSession().setMaxInactiveInterval(60 * 60 * 24 * 2);
            //记住我
            String remberme = request.getParameter("remberme");
            if (remberme != null) {
                Cookie cookie = new Cookie("user", loginuser.getUsername() + "@" + loginuser.getPassword());
                cookie.setPath("/");
                cookie.setMaxAge(60 * 60 * 12 * 7);
                response.addCookie(cookie);
            } else {
                Cookie cookie = new Cookie("user", "");
                cookie.setPath("/");
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
            return "/user/loading";
        }
    }


    /**
     * @author 赵飞
     * <p>
     * 接受/user/layout用于登出操作，返回到首页，将session中去处user
     */
    @RequestMapping("/layout")
    public String layout(HttpServletRequest request) {
        request.getSession().removeAttribute("user");
        return "/user/loading";
    }

    /**
     * @Author:ZhangPeng
     * @Description:从首页各个地方跳到自己的主页
     */
    @RequestMapping("/myhome")
    public String zhuye(@RequestParam("uid") Integer uid, Model model) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        // 获得当前系统时间
        Date date = new Date();
        long timeLong = date.getTime();

        User user = userService.findById(uid);
        List<Question> question = userService.findQuestion(uid);
        List<QCVo> qcVos = new ArrayList<QCVo>();
        for (Question q : question) {
            Date qtime = q.getQtime();
            long qtimeLong = qtime.getTime();
            // 与当前时间比较
            long time = timeLong - qtimeLong;
            if (time <= 1000 * 60 * 60 * 24) {
                q.setQtimeStr("今天");
            } else if (time <= 1000 * 60 * 60 * 24 * 2) {
                q.setQtimeStr("1天前");
            } else if (time <= 1000 * 60 * 60 * 24 * 3) {
                q.setQtimeStr("2天前");
            } else {
                q.setQtimeStr(dateFormat.format(q.getQtime()));
            }
            QCVo qcVo = new QCVo();

            qcVo.setCount(userService.findQuestionNum(q.getQid()));
            qcVo.setQuestion(q);
            qcVos.add(qcVo);
        }


        List<Answer> answers = userService.findAnswer(uid);
        List<QAVo> qaVos = new ArrayList<QAVo>();
        for (Answer a : answers) {
            QAVo qaVo = new QAVo();
            qaVo.setAnswer(a);
            Question q = userService.findQuestionByQid(a.getQid());
            Date qtime = q.getQtime();
            long qtimeLong = qtime.getTime();
            // 与当前时间比较
            long time = timeLong - qtimeLong;
            if (time <= 1000 * 60 * 60 * 24) {
                q.setQtimeStr("今天");
            } else if (time <= 1000 * 60 * 60 * 24 * 2) {
                q.setQtimeStr("1天前");
            } else if (time <= 1000 * 60 * 60 * 24 * 3) {
                q.setQtimeStr("2天前");
            } else {
                q.setQtimeStr(dateFormat.format(q.getQtime()));
            }
            qaVo.setQuestion(q);
            qaVos.add(qaVo);
        }
        model.addAttribute("user", user);
        model.addAttribute("qcVos", qcVos);
        model.addAttribute("qaVos", qaVos);
        return "/user/home";
    }

    /**
     * @Author:ZhangPeng
     * @Description:拉取好友列表信息
     */
    @RequestMapping("/getJson")
    public @ResponseBody
    JsonList getList(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            return null;
        }

        OnlineUserVo me = new OnlineUserVo(user.getName(), user.getUid(), user.getImageurl(), user.getSignature(), 0);

        List<OnlineUserVo> friendList = userService.findFriendByUid(user.getUid());

        List<OnlineUserVo> friendList0 = new ArrayList<OnlineUserVo>();//我的好友
        List<OnlineUserVo> friendList1 = new ArrayList<OnlineUserVo>();//技术大牛
        List<OnlineUserVo> friendList2 = new ArrayList<OnlineUserVo>();//进阶程序员
        List<OnlineUserVo> friendList3 = new ArrayList<OnlineUserVo>();//菜鸟小分队
        List<OnlineUserVo> friendList4 = new ArrayList<OnlineUserVo>();//未命名分组

        for (OnlineUserVo OnLineuser : friendList) {
            if (OnLineuser.getGroupId() == 0) {
                friendList0.add(OnLineuser);
            } else if (OnLineuser.getGroupId() == 1) {
                friendList1.add(OnLineuser);
            } else if (OnLineuser.getGroupId() == 2) {
                friendList2.add(OnLineuser);
            } else if (OnLineuser.getGroupId() == 3) {
                friendList3.add(OnLineuser);
            } else {
                friendList4.add(OnLineuser);
            }
        }

        Friends friends0 = new Friends("我的好友", 0, friendList0);
        Friends friends1 = new Friends("技术大牛", 1, friendList1);
        Friends friends2 = new Friends("进阶程序员", 2, friendList2);
        Friends friends3 = new Friends("菜鸟小分队", 3, friendList3);
        Friends friends4 = new Friends("未命名分组", 4, friendList4);

        Data data = new Data();
        data.setMine(me);
        data.getFriend().add(friends0);
        data.getFriend().add(friends1);
        data.getFriend().add(friends2);
        data.getFriend().add(friends3);
        data.getFriend().add(friends4);

        JsonList jsonList = new JsonList();
        jsonList.setData(data);
        return jsonList;
    }

    /**
     * @author 赵飞
     * <p>
     * 接受/user/set用于跳转进设置页面，返回到设置页面，无作用域操作
     */
    @RequestMapping("/set")
    public String setting(HttpServletRequest request, Model model) {
        return "/user/set";
    }

    /**
     * @author 赵飞
     * <p>
     * 接受/user/setzl用于设置个人信息，返回到设置页面，无作用域操作
     */
    @RequestMapping("/setzl")
    public String settingzl(User user, HttpServletRequest request) {
        User loginuser = (User) request.getSession().getAttribute("user");

        if (loginuser != null) {
            loginuser.setName(user.getName());
            loginuser.setSignature(user.getSignature());
            userService.updateUser(loginuser);
        }
        return "redirect:/user/set";
    }

    /**
     * @author 赵飞
     * <p>
     * 接受/user/setingpass用于更改密码，如果密码错误返回到修改页面，密码正确修改密码并自动登出，无作用域操作
     */
    @RequestMapping("/setingpass")
    public String setingpass(@RequestParam("password") String password,
                             @RequestParam("oldpassword") String oldpassword,
                             HttpServletRequest request,
                             Model model) {
        User loginuser = (User) request.getSession().getAttribute("user");
        if (loginuser.getPassword().equals(oldpassword)) {
            //两次密码一致
            loginuser.setPassword(password);
            userService.updateUser(loginuser);
            return "redirect:/user/layout";
        } else {
            //两次密码不一致，返回刚刚的页面并且回显错误信息
            model.addAttribute("msg", "当前密码错误");
            return "/user/set";
        }
    }

    /**
     * @author 赵飞
     * <p>
     * 接受/user/allQuestions用于ajax查询所有问题，无跳转，无作用域操作
     */
    @RequestMapping("/allQuestions")
    public @ResponseBody
    String findAllMyQuestions(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        Integer uid = user.getUid();
        List<Question> questions = userService.findAllQuestion(uid);
        List<QCVo> qcVos = new ArrayList<>();

        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        // 获得当前系统时间
        Date date = new Date();
        long timeLong = date.getTime();
        // 遍历每个问题，处理qtime，获得qtimeStr
        for (Question q : questions) {
            QCVo qcVo = new QCVo();

            Date qtime = q.getQtime();
            long qtimeLong = qtime.getTime();
            // 与当前时间比较
            long time = timeLong - qtimeLong;
            if (time <= 1000 * 60 * 60 * 24) {
                q.setQtimeStr("今天");
            } else if (time <= 1000 * 60 * 60 * 24 * 2) {
                q.setQtimeStr("1天前");
            } else if (time <= 1000 * 60 * 60 * 24 * 3) {
                q.setQtimeStr("2天前");
            } else {
                q.setQtimeStr(dateFormat.format(q.getQtime()));
            }
            Integer num = userService.findQuestionNum(q.getQid());

            qcVo.setQuestion(q);
            qcVo.setCount(num);
            qcVos.add(qcVo);
        }
        String s = JSONArray.toJSONString(qcVos);
        return s;
    }


    /**
     * @Author WangShuang
     * @Description 用户的用户中心 —— 我发的贴
     * 通过登录用户id 查询用户发出的帖子问题 ，进行分页展示
     * 通过封装的对象 UserCenterVo进行数据传输
     */
    @RequestMapping("/WangShuang")
    public String myQuestions() {
       /* User user = (User) request.getSession().getAttribute("user");
        Integer uid = user.getUid();
        PageInfo<Question> pageInfo = userService.findQuestionsByUid(uid);

        List<UserCenterVo> list = new ArrayList<>();

        for (Question question : pageInfo.getList()) {
            int answerNum = userService.findQuestionNum(question.getQid());
            UserCenterVo userCenterVo = new UserCenterVo();
            userCenterVo.setQuestion(question);
            userCenterVo.setAnswerNum(answerNum);
            list.add(userCenterVo);
        }
        model.addAttribute("user", user);
        model.addAttribute("list", list);
        System.out.println(list);*/
        return "/user/index";
    }

    /**
     * @Author WangShuang
     * @Description 通过quid 查询到 List<Message> 遍历根据 qid查询Question ,根据auid查询user
     */
    @RequestMapping("/MyMessage")
    public String MyMessages(HttpServletRequest request, Model model) {
        User user = (User) request.getSession().getAttribute("user");
        Integer uid = user.getUid();
        List<MyMessageVo> list = new ArrayList<>();
        List<Message> messageList = userService.findMessageByQuid(uid);
        for (Message message : messageList) {
            MyMessageVo myMessageVo = new MyMessageVo();
            Integer qid = message.getQid();
            Question question = userService.findQuestionByQid(qid);
            String qs = question.getQs();
            Integer auid = message.getAuid();
            System.out.println(auid);
            User u = userService.findById(auid);
            String username = u.getUsername();

            myMessageVo.setQname(qs);
            myMessageVo.setUsername(username);
            list.add(myMessageVo);
        }
        model.addAttribute("list", list);
        return "/user/message";
    }

    /**
     * @author 赵飞
     * <p>
     * 接受/user/insert用于创建新的用户，如果填充为空的信息，返回到添加页面，无作用域操作
     */
    @RequestMapping("insert")
    public String insert(User user, HttpServletRequest request) throws IOException {
        if (user.getPassword().trim().length() == 0) {
            user.setPassword("123456");
        }
        if (user.getName().trim().length() == 0) {
            user.setName("新用户");
        }
        if (user.getSignature().trim().length() == 0) {
            user.setSignature("该用户无话可说");
        }
        user.setImageurl("/images/userImage/default.png");
        userService.insertUser(user);

        //二维码start
        //用户数据
        String qrData = user.getUsername() + "@" + user.getPassword();
        //路径，需要写两个目录，out&web
        String path = request.getServletContext().getRealPath("/");//获取项目动态绝对路径
        //1.写入out(start)
        // 生成uuid并设置为图片名
        String uuid = UUID.randomUUID().toString();
        uuid = uuid.replace("-", "");
        String out = "/images/QRCode/" + uuid + ".png";
        //创建二维码
        QRCodeUtils.createQRCode(qrData, new File(path, out));
        //写入out(end)
        //2.写入web(start)
        path = path.substring(0, path.lastIndexOf("out")).replace("\\", "/");
        String web = "web/images/QRCode/" + uuid + ".png";
        QRCodeUtils.createQRCode(qrData, new File(path, web));
        //写入web(end)
        //二维码end
        //绑定二维码和用户
        UserQRCode userQRCode = new UserQRCode();
        Integer uid = userService.selectByqrData(qrData).getUid();
        userQRCode.setUid(uid);
        userQRCode.setCodeurl("/images/QRCode/" + uuid + ".png");
        userService.insertUserQRCode(userQRCode);
        return "redirect:/admin/admin_student_add.jsp";
    }

    /**
     * 用于更新头像
     *
     * @param picfile
     * @param request
     * @return
     * @author 赵飞
     */
    @RequestMapping("/uimgUpdate")
    public @ResponseBody
    String uimgUpdate(@RequestParam("file") MultipartFile picfile, HttpServletRequest request) {
        String contextPath = request.getSession().getServletContext().getRealPath("/images/userImage");
        System.out.println(contextPath);
        User user = (User) request.getSession().getAttribute("user");
        //获取文件名
        String originalFilename = picfile.getOriginalFilename();
        String[] split = originalFilename.split("\\.");
        //后缀
        String hz = "." + split[split.length - 1];
        String s = contextPath + "\\" + user.getUid() + hz;

        File file = new File(s);
        System.out.println(file.getAbsolutePath());
        file.delete();
        try {
            picfile.transferTo(file);
        } catch (IOException e) {
            return null;
        }
        user.setImageurl("/images/userImage/" + user.getUid() + hz);
        userService.updateUser(user);
        return "{\"msg\":\"ok\"}";
    }

    /**
     * @return
     * @author 赵飞
     * 用来读取xlsx表格来输入到PoiUtil
     */
    @RequestMapping("/xlsxInsert")
    public @ResponseBody
    String xlsxInsert(@RequestParam("file") MultipartFile file, HttpServletRequest request) throws Exception {
        //开始存入
        String contextPath = request.getSession().getServletContext().getRealPath("/images/");
        String originalFilename = file.getOriginalFilename();
        String s = contextPath + originalFilename;
        System.out.println("路径————》" + s);
        File f = new File(s);
        file.transferTo(f);
        //存入结束
        //调用工具类
        List<User> users = poiUtil(s);
        f.delete();
        return "{\"msg\":\"ok\"}";
    }

    private List<User> poiUtil(String file) throws Exception {
        Map<String, String> maps = new HashMap<>();
        maps.put("用户名", "username");
        maps.put("密码", "password");
        maps.put("昵称", "name");
        maps.put("简介", "signature");
        maps.put("头像地址", "imageurl");
        maps.put("权限", "permission");
        List<User> users = POIUtil.toBean(User.class, maps, file);
        for (User user : users) {
            if (user.getPassword() == null || user.getPassword().trim().length() == 0) {
                user.setPassword("123456");
            }
            if (user.getPassword() == null || user.getName().trim().length() == 0) {
                user.setName("新用户");
            }
            if (user.getPassword() == null || user.getSignature().trim().length() == 0) {
                user.setSignature("该用户无话可说");
            }
            user.setImageurl("/images/userImage/default.png");
            userService.insertUser(user);
        }
        return users;
    }

    /**
     * @Author 张永琦
     * 接受首页按钮“控制台”的请求,获取数据用户照片和用户名跳到admin/admin.jsp
     * 点击学生管理分页展示学生信息
     */
    @RequestMapping("/showStudent")
    public @ResponseBody
    Student showStudent() {
        List<User> userList = userService.showAllStudent();
        Student stu = new Student();
        stu.setCode("");
        stu.setMsg("");
        stu.setCount(userList.size());
        stu.setData(userList);

        System.out.println(stu);
        return stu;
    }

    /**
     * @Author 张永琦
     * 学生管理分页展示,删除学生信息
     */
    @RequestMapping("/delete")
    public String delete(Integer uid) {
        userService.delete(uid);
        return "redirect:/admin/admin_student.jsp";
    }

    /**
     * @Author 张永琦
     * 学生管理分页展示,详情信息获取数据
     */
    @RequestMapping("/check")
    public String check() {

        // System.out.println(user);
        //User user = userService.check();

        return "redirect:/admin/admin_student.jsp";
    }

    /**
     * @Author:ZhangPeng
     * @Description:添加好友消息发出操作
     */
    @RequestMapping("/addFriend")
    public @ResponseBody
    String addFriend(AddFriendVo addFriendVo, HttpServletRequest httpServletRequest) {
        User user = (User) httpServletRequest.getSession().getAttribute("user");
        addFriendVo.setSendUid(user.getUid());

        List<OnlineUserVo> onlineUserVos = userService.findFriendByUid(user.getUid());
        for (OnlineUserVo o :onlineUserVos) {
            if(o.getId()==addFriendVo.getUid()){
                return "1";
            }
        }

        List<AddFriendVo> addFriendVos = userService.selectAllMsg();
        for (AddFriendVo a : addFriendVos) {
            if (a.getSendUid() == addFriendVo.getSendUid() && a.getUid() == addFriendVo.getUid()) {
                return "true";
            }
        }

        userService.addFriendMessage(addFriendVo);
        return "false";
    }

    /**
     * @Author:ZhangPeng
     * @Description:查询好友验证信息
     */
    @RequestMapping("/findAddmsg")
    public @ResponseBody
    List<FriendVo> findAddmsg(@RequestBody AddFriendVo addFriendVo) {
        List<AddFriendVo> addFriendVos = userService.findAddMsgByUid(addFriendVo.getUid());
        List<FriendVo> friendVos = new ArrayList<FriendVo>();
        for (AddFriendVo addFriendVos1 : addFriendVos) {
            FriendVo friendVo = new FriendVo();
            friendVo.setAddFriendVo(addFriendVos1);
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            friendVo.setTime(dateFormat.format(addFriendVos1.getStime()));
            friendVos.add(friendVo);
        }
        return friendVos;
    }

    /**
     * @author: 朱元浩
     * @date: 2018/7/2 16:09
     * @Param: [request, response]
     * @return: void
     * @Description: 二维码下载
     */
    @RequestMapping("/download")
    @ResponseBody
    public void downLoad(HttpServletRequest request, HttpServletResponse response, String codeurl) throws Exception {
        String download = request.getSession().getServletContext().getRealPath(codeurl); //获取下载路劲
        DownloadUtils.downLoadFile("", "png", download, response);//依次传入需要下载的文件名，文件格式，路径，response参数
    }

    /**
     * @author: 朱元浩
     * @date: 2018/7/2 17:01
     * @Param: [request, model, response]
     * @return: java.lang.String
     * @Description: 二维码登录
     */
    @RequestMapping("/qrCodeLogin")
    public String qrCodeLogin(HttpServletRequest request, Model model, HttpServletResponse response,
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
            FileUtils.writeByteArrayToFile(newFile, bytes, false);
            //解析二维码

            String result = null;
            try {
                result = QRCodeUtils.readQRCode(newFile);
            } catch (Exception e) {
                //二维码图片错误
                model.addAttribute("msg", "二维码错误，登录失败");
                return "/user/login";
            }
            //清空临时文件
            path = path.substring(0, path.length() - 1);
            FileUtils.cleanDirectory(new File(path));
            String[] split = result.split("@");
            User user = new User();
            user.setUsername(split[0]);
            user.setPassword(split[1]);
            User loginuser = userService.login(user);
            //登录成功
            //存储作用域session
            UserQRCode userQRCode = userService.selectByqrDataUid(loginuser.getUid());
            request.getSession().setAttribute("userQRCode", userQRCode);
            request.getSession().setAttribute("user", loginuser);
            request.getSession().setMaxInactiveInterval(60 * 60 * 24 * 2);
            return "/user/loading";
        }
        model.addAttribute("msg", "二维码错误，登录失败");
        return "/user/login";
    }

    /**
     * @Author:ZhangPeng
     * @Description:查询系统信息
     */
    @RequestMapping("/findSysmsg")
    public @ResponseBody
    List<SystemMsgVo> findSysmsg(@RequestBody AddFriendVo addFriendVo) {
        List<SystemMsg> allSystemmsg = userService.findAllSystemmsg(addFriendVo.getUid());
        List<SystemMsgVo> systemMsgVos = new ArrayList<SystemMsgVo>();
        for (SystemMsg s : allSystemmsg) {
            SystemMsgVo systemMsgVo = new SystemMsgVo();
            systemMsgVo.setSystemMsg(s);
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            systemMsgVo.setTime(dateFormat.format(s.getStime()));
            systemMsgVos.add(systemMsgVo);
        }
        return systemMsgVos;
    }

    /**
     * @Author:ZhangPeng
     * @Description:好友验证成功
     */
    @RequestMapping("/addFriendSuccess")
    public @ResponseBody
    String addFriendSuccess(@RequestBody AddFriendVo addFriendVo) {
        AddFriendVo addMessage = userService.selectMsgByAfid(addFriendVo.getAfid());
        userService.addNewFriend(new Friendship(addMessage.getSendUid(), addMessage.getUid(), addMessage.getGroupId()));
        userService.addNewFriend(new Friendship(addMessage.getUid(), addMessage.getSendUid(), addFriendVo.getGroupId()));
        userService.deleteAddMsg(addMessage.getAfid());
        userService.addNewSystemMsg(addFriendVo.getUid(), addMessage.getUid(), new Date());
        return "";
    }

    /**
     * @Author:ZhangPeng
     * @Description:好友验证失败
     */
    @RequestMapping("/addFriendFail")
    public @ResponseBody
    String addFriendFail(@RequestBody AddFriendVo addFriendVo) {
        AddFriendVo addMessage = userService.selectMsgByAfid(addFriendVo.getAfid());
        userService.deleteAddMsg(addFriendVo.getAfid());
        userService.addNewSystemMsgFail(addFriendVo.getUid(), addMessage.getUid(), new Date());
        return "";
    }

    /**
     * @Author:ZhangPeng
     * @Description:客服
     */
    @RequestMapping("/kefu")
    public @ResponseBody
    KefuVo kefu(@RequestBody KefuVo kefuVo) {
        XderhuoUtil xderhuoUtil = new XderhuoUtil();
        String message = xderhuoUtil.getMessage(kefuVo.getContent());
        System.out.println(message);
        KefuVo kefuVo1 = new KefuVo();
        kefuVo1.setRecent(message);
        return kefuVo1;
    }
}