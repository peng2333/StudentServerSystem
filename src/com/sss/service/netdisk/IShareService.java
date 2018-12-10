package com.sss.service.netdisk;

import com.sss.bean.Share;
import com.sss.bean.ShareItem;
import org.omg.CORBA.INTERNAL;

import java.util.List;

/**
 * Created by ZhangJun on 2018/6/7.
 */
public interface IShareService {
    /**
     * 获得公共的分享
     * @return
     */
    List<Share> getSharePublic();

    /**
     * 获得个人的分享
     * @param userId
     * @return
     */
    List<Share> getSharePrivate(int userId);

    /**
     * 移除单个或多个分享
     * @param shareId
     */
    void removeShareAll(List<Integer> shareId);

    /**
     * 移除分享里面的多个文件路径
     * @param pathIds
     */
    void removeShareFile(List<Integer> pathIds);

    /**
     * 添加分享
     */
    int addShare(String name,int userId,String[] path,int type);

    int getLastShareId(int userId);

    List<ShareItem> getItem(int shareId);

    ShareItem getShareItem(int itemId);

    Share getShare(int id);

    void download(Integer [] shareIds);
}
