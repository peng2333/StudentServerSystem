package com.sss.reidsDao;

import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.ValueOperations;

import java.util.List;

/**
 * 专门对Kmeans进行各种操作的类接口
 * @author 赵飞
 */
public interface PointDao {
//    List<Cluster> getCacheList(String cluster);

    <T> ValueOperations<String,T> setCacheObject(String key, T value);
    <T> T getCacheObject(String key/*,ValueOperations<String,T> operation*/);
    <T> ListOperations<String, T> setCacheList(String key, List<T> dataList);
    <T> ListOperations<String, T> addCacheList(String key, T value);


    <T> List<T> getCacheList(String key);
}
