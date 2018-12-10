package com.sss.mapper.netdisk;

import com.sss.bean.FileDownloads;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface FileDownloadsMapper extends Mapper<FileDownloads> {

    @Select("select * from file_downloads")
    public List<FileDownloads> selectAll();
}
