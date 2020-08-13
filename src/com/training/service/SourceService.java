package com.training.service;

import com.training.model.Source;

import java.util.List;

public interface SourceService {
     List<Source> list();

    void add(Source source);
}
