package com.training.service.impl;

import com.training.common.utils.SpratePage;
import com.training.mapper.PowerMapper;
import com.training.model.Power;
import com.training.service.PowerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Service
public class PowerServiceImpl implements PowerService {

    @Autowired
    PowerMapper powerMapper;
    @Autowired
    SpratePage<Power> spratePage;

    @Override
    public void add(Power power) {
        powerMapper.add(power);
    }

    @Override
    public void delete(long id) {
        powerMapper.delete(id);
    }

    @Override
    public void update(Power power) {
        powerMapper.update(power);
    }

    @Override
    public List<Power> listPowerByPage(Integer currentPage, Integer pageSize) {
        List<Power> powers = powerMapper.list();
        return spratePage.sparate(currentPage,pageSize,powers);
    }
}
