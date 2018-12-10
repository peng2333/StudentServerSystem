package com.sss.mapper.netdisk;


import com.sss.bean.Downloads;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

public interface DownloadsMapper extends Mapper<Downloads> {

    @Select("select * from downloads where did = #{shareId}")
    public Downloads findById(@Param("shareId")Integer shareId);

}
