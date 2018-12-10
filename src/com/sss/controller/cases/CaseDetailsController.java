package com.sss.controller.cases;

import com.alibaba.fastjson.JSONObject;
import com.sss.bean.Answer;
import com.sss.bean.Message;
import com.sss.bean.Question;
import com.sss.bean.User;
import com.sss.service.cases.CaseDetailsService;
import com.sss.vo.QuestionVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 对帖子详情的控制器
 * 杨晨
 */
//声明为控制器
@Controller
@RequestMapping("/details")
public class CaseDetailsController {
    /**
     * service
     */
    @Resource
    private CaseDetailsService caseDetailsService;

    /**
     * 展示页面
     * @return
     * 杨晨
     */
    @RequestMapping("/show")
    public String show(Model model, @RequestParam("qid")  Integer qid, HttpSession session){
        //根据id查询指定的问题
        Question question = caseDetailsService.ByIdQuestion(qid);
        model.addAttribute("question", question);
        //登陆用户 此处暂时是假数据
        User user = (User)session.getAttribute("user");
        model.addAttribute("user",user);
        return "forward:/cases/details.jsp";
    }

    /**
     * 主题帖编辑的方法
     * @return
     * 杨晨
     */
    @RequestMapping("/edit")
    public String edit(Model model, @RequestParam("qid") Integer qid) {
        System.out.println("________________________________________________-" + qid);
        Question question = caseDetailsService.ByIdQuestion(qid);
        //回显
        model.addAttribute("question",question);
        return "forward:/cases/edit.jsp";
    }

    /**
     * 主题帖的编辑更新方法
     * @return
     * 杨晨
     */
    @RequestMapping("/upData")
    public String upData(Model model, QuestionVo questionVo){
        Question question = caseDetailsService.ByIdQuestion(questionVo.getQid());
        question.setQs(questionVo.getQs());
        question.setQtype(questionVo.getQtype());
        question.setQbt(questionVo.getQbt());
        System.err.println(question+"-----------------------------------------------------------------------------");
        caseDetailsService.upDataQuestion(question);
        //待解决 编辑页跳转问题  -- 已解决
        model.addAttribute("question",question);
        return "forward:/cases/details.jsp";
    }


    /**
     * 主题帖置顶的方法
     * @return
     * 杨晨
     *
     */
    @RequestMapping("/top")
    public String top(@RequestParam("qid") Integer qid, HttpServletResponse response) {
        Question question = caseDetailsService.ByIdQuestion(qid);
        String qstick = question.getQstick();
        if(qstick.equals("1")){
            question.setQstick("0");
        }else {
            caseDetailsService.upNum();
            question.setQstick("1");
        }
        caseDetailsService.upDataQuestion(question);
        return "";
    }

    /**
     * 精品贴的方法
     * @return
     * 杨晨
     */
    @RequestMapping("/good")
    public String good(@RequestParam("qid")Integer qid ) {
        Question question = caseDetailsService.ByIdQuestion(qid);
        String qfierce= question.getQfierce();
        if (qfierce.equals("0")){
            question.setQfierce("1");
        }else {
            question.setQfierce("0");
        }
        //更新
        caseDetailsService.upDataQuestion(question);
        return "";
    }

    /**
     * 采纳的方法
     * @return
     * 杨晨
     */
    @RequestMapping("/accept")
    public String accept( @RequestParam("qid") Integer qid,@RequestParam("aid") Integer aid){
        Question question = caseDetailsService.ByIdQuestion(qid);
        question.setQstate("1");
        //查询问题
        Answer answer = caseDetailsService.ByIdAnswer(aid);
        answer.setDbest("1");
        caseDetailsService.upDataAnswer(answer);
        caseDetailsService.upDataQuestion(question);

        //采纳成功后设置一条消息
        Message message = new Message();
        message.setQid(qid);
        Question idQuestion = caseDetailsService.ByIdQuestion(qid);
        message.setQuid(idQuestion.getUid());
        message.setAuid(idQuestion.getUid());
        message.setMtype(1);
        caseDetailsService.insertMessage(message);
        return "";
    }
    /**
     * 取消采纳的方法
     */
    @RequestMapping("/unaccept")
    public String unaccept( @RequestParam("qid") Integer qid,@RequestParam("aid") Integer aid){
        Question question = caseDetailsService.ByIdQuestion(qid);
        question.setQstate("0");
        //查询问题
        Answer answer = caseDetailsService.ByIdAnswer(aid);
        answer.setDbest("0");
        caseDetailsService.upDataAnswer(answer);
        caseDetailsService.upDataQuestion(question);
        /*//取消采纳后设置一条消息
        Message message = new Message();
        message.setQid(qid);
        Question idQuestion = caseDetailsService.ByIdQuestion(qid);
        message.setQuid(idQuestion.getUid());
        message.setAuid(idQuestion.getUid());
        message.setMtype(1);
        caseDetailsService.insertMessage(message);*/
        return "";
    }

    /**
     * 点赞
     * @return
     */
    @RequestMapping("/assist")
    /**魏彤羽  回贴点赞功能start*/
    public @ResponseBody
    String assist(Integer aid, Boolean flag, Model model) {
//        传入布尔值用于判断是否点赞，true表示已点，false表示未点
        System.out.println("页面传入aid："+aid);
        System.out.println("页面传入boolean值："+flag);
        String assist = caseDetailsService.assist(aid, flag);
        return assist;
    }
    /**魏彤羽  回贴点赞功能end*/

    /**
     * 回复的编辑方法
     * @return
     */
    @RequestMapping("/replyEdit")
    public String replyEdit( @RequestParam("aid") Integer aid, @RequestParam("an") String an ){
        System.out.println(aid+an);
        Answer answer = caseDetailsService.ByIdAnswer(aid);
        System.out.println("问题"+answer);
        answer.setAn(an);
        caseDetailsService.upDataAnswer(answer);
        return "";
    }

    /**
     * 回复的删除方法
     *
     * @return
     */
    @RequestMapping("/delete")
    public String delete(@RequestParam("aid") Integer aid){
        System.out.println(aid);
        caseDetailsService.deleteAnswer(aid);
        return "";
    }

    /**
     * 回复的方法
     * @return
     */
    /**魏彤羽  提交回复功能start*/
    @RequestMapping("/reply")
    public @ResponseBody String reply(String content, HttpServletRequest httpServletRequest,Integer qid){
        User loginUser = (User)httpServletRequest.getSession().getAttribute("user");
//        如果没有登录
        if (loginUser == null){
//            返回false，并将回复内容进行回显
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("flag",false);
            jsonObject.put("content",content);
            return jsonObject.toString();
        }
        Boolean flag = caseDetailsService.insertAnswer(loginUser, content, qid);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("flag",flag);
        return jsonObject.toString();
    }
    /**魏彤羽  提交回复功能end*/


}
