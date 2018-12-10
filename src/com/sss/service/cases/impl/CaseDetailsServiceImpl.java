package com.sss.service.cases.impl;

import com.sss.bean.Answer;
import com.sss.bean.Message;
import com.sss.bean.Question;
import com.sss.bean.User;
import com.sss.mapper.cases.AnswerMapper;
import com.sss.mapper.cases.MessageMapper;
import com.sss.mapper.cases.QuestionMapper;
import com.sss.mapper.user.UserMapper;
import com.sss.service.cases.CaseDetailsService;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

//把这个类交给spring管理
@Component
//交给事务管理器管理
@Transactional
public class CaseDetailsServiceImpl implements CaseDetailsService {
    @Resource
    private QuestionMapper questionMapper;
    @Resource
    private AnswerMapper answerMapper;
    @Resource
    private UserMapper userMapper;
    @Resource
    private MessageMapper messageMapper;
    /**
     * 根据id查询问题
     *
     * @return 杨晨
     */
    @Override
    public Question ByIdQuestion(Integer qid) {
        Question question = questionMapper.selectByPrimaryKey(qid);

        /**魏彤羽  用户查询、回贴查询 start*/
//        根据问题的uid查询问题用户并添加
        User questionUser = userMapper.selectByPrimaryKey(question.getUid());
        question.setUser(questionUser);
//        根据问题qid查询回贴并添加
        Example example = new Example(Answer.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("qid", question.getQid());
        List<Answer> answerList = answerMapper.selectByExample(example);
//        根据回贴的uid查询回贴用户并添加
        for (Answer answer : answerList) {
            User answerUser = userMapper.selectByPrimaryKey(answer.getUid());
            answer.setUser(answerUser);
        }
        question.setAnswerList(answerList);
        /**魏彤羽  用户查询、回贴查询 end*/
        return question;
    }

    /**
     * 更新
     * @param question
     */
    @Override
    public void upDataQuestion(Question question) {
        //更新完成
        questionMapper.updateByPrimaryKey(question);
    }

    /**
     * 删除回复
     */
    @Override
    public void deleteAnswer( Integer aid) {
        answerMapper.deleteByPrimaryKey(aid);
//        删除回复的同时按照aid删除message中的数据（此处有歧义，数据库字段缺失，此功能暂时无法实现）
        /*Example example = new Example(Message.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("aid",aid);
        messageMapper.deleteByExample(example);*/
    }

    /**
     * 编辑回复
     */
    @Override
    public void upDataAnswer(Answer answer) {
        answerMapper.updateByPrimaryKey(answer);
    }

    /**
     * 增加回复功能
     * 魏彤羽
     */
    @Override
    public Boolean insertAnswer(User loginUser ,String content,Integer qid) {
        Answer answer = new Answer();
        answer.setAn(content);
        answer.setUid(loginUser.getUid());
        answer.setQid(qid);
        answer.setDzs(0);
        answer.setDtime(new Date());
        answer.setDbest("0");
        answer.setUser(loginUser);
        answerMapper.insert(answer);

        Message message = new Message();
        message.setQid(qid);
        message.setQuid(questionMapper.selectByPrimaryKey(qid).getUid());
        message.setAuid(loginUser.getUid());
        message.setMtype(0);
        messageMapper.insert(message);
        return true;
    }

    @Override
    public List<Answer> findAllAnswer() {
        return null;
    }

    @Override
    public Answer ByIdAnswer(Integer aid) {
        Answer answer = answerMapper.selectByPrimaryKey(aid);
        return answer;
    }

    /**
     * 回答点赞功能
     * 魏彤羽
     */
    @Override
    public String assist(Integer aid,Boolean flag) {
//        true表示已点，false表示未点
        Answer answer;
        if (flag) {
//            先查询获取数据再设置修改更新
            answer = answerMapper.selectByPrimaryKey(aid);
            System.out.println("true已经点赞"+answer.getDzs());
            answer.setDzs(answer.getDzs() - 1);
            answerMapper.updateByPrimaryKey(answer);
            return "{\"flag\":false,\"dzs\":\""+answer.getDzs()+"\"}";
        }else{
            answer = answerMapper.selectByPrimaryKey(aid);
            System.out.println("false已经点赞"+answer.getDzs());
            answer.setDzs(answer.getDzs() + 1);
            answerMapper.updateByPrimaryKey(answer);
            return "{\"flag\":true,\"dzs\":\""+answer.getDzs()+"\"}";
        }

    }

    /**
     * 判断是否能添加
     * @param
     * @return
     */
    @Override
    public boolean upNum() {
        System.out.println("1233333333333333111111111111111111111111111执行");
        //查询所有置顶的问题
        List<Question> all = questionMapper.selectAll();
        List<Question> list =new ArrayList<>();
        for (Question question:all){
            System.out.println(question.getQstick());
            if (question.getQstick().equals("1")){
                list.add(question);
            }
        }
        //如果置顶的回答大于4个的话那么取消置顶最少热度的
        if(list.size()>3){
            Integer qid1=list.get(0).getQid();
            Integer mind=list.get(0).getDjs();
            for (Question question :list){
                if(question.getDjs()<mind){
                    mind=question.getDjs();
                    qid1=question.getQid();
                }
            }
            System.out.println(list.size()+"--------------------------判断更新"+qid1);
            //取出qid的对象
            Question question = questionMapper.selectByPrimaryKey(qid1);
            question.setQstick("0");
            //并更新
            questionMapper.updateByPrimaryKey(question);
        }

        return false;
    }

    @Override
    public void insertMessage(Message message) {
        messageMapper.insert(message);
    }
}
