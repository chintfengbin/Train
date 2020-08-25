package com.training.service.impl;

import com.training.common.utils.SpratePage;
import com.training.mapper.UserSourceMapper;
import com.training.model.UserSource;
import com.training.service.UserSourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserSourceServiceImpl implements UserSourceService {

    @Autowired
    UserSourceMapper userSourceMapper;
    @Autowired
    SpratePage<UserSource> spratePage;

    @Override
    public List<UserSource> list(Integer currentPage, Integer pageSize) {
       List<UserSource> userSources =userSourceMapper.list();
       return  spratePage.sparate(currentPage,pageSize,userSources);
    }

    @Override
    public void deleteBySourceId(long sourceid) {
        userSourceMapper.deleteBySourceId(sourceid);
    }

    @Override
    public void add(UserSource userSource) {
        userSourceMapper.add(userSource);
    }
}
