package com.training.service;

import com.training.model.UserClick;

public interface UserClickService {

    void add(UserClick userClick);

    long vdclicknumb(long source_id);
}
