package com.sss.service.indexViews;

import com.sss.bean.VisitView;

import java.util.List;

/**
 * Created by XiongTianCi on 2018/7/2
 *
 * @author tianci
 */
public interface IndexViewsService {
    void addVisit(String path);

    List<VisitView> findAllWithVisit();

    void resetDatabase();

    void addIp(String ip);
}
