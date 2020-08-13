package com.training.mapper;

import com.training.model.Comment;

public interface CommentMapper {

    void addComment(Comment comment);

    void deleteComment(long id);

    Comment getCommentBySource(long source_id);
}
