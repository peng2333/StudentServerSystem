package com.sss.controller.competition;

import com.sss.bean.Measurement;
import com.sss.service.competition.BackstageService;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/bg")
public class BackstageServiceController {
    @Resource
    private BackstageService backstageService;

    /**
     * 遍历数据库志控制台页面
     * @return
     */
    @RequestMapping("/goadmin")
    public ModelAndView goadmin(){
        ModelAndView mv = new ModelAndView();
        List<Measurement> list = backstageService.Alllist();
        mv.setViewName("/competition/list_admin");
        mv.addObject("list" , list);
        return mv;
    }

    /**
     * 修改页面回显
     * @param id
     * @return
     */
    @RequestMapping("/redact")
    public ModelAndView redact(Integer id){

        ModelAndView mv = new ModelAndView();
        Measurement obj = backstageService.findobj(id);
        mv.setViewName("/competition/updatecompetition");
        mv.addObject("obj",obj);
        System.err.println(obj.getContent());
        return mv;
    }

    /**
     * 更改数据
     * @param id
     * @param level
     * @param content
     * @param answer
     * @return
     */
    @RequestMapping("/upData")
    public ModelAndView updataObj(Integer id , String level,String content,String answer){
        ModelAndView mv = new ModelAndView();
        Measurement obj = backstageService.findobj(id);
        obj.setLevel(level);
        obj.setAnswer(answer);
        obj.setContent(content);
        backstageService.updata(obj);
        mv.setViewName("redirect:/bg/goadmin");
        return mv;
    }

    /**
     * 删除数据
     * @param id
     * @return
     */
    @RequestMapping("/deleteObj")
    public ModelAndView deleteobj(Integer id){
        ModelAndView mv= new ModelAndView();
        backstageService.deleteObj(id);
        mv.setViewName("redirect:/bg/goadmin");
        return mv;
    }

    /**
     * 获得问题的答案
     * @param id
     * @return
     */
    @RequestMapping("/answer")
    public ModelAndView answer(Integer id){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/competition/details");
        Measurement obj = backstageService.findobj(id);
        mv.addObject("obj",obj);
        return mv;
    }

    /**
     * 模糊搜索
     * @param condition
     * @return
     */
    @RequestMapping("/findByCondition")
    public @ResponseBody List<Measurement> findByCondition(String condition){
        List<Measurement> measurementList = backstageService.findByCondition(condition);
        return measurementList;
    }

    /**
     * 设置发布信息
     */
    @RequestMapping("/getmeasure")
    public ModelAndView issueMeasure(Integer id){
        ModelAndView mv = new ModelAndView();
        backstageService.inssue(id);
        mv.setViewName("redirect:/bg/goadmin");
        return mv;
    }
}
