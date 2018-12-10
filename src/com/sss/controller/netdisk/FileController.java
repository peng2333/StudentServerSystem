package com.sss.controller.netdisk;

import com.sss.bean.*;
import com.sss.mapper.netdisk.FileDownloadsMapper;
import com.sss.service.netdisk.IFileService;
//import com.sss.service.netdisk.PdfUtil;
import com.sss.service.netdisk.ZipUtil;
import com.sss.service.netdisk.impl.FileServiceImpl;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by ZhangJun on 2018/6/5.
 */
@RestController
@RequestMapping("/file")
public class FileController {

    @Autowired
    HttpServletResponse response;

    @Autowired
    HttpServletRequest request;

    @Autowired
    IFileService fileService;

    @Autowired
    FileDownloadsMapper fileDownloadsMapper;

    /**
     * 删除指定文件
     */
    @RequestMapping("/delete")
    public void delete(@RequestParam("path") String[] path) {

        System.out.println("执行controller  delete");

        for (String str : path) {
            System.out.println(FileServiceImpl.projectPath + str + " 当前路径");

            fileService.delete(FileServiceImpl.projectPath + str);
        }

    }

    /**
     * 复制文件到指定目录
     *
     * @param path
     * @param to
     */
    @RequestMapping("/copy")
    public void copy(@RequestParam("path") String[] path, @RequestParam("to") String to) {
        to = (String) request.getSession().getAttribute("path");

        if(to==null||to.equals("")){
            return;
        }

        for (String str : path) {

            if(str.equals(to)){
                continue;
            }

            fileService.copy(FileServiceImpl.projectPath + str, to + str.substring(str.lastIndexOf("/")));
        }
    }

    /**
     * 移动文件到指定目录
     *
     * @param from
     * @param to
     */

    @RequestMapping("/move")
    public void move(@RequestParam("path") String[] from, @RequestParam("to") String to) {


        System.out.println(" 到这个路径    "+to);

        //to = (String) request.getSession().getAttribute("path");

        if(to==null||to.equals("")){
            return;
        }

        for (String str : from) {

            if((FileServiceImpl.projectPath + str).equals(to + str.substring(str.lastIndexOf("/")))){
                continue;
            }

            System.out.println(FileServiceImpl.projectPath + str + "  到:" + to + str.substring(str.lastIndexOf("/")));

            fileService.move(FileServiceImpl.projectPath + str, to + str.substring(str.lastIndexOf("/")));
        }
    }

    /**
     * 获得指定绝对路径下的子文件及文件夹
     *
     * @param path
     * @return
     */

    @RequestMapping("/getChild")
    public FileBean getChild(@RequestParam("path") String path) {
        System.out.println(path+"    获得子文件及文件夹");
        return new FileBean(path, fileService.getChild(path));
    }

    /**
     * 获得兄弟
     *
     * @param path
     * @return
     */
    @RequestMapping("/getBrother")
    public FileBean getBrother(@RequestParam("path") String path) {

        /*System.out.println(path+"  兄弟路径");

        if(path.equals("/upload/tool/")||path.equals("/upload/doc/")||path.equals("/upload/jar/")||path.equals("/upload/video/")||path.equals("/upload/code/")||path.equals("/upload/other/")){
            return new FileBean(path,fileService.getChild(path));
        }
        String s=path+"/";
        System.out.println(s+"            --- 处理后");
        if(s.equals("/upload/tool/")||s.equals("/upload/doc/")||s.equals("/upload/jar/")||s.equals("/upload/video/")||s.equals("/upload/code/")||s.equals("/upload/other/")){
            return new FileBean(path,fileService.getChild(path));
        }

        //正则进行路径匹配，匹配用户路径
*/

        return new FileBean(path.substring(0, path.lastIndexOf("/")), fileService.getBrother(path));
    }

    /**
     * 重命名指定路径的文件或文件夹到to
     *
     * @param from
     * @param to
     */
    @RequestMapping("/rename")
    public void rename(@RequestParam("path") String[] from, @RequestParam("to") String to) {
        fileService.renameFile(from[0], from[0].substring(0, from[0].lastIndexOf("/")) + "/" + to);


    }

    /**
     * 新建文件夹
     *
     * @param path
     */
    @RequestMapping("/mkdir")
    public void mkdir(@RequestParam("path") String path) {

        System.out.println(path + "   获得的路径");

        fileService.mkdir(FileServiceImpl.projectPath + path);
    }

    /**
     * 获得指定区域的公共资料
     *
     * @param type
     * @return
     */
    @RequestMapping("/getAllPublic")
    public FileBean getAllPublic(@RequestParam("type") int type) {

        return new FileBean("/upload" + new FileServiceImpl().getPrefix(type), fileService.getAllPubic(type));
    }

    /**
     * 获得指定用户指定区域的文件列表
     *
     * @param userId
     * @param type
     * @return
     */
    @RequestMapping("/getAllPrivate")
    public FileBean getAllPrivate(@RequestParam("userId") int userId, @RequestParam("type") int type) {
        return new FileBean("/student_dir/" + userId + new FileServiceImpl().getPrefix(type), fileService.getAllPrivate(userId, type));
    }

    @RequestMapping("/upload")
    public void upload(@RequestParam("path") String path, @RequestParam("file") MultipartFile[] files) {

        System.out.println("上传进来了    ");

        for (MultipartFile f : files) {

            File file1;
            String name = "";
            try {
                if (f instanceof CommonsMultipartFile) {
                    //转换成这个对象，然后我们需要通过里面的FileItem来获得相对路径
                    CommonsMultipartFile f2 = (CommonsMultipartFile) f;
                    name = f2.getFileItem().getName();
                    System.out.println(name + "        ---------相对路径");

                    file1 = new File(FileServiceImpl.projectPath + path + name);

                    System.out.println(FileServiceImpl.projectPath + ":" + path + ":" + name);

                    file1.mkdirs();
                    file1.createNewFile();



                    f.transferTo(file1);
                }
                System.out.println(f.getOriginalFilename() + "   iii         --------");
                System.out.println("sssss   ");
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

    }

    /**
     * 搜索公共网盘文件
     *
     * @param name
     * @return
     */
    @RequestMapping("/searchPublic")
    public List<Item> searchPublic(@RequestParam("name") String name) {
        return fileService.searchPublic(name);
    }

    /**
     * 搜索个人网盘文件
     *
     * @param name
     * @param userId
     * @return
     */
    @RequestMapping("/searchPrivate")
    public List<Item> searchPrivate(@RequestParam("name") String name, @RequestParam("userId") int userId) {
        return fileService.searchPrivate(userId, name);
    }

    @RequestMapping("/moveToTrashPublic")
    public void moveToTrashPublic(@RequestParam("path") String[] path) {
        for (String p : path) {
            fileService.moveToTrashPublic(p);
        }
    }

    @RequestMapping("/moveToTrashPrivate")
    public void moveToTrashPrivate(@RequestParam("path") String[] path, @RequestParam("userId") int userId) {
        for (String p : path) {
            fileService.moveToTrashPrivate(userId, p);
        }
    }

    @RequestMapping("/getDirTreeListPublic")
    public List<DirTreeBean> getDirTreeListPublic() {
        return fileService.getDirTreePublic();
    }

    @RequestMapping("/getDirTreeListPrivate")
    public List<DirTreeBean> getDirTreeListPrivate(@RequestParam("userId") int userId) {
        return fileService.getDirTreePrivate(userId);
    }

    @RequestMapping("/treeDirPublic")
    public List<DirTreeBean> getDirTreeBean() {
        User user = (User) request.getSession().getAttribute("user");
        if (user.getUid() != 1) {
            return fileService.getDirTreePrivate(user.getUid());
        }

        return fileService.getDirTreePublic();
    }


    @RequestMapping("/putPathToSession")
    public void putToSession(@RequestParam("path") String path) {
        request.getSession().setAttribute("path", path);
    }

    @RequestMapping("/download")
    public void download(@RequestParam("path")String[] path) throws Exception {
        fileService.insertFileDownloads(path);
        //获得项目路径
        String projectPath=FileServiceImpl.projectPath;

        //文件及文件夹混合压缩，并保持文件夹结构
        String outPath=FileServiceImpl.projectPath+"/temp/"+path[0].substring(path[0].lastIndexOf("/")+1)+"等"+path.length+"个文件和文件夹.zip";

        //前缀处理
        for(int i=0;i<path.length;i++){
            path[i]=projectPath+"/"+path[i];
            System.out.println(path[i]+"     这个是路径  记好了哦");
        }

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


    @RequestMapping("/transferFormat")
    public Link getAfterLink(@RequestParam("path")String path){
        //PdfUtil.convert(FileServiceImpl.projectPath+path,FileServiceImpl.projectPath+"/temp/"+path.substring(path.lastIndexOf("/"),path.lastIndexOf("."))+".pdf");
        return new Link("","/temp"+path.substring(path.lastIndexOf("/"),path.lastIndexOf("."))+".pdf");
    }

    @RequestMapping("/fileDownloads")
    public @ResponseBody  List<FileDownloads> fileDownloads(){
        return fileService.selectFileDownloads();
    }

}
