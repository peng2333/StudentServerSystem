package com.sss.mapper.netdisk;

import com.sss.bean.Share;
import com.sss.bean.ShareItem;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.context.event.EventListener;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * Created by ZhangJun on 2018/6/13.
 */
public interface ShareItemMapper extends Mapper<ShareItem> {

    @Insert("insert into share_item(share_id,path) values(#{share_id},#{path})")
    void insertShareItem(ShareItem shareItem);

    @Select("select * from share_item where share_id=#{id}")
    List<ShareItem> getItem(@Param("id") int shareId);

    @Select("select * from share_item where item_id=#{id}")
    ShareItem getItemById(@Param("id")int id);

    @Delete("delete from share_item where item_id=#{id}")
    void deleteItem(@Param("id")int id);
}
