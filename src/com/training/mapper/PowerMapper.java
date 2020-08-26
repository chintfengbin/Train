package com.training.mapper;

import com.training.model.Power;

import java.util.List;

public interface PowerMapper {
    void add(Power power);

    void delete(long id);

    void update(Power power);

    List<Power> list();
}
