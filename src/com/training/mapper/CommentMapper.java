package com.training.mapper;

import com.training.model.Comment;

import java.util.List;

public interface CommentMapper {

    void addComment(Comment comment);

    void deleteComment(long id);

    List<Comment> getCommentBySource(long source_id);
}
