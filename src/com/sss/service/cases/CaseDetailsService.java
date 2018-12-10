package com.sss.service.cases;

import com.sss.bean.Answer;
import com.sss.bean.Message;
import com.sss.bean.Question;
import com.sss.bean.User;

import java.util.List;

/**
 * 回复和问题的service
 * 杨晨
 */
public interface CaseDetailsService {
    /**
     *根据id查询问题
     * 杨晨
     */
    public Question ByIdQuestion(Integer qid);
    /**
     *
     */
    /**
     * 更新
     * @return
     * 杨晨
     */
    public void  upDataQuestion(Question question);
    /**
     * 删除回答
     * 杨晨
     */
    public void deleteAnswer(Integer aid);

    /**
     * 更新回答
     * 杨晨
     */
    public void upDataAnswer(Answer answer);
    /**
     * 增加回答
     * 魏彤羽
     */
    public Boolean insertAnswer(User loginUser ,String content,Integer qid);
    /**
     * 查询所有回答
     * 杨晨
     */
    public List<Answer> findAllAnswer();
    /**
     * 根据id查询回答
     * 杨晨
     */
    public Answer ByIdAnswer(Integer aid);

    /**
     * 回答点赞
     * 魏彤羽
     */
    public String assist(Integer aid,Boolean flag);

    /**
     * 判断置顶数量
     */
    public boolean upNum();

    public void insertMessage(Message message);
}
