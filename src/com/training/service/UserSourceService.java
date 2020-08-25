package com.training.service;

import com.training.model.UserSource;

import java.util.List;

public interface UserSourceService {
    List<UserSource> list(Integer currentPage, Integer pageSize);

    void deleteBySourceId(long sourceid);

    void add(UserSource userSource);
}
