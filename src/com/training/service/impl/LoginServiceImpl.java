package com.training.service.impl;

import com.training.mapper.LoginMapper;
import com.training.model.Login;
import com.training.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {
    @Autowired
    private LoginMapper loginMapper;
    @Override
    public void add(Login login) {
            loginMapper.add(login);
    }
}
