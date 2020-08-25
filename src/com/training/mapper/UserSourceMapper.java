package com.training.mapper;

import com.training.model.UserSource;

import java.util.List;

public interface UserSourceMapper {
    List<UserSource> list();

    void deleteBySourceId(long sourceid);

    void add(UserSource userSource);
}
