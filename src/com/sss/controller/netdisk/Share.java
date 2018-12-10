package com.sss.controller.netdisk;

import com.sss.bean.Downloads;
import com.sss.bean.ShareItem;
import com.sss.service.netdisk.DownloadsService;
import com.sss.service.netdisk.IFileService;
import com.sss.service.netdisk.IShareService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by ZhangJun on 2018/6/13.
 */
@Controller
@RequestMapping("/share")
public class Share {

    @Autowired
    HttpServletRequest request;

    @Autowired
    IShareService shareService;

    @Autowired
    IFileService fileService;

    @Autowired
    DownloadsService downloadsService;

    @RequestMapping("/{id}")
    public String shareFile(@PathVariable("id")int id){
        List<ShareItem> item1 = shareService.getItem(id);
        for (ShareItem shareItem : item1) {
            shareItem.setItem(fileService.convertToItemByPathPublic(shareItem.getPath()));
        }
        
        request.setAttribute("items", item1);

        System.out.println(shareService.getItem(id).size()+"            大小");


        for(ShareItem item:shareService.getItem(id)){
            System.out.println(item);
        }
        Downloads downloads = downloadsService.selectDownloans(id);
        System.out.println("downloads" + downloads);
        request.setAttribute("downloads",downloads);
        return "/netdisk/file_list";
    }
}
