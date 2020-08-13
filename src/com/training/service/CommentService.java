package com.training.service;

import com.training.model.Comment;

public interface CommentService {

    void addComment(Comment comment);

    void deleteComment(long id);

    Comment getCommentBySource(long source_id);
}
