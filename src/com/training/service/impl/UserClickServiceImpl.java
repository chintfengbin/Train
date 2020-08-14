package com.training.service.impl;

import com.training.mapper.UserClickMapper;
import com.training.model.UserClick;
import com.training.service.UserClickService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserClickServiceImpl implements UserClickService {

    @Autowired
    UserClickMapper userClickMapper;
    @Override
    public void add(UserClick userClick) {
        userClickMapper.add(userClick);
    }

    @Override
    public long vdclicknumb(long source_id) {
        return userClickMapper.vdclicknumb(source_id);
    }
}
