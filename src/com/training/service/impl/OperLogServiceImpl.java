package com.training.service.impl;

import com.training.common.utils.SpratePage;
import com.training.mapper.OperLogMapper;
import com.training.model.OperLog;
import com.training.service.OperLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OperLogServiceImpl implements OperLogService {
    @Autowired
    OperLogMapper operLogMapper;
    @Autowired
    SpratePage<OperLog> spratePage;


    @Override
    public void add(OperLog operLog) {
        operLogMapper.add(operLog);
    }

    @Override
    public void delete(long id) {
        operLogMapper.delete(id);
    }

    @Override
    public void update(OperLog operLog) {
        operLogMapper.update(operLog);
    }

    @Override
    public List<OperLog> listOperLogByPage(Integer currentPage, Integer pageSize) {
        List<OperLog> operLogs=operLogMapper.list();
        return spratePage.sparate(currentPage,pageSize,operLogs);
    }
}
