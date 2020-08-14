package com.training.mapper;

import com.training.model.UserClick;

public interface UserClickMapper {
    long vdclicknumb(long source_id);

    void add(UserClick userClick);
}
