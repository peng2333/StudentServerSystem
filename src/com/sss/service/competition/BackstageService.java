package com.sss.service.competition;

import com.sss.bean.Measurement;

import java.util.List;

public interface BackstageService {


    List<Measurement> Alllist();

    Measurement findobj(Integer id);

    void updata(Measurement obj);

    void deleteObj(Integer id);

    List<Measurement> findByCondition(String condition);

    void inssue(Integer id);
}
