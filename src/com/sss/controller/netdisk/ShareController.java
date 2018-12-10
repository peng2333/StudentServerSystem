package com.sss.controller.netdisk;

import com.sss.bean.Share;
import com.sss.bean.ShareItem;
import com.sss.bean.Link;
import com.sss.bean.User;
import com.sss.service.netdisk.IShareService;
import com.sss.service.netdisk.ZipUtil;
import com.sss.service.netdisk.impl.FileServiceImpl;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@RestController
@RequestMapping("/share")
public class ShareController {

    @Autowired
    private IShareService iShareService;

    @Autowired
    HttpServletRequest request;

    @Autowired
    FileServiceImpl fileService;

    @Autowired
    HttpServletResponse response;

    /**
     * 获取公共分享
     * @return
     */
    @RequestMapping("/getSharePublic")
    public List<Share> getSharePublic(){
        return iShareService.getSharePublic();
    }

    /**
     * 获取指定用户的分享
     */
    @RequestMapping("/getSharePrivate")
    public List<Share> getSharePrivate(@RequestParam("userId") Integer uid){
        return iShareService.getSharePrivate(uid);
    }

    /**
     * 移除单个或多个分享
     * @param shareId
     */
    @RequestMapping("/unshare")
    public void removeShareAll(@RequestParam("shareId") List<Integer> shareId){
       iShareService.removeShareAll(shareId);
    }

    /**
     * 移除分享里面的多个文件路径
     * @param pathIds
     */
    @RequestMapping("/unshareItem")
    public void removeShareFile(@RequestParam("itemId") List<Integer> pathIds){
        iShareService.removeShareFile(pathIds);
    }

    @RequestMapping("/addShare")
    public Link addShare(@RequestParam("path")String[]path, @RequestParam("name")String name, @RequestParam("type")String type){
        User user=(User)request.getSession().getAttribute("user");
        int aPublic = iShareService.addShare(name, user.getUid(), path, type.equals("public") ? 1 : -1);
        return new Link("","http://localhost:8080/share/"+aPublic);
    }


    @RequestMapping("/getItem")
    public List<ShareItem> getItem(@RequestParam("shareId")int shareId){
        List<ShareItem> item = iShareService.getItem(shareId);
        for(ShareItem shareItem:item){
            shareItem.setItem(fileService.convertToItemByPathPublic(shareItem.getPath()));
        }

        request.getSession().setAttribute("belongUserId",iShareService.getShare(shareId).getUser_id());

        System.out.println(request.getSession().getAttribute("belongUserId")+"        ---------session 中的user id");

        return item;
    }


    @RequestMapping("/download")
    public void download(@RequestParam("shareId")Integer[] shareId) throws Exception {

        System.out.println(shareId.length+"       id长度");

        List<String> path=new ArrayList<>();
        for(int id:shareId){
            List<ShareItem> item = iShareService.getItem(id);

            System.out.println(item.size()+"         对应item的大小");

            for(ShareItem shareItem:item){
                path.add(FileServiceImpl.projectPath+shareItem.getPath());
            }
        }

        iShareService.download(shareId);

        //文件及文件夹混合压缩，并保持文件夹结构
        String outPath=FileServiceImpl.projectPath+"/temp/"+path.get(0).substring(path.get(0).lastIndexOf("/")+1)+"等"+path.size()+"个文件和文件夹.zip";


        System.out.println(outPath+"       输出路径");

        new File(outPath).mkdirs();
        String[] p=new String[path.size()];

        for(int i=0;i<path.size();i++){
            p[i]=path.get(i);
        }


        for(String s:p){
            System.out.println(s+"----------     -------     下载路径");
        }


        ZipUtil.toZip(removeRepeat(p),outPath,true);
        //响应给浏览器下载
        String contentType=request.getServletContext().getMimeType(outPath);
        response.setHeader("Content-Type",contentType);
        response.setHeader("Content-Disposition", "attachment;filename="+outPath.substring(outPath.lastIndexOf("/")));

        // 获取绑定了客户端的流
        ServletOutputStream output = response.getOutputStream();

        // 把输入流中的数据写入到输出流中
        IOUtils.copy(new FileInputStream(outPath),output);

    }
    private String[] removeRepeat(String[] path){
        List<String> newPath=new ArrayList<>();
        List<String> oldPath= Arrays.asList(path);
        for(String p:oldPath){
            if(!newPath.contains(p)){
                newPath.add(p);
            }
        }

        String[] result=new String[newPath.size()];
        for(int i=0;i<newPath.size();i++){
            result[i]=newPath.get(i);
        }

        return result;
    }


    @RequestMapping("/downloadItem")
    public void down(@RequestParam("shareId")Integer[] item) throws Exception {
        String[] path=new String[item.length];
        for(int i=0;i<item.length;i++){
            path[i]=FileServiceImpl.projectPath+iShareService.getShareItem(item[i]).getPath();
        }

        //文件及文件夹混合压缩，并保持文件夹结构
        String outPath=FileServiceImpl.projectPath+"/temp/"+path[0].substring(path[0].lastIndexOf("/")+1)+"等"+path.length+"个文件和文件夹.zip";


        System.out.println(outPath+"       输出路径");

        new File(outPath).mkdirs();



        ZipUtil.toZip(removeRepeat(path),outPath,true);
        //响应给浏览器下载
        String contentType=request.getServletContext().getMimeType(outPath);
        response.setHeader("Content-Type",contentType);
        response.setHeader("Content-Disposition", "attachment;filename="+outPath.substring(outPath.lastIndexOf("/")));

        // 获取绑定了客户端的流
        ServletOutputStream output = response.getOutputStream();

        // 把输入流中的数据写入到输出流中
        IOUtils.copy(new FileInputStream(outPath),output);

    }
}
