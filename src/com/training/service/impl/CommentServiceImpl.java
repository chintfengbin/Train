package com.training.service.impl;

import com.training.common.utils.SpratePage;
import com.training.mapper.CommentMapper;
import com.training.model.Comment;
import com.training.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {


    @Autowired
    CommentMapper commentMapper;
    @Autowired
    SpratePage<Comment> spratePage;
    @Override
    public void addComment(Comment comment) {
        commentMapper.addComment(comment);
    }

    @Override
    public void deleteComment(long id) {
        commentMapper.deleteComment(id);
    }

    @Override
    public List<Comment> getCommentBySource(long source_id) {
        return commentMapper.getCommentBySource(source_id);
    }

    @Override
    public List<Comment> listCommentByPage(Integer currentPage, Integer pageSize,long source_id) {
        List<Comment> comments=commentMapper.getCommentBySource(source_id);
        return spratePage.sparate(currentPage,pageSize,comments);
    }
}
