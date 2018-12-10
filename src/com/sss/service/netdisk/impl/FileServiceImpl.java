package com.sss.service.netdisk.impl;


import com.sss.bean.DirTreeBean;
import com.sss.bean.FileDownloads;
import com.sss.bean.Item;
import com.sss.bean.Share;
import com.sss.mapper.netdisk.FileDownloadsMapper;
import com.sss.service.netdisk.IFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by ZhangJun on 2018/6/5.
 */
@Service
public class FileServiceImpl implements IFileService {
    @Autowired
    FileDownloadsMapper fileDownloadsMapper;

    public static String projectPath;

    public FileServiceImpl(){
        projectPath=getProjectPath();
    }

    @Override
    public void insertFileDownloads(String [] paths) {
        for(String path : paths){
            FileDownloads downloads = fileDownloadsMapper.selectByPrimaryKey(path);
            if(downloads == null){
                FileDownloads fileDownloads = new FileDownloads();
                fileDownloads.setPath(path);
                fileDownloads.setCount(1);
                fileDownloadsMapper.insert(fileDownloads);
            }else{
                downloads.setCount(downloads.getCount()+1);
                fileDownloadsMapper.updateByPrimaryKey(downloads);
            }
        }
    }

    @Override
    public void move(String from, String to) {
        copy(from,to);
        delete(from);
    }

    //复制方法
    @Override
    public void copy(String from, String to) {

        System.out.println(from+":"+to+"     复制命令");

        File file = new File(from);
        File file2 = new File(to);
        //调用递归方法
        copyFile(file, file2);
    }

    public List<Item> getPrevious(String path) {
        return null;
    }

    @Override
    public List<FileDownloads> selectFileDownloads() {
        List<FileDownloads> fileDownloadsList = fileDownloadsMapper.selectAll();
        for(int i = 0; i < fileDownloadsList.size() ; i++){
            for(int j = i+1; j < fileDownloadsList.size() ; j++){
                    if(fileDownloadsList.get(i).getCount() < fileDownloadsList.get(j).getCount()){
                        FileDownloads fileDownloads= fileDownloadsList.get(i);
                        fileDownloadsList.set(i, fileDownloadsList.get(j));
                        fileDownloadsList.set(j,fileDownloads);
                    }
            }
        }
        return fileDownloadsList;
    }

    //递归方法
    private static void copyFile(File file, File file2) {
        // 当找到目录时，创建目录
        if (file.isDirectory()) {
            file2.mkdir();
            File[] files = file.listFiles();
            for (File file3 : files) {
                // 递归
                copyFile(file3, new File(file2, file3.getName()));
            }
            //当找到文件时
        } else if (file.isFile()) {
            File file3 = new File(file2.getAbsolutePath());
            try {
                file3.createNewFile();
                //调用文件复制方法
                copyDatas(file.getAbsolutePath(), file3.getAbsolutePath());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    //文件复制方法
    private static void copyDatas(String filePath, String filePath1) {
        FileInputStream fis = null;
        FileOutputStream fos = null;
        try {
            // 字节流
            fis = new FileInputStream(filePath);
            fos = new FileOutputStream(filePath1);
            byte[] buffer = new byte[1024];
            while (true) {
                int temp = fis.read(buffer, 0, buffer.length);
                if (temp == -1) {
                    break;
                } else {
                    fos.write(buffer, 0, temp);
                }
            }
        } catch (IOException e) {
            System.out.println(e);
        } finally {
            try {
                fis.close();
                fos.close();
            } catch (IOException e) {
                System.out.println(e);
            }
        }
    }

    /**
     * 获得兄弟文件及文件夹
     * @param path
     * @return
     * 朱锦祥
     */
    @Override
    public List<Item> getBrother(String path) {
        path=getProjectPath()+"/"+path;
        File file = new File(path);
        File[] files = file.getParentFile().listFiles();
        ArrayList<Item> items = new ArrayList<>();
        for(File f : files){
            items.add(convertFileToItem(f));
        }
        return orderItem(items);
    }

    /**
     * 删除指定文件或文件夹下面的所有内容及自己
     * @param path
     * 朱锦祥
     */
    @Override
    public void delete(String path) {

        System.out.println("我执行删除");

        del(new File(path));
    }

    private void del(File file){
        if(file.isDirectory()){
            for(File f:file.listFiles()){
                del(f);
            }
        }
        file.delete();
    }


    //获得子文件跟子文件夹方法
    @Override
    public List<Item> getChild(String path) {

        System.out.println(path+"  之前");
        path=getProjectPath()+"/"+path;

        File file = new File(path);

        System.out.println(file.getAbsolutePath()+"          子文件夹绝对路径");

        File[] files = file.listFiles();
        List<Item> list = new ArrayList<>();

        if(files.length==0){
            return null;
        }
        for (File file1 : files) {
            if (file1 != null) {
                Item item = convertFileToItem(file1);
                list.add(item);
            }
        }
        return orderItem(list);
    }

    @Override
    public List<Item> getAllPubic(int type) {
        String path=getProjectPath()+"/upload/"+getPrefix(type);

        System.out.println(path+"  绝对路径-------");

        File file=new File(path);
        List<Item> result=new ArrayList<>();

        if(file==null||!file.isDirectory()){
            return null;
        }

        for(File f:file.listFiles()){
            result.add(convertFileToItem(f));
        }
        return orderItem(result);
    }

    /**
     * 搜索指定分类的公共的文件及文件夹
     * @param name
     * @return
     */
    @Override
    public List<Item> searchPublic(String name) {
        String path = getProjectPath()+"/upload";
        ArrayList<Item> itemList = new ArrayList<>();
        ArrayList<File> files = new ArrayList<>();
        List<File> listFile = listFile(path, files);
        for(File file : listFile){
            if(file.getName().contains(name)){
                itemList.add(convertFileToItem(file));
            }
        }
        return orderItem(itemList);
    }

    private void sear(File file,List<Item> list,String name){
        if(file.isDirectory()){
            for(File f:file.listFiles()){
                sear(f,list,name);
            }
        }
        if(file.getName().contains(name)){
            list.add(convertFileToItem(file));
        }
    }

    @Override
    public List<Item> getAllPrivate(int userId, int type) {
        File file=new File(projectPath+"/student_dir/"+userId+getPrefix(type));
        List<Item> result=new ArrayList<>();
        if(file.isDirectory()){
           for(File f:file.listFiles()){
            result.add(convertFileToItem(f));
        }
        }
        return orderItem(result);
    }

    @Override
    public List<Item> searchPrivate(int userId, String name) {
        File file=new File(getUserDir(userId));
        List<Item> result=new ArrayList<>();
        if(file!=null&&file.isDirectory()){
            sear(file,result,name);
        }

        System.out.println(result.size()+"      共找到");

        return orderItem(result);
    }

    /**
     * 从from名字变成to名字
     * @param from
     * @param to
     * 朱锦祥
     */
    @Override
    public void renameFile(String from, String to) {
        File fromFile=new File(projectPath+from);
        File toFile=new File(projectPath+to);
        fromFile.renameTo(toFile);
    }

    @Override
    public void mkdir(String path) {
        new File(path).mkdirs();
    }


    @Override
    public List<DirTreeBean> getDirTreePublic() {
        System.out.println(getProjectPath()+"/upload");
       return getDirTreeList(getProjectPath()+"/upload");
    }

    @Override
    public List<DirTreeBean> getDirTreePrivate(int userId) {
        return getDirTreeList(getUserDir(userId));
    }

    @Override
    public void moveToTrashPublic(String path) {
        move(path,getProjectPath()+"/trash");
    }
    //asdasdasdasdasd
    @Override
    public void moveToTrashPrivate(int userId, String path) {
        move(path,getUserDir(userId)+"/trash");
    }


    /**
     * 获得项目路径
     * @return
     */
    public  String getProjectPath(){

        return (this.getClass().getClassLoader().getResource("").getPath().
                substring(0,this.getClass().getClassLoader().getResource("/").getPath().indexOf("/out"))+"/web").substring(1);
    }

    /**
     * 获得指定id的用户的网盘在服务器上的绝对路径
     * @param userId
     * @return
     */
    public String getUserDir(int userId){
        return getProjectPath()+"/student_dir/"+userId;
    }

    /**
     * 将file转换为item
     * @param file
     * @return
     */
    private Item convertFileToItem(File file){

        File f=new File(file.getAbsolutePath().replace(" ",""));
        file.renameTo(f);
        Item item=new Item();
        item.setName(file.getName().replace(" ",""));

        if(file.isFile()) {
            item.setPostfix(file.getName().substring(file.getName().lastIndexOf(".")));
            System.out.println("-"+item.getPostfix()+"---"+file.getName()+"-后缀");
        }
        item.setDir(file.isDirectory());
        item.setLastModifyDate(new Date(file.lastModified()));

        String projectPath = getProjectPath();
        String absolutePath = file.getAbsolutePath();
        absolutePath=absolutePath.replace("\\","/");
        String s=absolutePath.replace(projectPath,"");

        System.out.println(absolutePath+"         <:>           "+getProjectPath());

        item.setPath(s.replace(" ",""));
        System.out.println(item.getPath()+"        得到路径");
        if(file.isFile()){
            item.setSize(getLengthString(file.length()));
        }


        return item;
    }

    /**
     * 文件大小显示
     * @param length
     * @return
     */
    private String getLengthString(long length) {
        if(length>1024*1024*100){

            return (length/(1024*1024*100))+"GB";
        }
        if(length>1024*1024){
            return (length/(1024*1024))+"MB";
        }
        if(length>1024){
            return length/1024+"KB";
        }
        return length+"B";
    }


    public static List<DirTreeBean> getDirTreeList(String path){
        File file=new File(path);
        List<DirTreeBean> result=new ArrayList<>();
        for(File f:file.listFiles()){
            if(f.isDirectory()){
                result.add(convertFileToBean(f));
            }
        }
        return result;
    }

    private static DirTreeBean convertFileToBean(File file){
        DirTreeBean dirTreeBean=new DirTreeBean();
        dirTreeBean.setName(file.getName());
        String absolutePath = file.getAbsolutePath();
        String replace = absolutePath.replace("\\", "/");
        dirTreeBean.setPath(replace);
        dirTreeBean.setSpred(file.listFiles().length>0);
        dirTreeBean.setChildren(getDirTreeList(file.getAbsolutePath()));
        return dirTreeBean;
    }

    /**
     * 递归遍历目录下的所有子文件及文件夹
     * @param dir
     * @param listFile
     * @return
     */
    public static List<File> listFile(String dir, List<File> listFile) {
        File file = new File(dir);
        if (!file.isDirectory()) {
            return listFile;
        }
        File[] files = file.listFiles();
        for (int i = 0, len = files.length; i < len; i++) {
            if (files[i].isDirectory()) {
                listFile.add(files[i]);
                listFile(files[i].getPath(), listFile);
            } else {
                listFile.add(files[i]);
            }
        }
        listFile.add(file);
        return listFile;
    }

    /**
     * 根据传递过来的int值来获得前缀
     * @param type
     * @return
     */
    public String getPrefix(int type){
        String path="";
        switch (type) {
            case 0:
                path =  "/tool/";
                break;
            case 1:
                path =  "/doc/";
                break;
            case 2:
                path =  "/video/";
                break;
            case 3:
                path =  "/jar/";
                break;
            case 4:
                path =  "/code/";
                break;
            case 5:
                path =  "/other/";
                break;
            default:
                path =  "/other/";
                break;
        }
        return path;
    }
    public List<Item> orderItem(List<Item> list){
        for(int i=0;i<list.size();i++){
            for(int j=0;j<i;j++){
                if(list.get(i).isDir()&&!list.get(j).isDir()){
                    Item temp=list.get(i);
                    list.set(i,list.get(j));
                    list.set(j,temp);
                }
            }
        }
        return list;
    }

    //根据公共网盘的相对路径来得到一个Item
    public Item convertToItemByPathPublic(String path){
        File file=new File(projectPath+path);

        return convertFileToItem(file);
    }
    //根据用户的私人网盘相对路径得到一个Item
    public Item converetToItemByPathPrivate(String path,int userId){
        File file=new File(getUserDir(userId)+path);
        return convertFileToItem(file);
    }

}
