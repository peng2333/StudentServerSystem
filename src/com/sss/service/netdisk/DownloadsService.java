package com.sss.service.netdisk;

import com.sss.bean.Downloads;

public interface DownloadsService {

    /**
     * 添加下载量
     * @param did
     */
    public void addDownloans(Integer did);

    /**
     * 查询下载量
     */
    public Downloads selectDownloans(Integer did);


}
