package com.training.service;

import com.training.model.OperLog;
import com.training.model.PageInfo;

import java.util.List;

public interface OperLogService {
    void add(OperLog operLog);

    void delete(long id);

    void update(OperLog operLog);

    PageInfo<OperLog> listOperLogByPage(Integer currentPage, Integer pageSize);
}
