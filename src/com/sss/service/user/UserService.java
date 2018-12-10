package com.sss.service.user;

import com.github.pagehelper.PageInfo;
import com.sss.bean.*;
import com.sss.bean.*;
import com.sss.vo.AddFriendVo;
import com.sss.vo.OnlineUserVo;
import com.sun.org.apache.bcel.internal.generic.NEW;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * 用户操作业务层接口
 */
public interface UserService {
    User login(User user);

    void updateUser(User user);

    List<Question> findQuestion(Integer uid);

    List<Answer> findAnswer(Integer uid);

    Question findQuestionByQid(Integer qid);

    User findById(Integer uid);
    /**
    *@Author WangShuang
    *@Description 通过登录用户id 查询用户发出的帖子问题 ，进行分页展示
    */
    PageInfo<Question> findQuestionsByUid(Integer uid);

    /**
    *@Author WangShuang
    *@Description 通过qid查询回答数
    */
    Integer findQuestionNum(Integer qid);

    List<Answer> findAnswerByQid(Integer qid);

    /**
    *@Author WangShuang
    *@Description 通过用户id查询用户的问题qname，
     *  再通过问题qid查询回答，再通过回答的uid查询user用户名
    */

    void insertUser(User user);

    /**
    *@Author WangShuang
    *@Description
    */
    List<Message> findMessageByQuid(Integer quid);

    /**
     * @author 张永琦
     * 获取学生用户数据
     */
    List<User> showAllStudent();

    void delete(Integer uid);

    User check(Integer uid);

    List<Question> findAllQuestion(Integer uid);

    List<OnlineUserVo> findFriendByUid(Integer uid);

    void addFriendMessage(AddFriendVo addFriendVo);

    List<AddFriendVo> selectAllMsg();

    List<AddFriendVo> findAddMsgByUid(Integer uid);

    AddFriendVo selectMsgByAfid(Integer afid);

    void addNewFriend(Friendship friendship);

    void deleteAddMsg(Integer afid);

    List<SystemMsg> findAllSystemmsg(Integer uid);

    void addNewSystemMsg(Integer sendId,Integer ReceiveId,Date date);

    void addNewSystemMsgFail(Integer sendId,Integer ReceiveId,Date date);

    /**
     * 通过二维码数据查找用户
     * @param qrData
     */
    User selectByqrData(String qrData);

    /**
     * 保存用户二维码信息
     * @param userQRCode
     */
    void insertUserQRCode(UserQRCode userQRCode);

    /**
     * 通过用户id查找二维码
     * @param uid
     * @return
     */
    UserQRCode selectByqrDataUid(Integer uid);

}
