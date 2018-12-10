package com.sss.controller.netdisk;

import com.sss.bean.Downloads;
import com.sss.service.netdisk.DownloadsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DownloadsController {

    @Autowired
    private DownloadsService downloadsService;

    @RequestMapping("/addDownloads")
    public void addDownloads(@RequestParam("share_id") Integer shareId){

        downloadsService.addDownloans(shareId);

    }

    @RequestMapping("selectDownloads")
    public Downloads selectDownloads(@RequestParam("share_id") Integer shareId){
        return downloadsService.selectDownloans(shareId);
    }
}
