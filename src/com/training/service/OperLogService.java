package com.training.service;

import com.training.model.OperLog;

import java.util.List;

public interface OperLogService {
    void add(OperLog operLog);

    void delete(long id);

    void update(OperLog operLog);

    List<OperLog> listOperLogByPage(Integer currentPage,Integer pageSize);
}
