package com.sss.service.netdisk;


import com.sss.bean.DirTreeBean;
import com.sss.bean.FileDownloads;
import com.sss.bean.Item;
import com.sss.bean.Share;

import java.io.File;
import java.util.List;

/**
 * Created by ZhangJun on 2018/6/1.
 * 11
 */
public interface IFileService {

    /**
     * 文件及文件夹复制递归实现(何洋 6-5)
     * @param from
     * @param to
     */
    void copy(String from, String to);

    List<Item> getPrevious(String path);

    /**
     * 获得兄弟文件及文件夹(朱锦祥 6-5)
     * @param path
     * @return
     */
    List<Item> getBrother(String path);

    /**
     * 获得指定分类公共资源(卢成安 6-5)
     * @param type
     * @param
     * @param
     * @return
     */
    List<Item> getAllPubic(int type);


    /**
     * 删除指定文件或文件夹下面的所有内容及自己(朱锦祥 6-5)
     * @param path
     */
    void delete(String path);


    /**
     * 获得指定文件夹的子文件及文件夹(何洋 6-5)
     * @param path
     * @return
     */
    List<Item> getChild(String path);
    /**
     * 移动文件及文件夹(何洋 6-6)
     * @param from
     * @param to
     */
    void move(String from, String to);


    /**
     * 搜索指定分类的公共的文件及文件夹(朱锦祥 6-6)
     * @param
     * @param name
     * @return
     */
    List<Item> searchPublic(String name);


    /**
     * 获得指定用户的指定分类文件及文件夹(卢成安 6-6)
     * @param userId
     * @param type
     * @return
     */
    List<Item> getAllPrivate(int userId, int type);

    /**
     * 搜索个人文件及文件夹(何洋 6-6)
     * @param userId
     * @param name
     * @return
     */
    List<Item> searchPrivate(int userId, String name);


    /**
     * 从from名字变成to名字(朱锦祥 6-6)
     * @param from
     * @param to
     */
    void renameFile(String from, String to);

    /**
     * 在指定路径新建文件夹(卢成安 6-6)
     * @param path
     * @param
     */
    void mkdir(String path);


    /**
     * 获得公共网盘的文件夹结构(张君)
     * @return
     */
    List<DirTreeBean> getDirTreePublic();

    /**
     * 根据用户id来获得对应的文件夹结构(张君)
     * @param userId
     * @return
     */
    List<DirTreeBean> getDirTreePrivate(int userId);

    /**
     * 公共网盘移动文件到回收站(张君)
     * @param path
     */
    void moveToTrashPublic(String path);

    /**
     * 个人网盘移动文件到回收站(张君)
     * @param userId
     * @param path
     */
    void moveToTrashPrivate(int userId, String path);

    Item convertToItemByPathPublic(String path);

    void insertFileDownloads(String [] path);

    List<FileDownloads> selectFileDownloads();
}
