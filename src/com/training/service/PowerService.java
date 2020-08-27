package com.training.service;

import com.training.model.PageInfo;
import com.training.model.Power;

import java.util.List;

public interface PowerService {
    void add(Power power);

    void delete(long id);

    void update(Power power);

    PageInfo<Power> listPowerByPage(Integer currentPage, Integer pageSize);
}
