package com.sss.service.netdisk.impl;

import com.sss.bean.Downloads;
import com.sss.bean.Share;
import com.sss.bean.ShareItem;
import com.sss.mapper.netdisk.DownloadsMapper;
import com.sss.mapper.netdisk.ShareItemMapper;
import com.sss.mapper.netdisk.ShareMapper;
import com.sss.service.netdisk.IShareService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by ZhangJun on 2018/6/7.
 */
@Service
@Transactional
public class ShareServiceImpl implements IShareService {

    @Autowired
    ShareMapper shareMapper;

    @Autowired
    ShareItemMapper shareItemMapper;

    @Autowired
    DownloadsMapper downloadsMapper;

//    @Override
//    public List<Share> getShare(int userId) {
//        Example example = new Example(Share.class);
//
//        Example.Criteria criteria = example.createCriteria();
//
//        criteria.andEqualTo("user_id", userId);
//
//        List<Share> shares = shareMapper.selectByExample(example);
//        return shares;
//    }

    @Override
    public List<Share> getSharePublic() {
      /*  Example example = new Example(Share.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("type", 1);*/
        List<Share> allShare = shareMapper.findAllShare();
        for(Share share:allShare){
            System.out.println(share.getDownloads());
        }
        return shareMapper.findAllShare();
    }

    @Override
    public List<Share> getSharePrivate(int userId) {
        return shareMapper.selectAllPrivate(userId);
    }

    @Override
    public void removeShareAll(List<Integer> shareId) {
        if (shareId != null) {
            for (Integer id : shareId) {
                shareMapper.deleteById(id);
                downloadsMapper.deleteByPrimaryKey(id);
            }
        }
    }

    @Override
    public void removeShareFile(List<Integer> iteamIds) {
        for (Integer itemId : iteamIds) {
            shareItemMapper.deleteItem(itemId);
        }


    }

    @Override
    public void download(Integer[] shareIds) {
        for (int shareId : shareIds){
            Downloads downloads = downloadsMapper.selectByPrimaryKey(shareId);
            downloads.setCount(downloads.getCount()+1);
            downloadsMapper.updateByPrimaryKey(downloads);
        }
    }

    @Override
    public int addShare(String name, int userId, String[] path,int type) {
        Share share=new Share(name,getLastShareId(userId)+1,userId,new SimpleDateFormat("yyyy-MM-dd").format(new Date()),path.length,type);
        shareMapper.insertShare(share);
        int lastShareId = getLastShareId(userId);
        Downloads downloads = new Downloads(getLastShareId(userId)+1,0);
        downloadsMapper.insert(downloads);
        for(String str:path){
            ShareItem shareItem=new ShareItem();
            shareItem.setShare_id(lastShareId);
            shareItem.setPath(str);
            shareItemMapper.insertShareItem(shareItem);
        }
        return getLastShareId(userId);
    }

    @Override
    public int getLastShareId(int userId) {
        Integer i = shareMapper.selectLastShareId(userId);

        System.out.println(i+"       得到的最后索引");

        return i==null?0:i;
    }

    @Override
    public List<ShareItem> getItem(int shareId) {
        return shareItemMapper.getItem(shareId);
    }

    @Override
    public ShareItem getShareItem(int itemId) {
        return shareItemMapper.getItemById(itemId);
    }

    @Override
    public Share getShare(int id) {
        return null;
    }
}
