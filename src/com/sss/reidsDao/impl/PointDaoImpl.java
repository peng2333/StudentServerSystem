package com.sss.reidsDao.impl;

import com.sss.reidsDao.PointDao;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 对点进行存储查询的实现类
 * @author 赵飞
 */
@Repository
public class PointDaoImpl implements PointDao {
    @Resource
    private RedisTemplate redisTemplate;

//    @Override
//    public List<Cluster> getCacheList(String cluster) {
//        String o = redisTemplate.opsForValue().get(cluster).toString();
//        System.out.println(o);
//
//        JSONObject.parseObject(o);
//        return null;
//    }

    /**
     * 缓存基本的对象，Integer、String、实体类等
     * @param key    缓存的键值
     * @param value    缓存的值
     * @return        缓存的对象
     */
    @Override
    public <T> ValueOperations<String,T> setCacheObject(String key, T value)
    {

        ValueOperations<String,T> operation = redisTemplate.opsForValue();
        operation.set(key,value);
        return operation;
    }

    /**
     * 获得缓存的基本对象。
     * @param key        缓存键值
     * @param operation
     * @return            缓存键值对应的数据
     */
    @Override
    public <T> T getCacheObject(String key/*,ValueOperations<String,T> operation*/)
    {
        ValueOperations<String,T> operation = redisTemplate.opsForValue();
        return operation.get(key);
    }

    /**
     * 缓存List数据
     * @param key        缓存的键值
     * @param dataList    待缓存的List数据
     * @return            缓存的对象
     */
    @Override
    public <T> ListOperations<String, T> setCacheList(String key, List<T> dataList)
    {
        ListOperations listOperation = redisTemplate.opsForList();
        if(null != dataList)
        {
            int size = dataList.size();
            for(int i = 0; i < size ; i ++)
            {

                listOperation.rightPush(key,dataList.get(i));
            }
        }


        return listOperation;
    }

    /**
     * 往集合中添加一个元素
     * @param key
     * @param value
     * @param <T>
     * @return
     */
    @Override
    public <T> ListOperations<String, T> addCacheList(String key, T value) {
        ListOperations listOperation = redisTemplate.opsForList();
        listOperation.rightPush(key,value);
        return listOperation;
    }

    /**
     * 获得缓存的list对象
     * @param key    缓存的键值
     * @return        缓存键值对应的数据
     */
    @Override
    public <T> List<T> getCacheList(String key)
    {
        List<T> dataList = new ArrayList<T>();
        ListOperations<String,T> listOperation = redisTemplate.opsForList();
        Long size = listOperation.size(key);

        for(int i = 0 ; i < size ; i ++)
        {
            dataList.add((T) listOperation.leftPop(key));
        }
        return dataList;
    }










//    @Override
//    public List<Object> findAll() {
//        return (List<Object>)this.redisTemplate.opsForList().leftPop(POINT_KEY);
////        String id = "1";
////        Point p = redisTemplate.execute(new RedisCallback<Point>() {
////            @Override
////            public Point doInRedis(RedisConnection redisConnection) throws DataAccessException {
////                byte[] key = redisTemplate.getStringSerializer().serialize("Point_" + id);
////                if (redisConnection.exists(key)) {
////                    byte[] bytes = redisConnection.get(key);
////                    String value = null;
////                    try {
////                        value = new String(bytes,"utf-8");
////                    } catch (UnsupportedEncodingException e) {
////                        e.printStackTrace();
////                    }
////                    JSONObject jsonObject = JSONObject.parseObject(value);
////                    Point point = jsonObject.toJavaObject(Point.class);
////                    return point;
////                }
////                return null;
////            }
////        });
////        System.out.println(p);
//    }
//
//    /**
//     * 存储一个点
//     * @author 赵飞
//     */
//    @Override
//    public void setPoint(Point point) {
//        System.out.println("开始");
//        this.redisTemplate.opsForList().rightPush("Points",point);
//        this.redisTemplate.opsForList().rightPush("Points",point);
//        this.redisTemplate.opsForList().rightPush("Points",point);
//        this.redisTemplate.opsForList().rightPush("Points",point);
//
//        //        this.redisTemplate.opsForList().set(POINT_KEY,point.getId(),point);
////        redisTemplate.execute(new RedisCallback<Object>() {
////            @Override
////            public Object doInRedis(RedisConnection redisConnection) throws DataAccessException {
////                redisConnection.set(redisTemplate.getStringSerializer().serialize("Point_"+id),
////                        redisTemplate.getStringSerializer().serialize(s));
////                return null;
////            }
////        });
////        redisTemplate.opsForValue().set("Point_1","zhangsan");
//        System.out.println("结束");
//    }
}
