package com.training.service;

import com.training.model.Power;

import java.util.List;

public interface PowerService {
    void add(Power power);

    void delete(long id);

    void update(Power power);

    List<Power> listPowerByPage(Integer currentPage, Integer pageSize);
}
