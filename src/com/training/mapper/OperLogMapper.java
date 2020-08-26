package com.training.mapper;

import com.training.model.OperLog;

import java.util.List;

public interface OperLogMapper {
    void add(OperLog operLog);

    void delete(long id);

    void update(OperLog operLog);

    List<OperLog> list();
}
