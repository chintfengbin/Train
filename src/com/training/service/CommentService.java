package com.training.service;

import com.training.model.Comment;

import java.util.List;

public interface CommentService {

    void addComment(Comment comment);

    void deleteComment(long id);

    List<Comment> getCommentBySource(long source_id);
}
