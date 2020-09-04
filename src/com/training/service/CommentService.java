package com.training.service;

import com.training.model.Comment;
import com.training.model.PageInfo;

import java.util.List;

public interface CommentService {

    void addComment(Comment comment);

    void deleteComment(long id);

    List<Comment> getCommentBySource(long source_id);

    PageInfo<Comment> listCommentByPage(Integer currentPage, Integer pageSize, long source_id);

    PageInfo<Comment> listAll(Integer currentPage, Integer pageSize, long condition);
}
