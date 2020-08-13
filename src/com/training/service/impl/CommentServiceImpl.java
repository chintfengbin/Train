package com.training.service.impl;

import com.training.mapper.CommentMapper;
import com.training.model.Comment;
import com.training.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements CommentService {


    @Autowired
    CommentMapper commentMapper;
    @Override
    public void addComment(Comment comment) {
        commentMapper.addComment(comment);
    }

    @Override
    public void deleteComment(long id) {
        commentMapper.deleteComment(id);
    }

    @Override
    public Comment getCommentBySource(long source_id) {
        return commentMapper.getCommentBySource(source_id);
    }
}
