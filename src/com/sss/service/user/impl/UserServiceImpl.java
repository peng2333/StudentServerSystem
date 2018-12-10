package com.sss.service.user.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sss.bean.*;
import com.sss.mapper.user.AddFriendMapper;
import com.sss.bean.*;
import com.sss.mapper.user.FriendshipMapper;
import com.sss.mapper.user.SystemMsgMapper;
import com.sss.mapper.user.UserMapper;
import com.sss.mapper.user.UserQRCodeMapper;
import com.sss.service.user.UserService;
import com.sss.vo.AddFriendVo;
import com.sss.vo.OnlineUserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * 用户操作业务层实现类
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private FriendshipMapper friendshipMapper;

    @Autowired
    private UserQRCodeMapper userQRCodeMapper;

    @Autowired
    private AddFriendMapper addFriendMapper;

    @Autowired
    private SystemMsgMapper systemMsgMapper;

    @Override
    public User login(User user) {
        User u = userMapper.selectByUsernamePassword(user);
        return u;
    }

    @Override
    public List<Question> findQuestion(Integer uid) {
        return userMapper.findQuestionByUid(uid);
    }

    @Override
    public List<Answer> findAnswer(Integer uid) {
        return userMapper.findAnswerByUid(uid);
    }

    @Override
    public Question findQuestionByQid(Integer qid) {
        return userMapper.findQuestionByQid(qid);
    }

    @Override
    public User findById(Integer uid) {
        return userMapper.selectByPrimaryKey(uid);
    }

    /**
     * @Author WangShuang
     * @Description 通过登录用户id 查询用户发出的帖子问题 ，进行分页展示
     */
    @Override
    public PageInfo<Question> findQuestionsByUid(Integer uid) {
        PageHelper.startPage(1, 6);
        List<Question> list = userMapper.findQuestionByUid(uid);
        return new PageInfo<>(list);
    }

    @Override
    public Integer findQuestionNum(Integer uid) {
        return userMapper.findAnswerNum(uid);
    }

    @Override
    public List<Answer> findAnswerByQid(Integer qid) {
        return userMapper.findAnswerByQid(qid);
    }

    @Override
    public void insertUser(User user) {
        userMapper.insert(user);
    }

    @Override
    public List<Message> findMessageByQuid(Integer quid) {
        return userMapper.findMessageByQuid(quid);
    }

    @Override
    public void updateUser(User user) {
        userMapper.updateByPrimaryKey(user);
    }

    @Override
    public List<User> showAllStudent() {
        List<User> users = userMapper.showAllStudent();
        return users;
    }


    @Override

    public void delete(Integer uid) {
        int i = userMapper.deleteByPrimaryKey(uid);
        userMapper.deleteQue(uid);
        userMapper.deleteAns(uid);
        System.out.println(i);
    }

    @Override
    public User check(Integer uid) {
        User user = userMapper.selectByPrimaryKey(uid);
        return user;
    }

    @Override
    public List<Question> findAllQuestion(Integer uid) {
        List<Question> questionByUid = userMapper.findQuestionByUid(uid);
        return questionByUid;
    }

    @Override
    public List<OnlineUserVo> findFriendByUid(Integer uid) {
        return friendshipMapper.findFriends(uid);
    }

    @Override
    public void addFriendMessage(AddFriendVo addFriendVo) {
        addFriendMapper.insert(addFriendVo);
    }

    @Override
    public List<AddFriendVo> selectAllMsg() {
        return addFriendMapper.selectAll();
    }

    /**
    *@Author:ZhangPeng
    *@Description:通过当前用户id获得消息盒子信息
    */
    @Override
    public List<AddFriendVo> findAddMsgByUid(Integer uid) {
        return friendshipMapper.findAddMsgByUid(uid);
    }

    @Override
    public AddFriendVo selectMsgByAfid(Integer afid) {
        return addFriendMapper.selectByPrimaryKey(afid);
    }

    public void addNewFriend(Friendship friendship){
        friendshipMapper.insert(friendship);
    }

    @Override
    public void deleteAddMsg(Integer afid) {
        addFriendMapper.deleteByPrimaryKey(afid);
    }

    @Override
    public List<SystemMsg> findAllSystemmsg(Integer uid) {
        return systemMsgMapper.selectByUid(uid);
    }

    @Override
    public void addNewSystemMsg(Integer sendId,Integer receiveId,Date date) {
        systemMsgMapper.addStstemMsg(sendId,receiveId,date);
    }

    @Override
    public void addNewSystemMsgFail(Integer sendId,Integer receiveId,Date date) {
        systemMsgMapper.addStstemMsgFail(sendId,receiveId,date);
    }



    /**
     * @author: 朱元浩
     * @date: 2018/6/28 20:24
     * @Param: [qrData]
     * @return: com.sss.bean.User
     * @Description: 通过二维码信息查找用户
     */
    @Override
    public User selectByqrData(String qrData) {
        String[] split = qrData.split("@");
        User user = new User();
        user.setUsername(split[0]);
        user.setPassword(split[1]);
        return userMapper.selectByUsernamePassword(user);
    }

    /**
     * @author: 朱元浩
     * @date: 2018/6/28 20:34
     * @Param: [userQRCode]
     * @return: void
     * @Description: 保存用户二维码信息
     */
    @Override
    public void insertUserQRCode(UserQRCode userQRCode) {
        userQRCodeMapper.insert(userQRCode);
    }

    /**
     * @author: 朱元浩
     * @date: 2018/6/28 21:16
     * @Param: [uid]
     * @return: com.sss.bean.UserQRCode
     * @Description: 通过用户id查找二维码
     */
    @Override
    public UserQRCode selectByqrDataUid(Integer uid) {
        return userQRCodeMapper.selectByUid(uid);
    }

}
