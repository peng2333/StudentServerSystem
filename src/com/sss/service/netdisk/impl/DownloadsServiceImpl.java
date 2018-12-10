package com.sss.service.netdisk.impl;

import com.sss.bean.Downloads;
import com.sss.mapper.netdisk.DownloadsMapper;
import com.sss.service.netdisk.DownloadsService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
@Transactional
public class DownloadsServiceImpl implements DownloadsService {
    @Autowired
    private DownloadsMapper downloadsMapper;


    /**
     * 添加下载量
     * @param did
     */
    @Override
    public void addDownloans(Integer did) {

        Downloads downloads = downloadsMapper.selectByPrimaryKey(did);
        if(downloads == null){
            downloads = new Downloads(did,1);
            downloadsMapper.insert(downloads);
        }else{
            downloads.setCount(downloads.getCount()+1);
            downloadsMapper.updateByPrimaryKey(downloads);
        }

    }

    /**
     * 根据主键查询下载量
     * @param did
     * @return
     */
    @Override
    public Downloads selectDownloans(Integer did) {

        Downloads downloads = downloadsMapper.selectByPrimaryKey(did);
        System.out.println(downloads);
        return downloads;

    }
}
