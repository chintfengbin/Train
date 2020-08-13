package com.training.service.impl;

import com.training.mapper.SourceMapper;
import com.training.model.Source;
import com.training.service.SourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SourceServiceImpl implements SourceService {
    @Autowired
    SourceMapper sourceMapper;
    @Override
    public void add(Source source) {
        sourceMapper.add(source);
    }

    @Override
    public List<Source> list() {
        return sourceMapper.list();
    }
}
