package com.training.action;

import com.training.model.Comment;
import com.training.service.impl.CommentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    CommentServiceImpl commentService;

    @RequestMapping("/add")
    public String add(Comment comment){
        commentService.addComment(comment);
        return "success!";
    }

    @RequestMapping("/delete")
    public String delete(long id){
        commentService.deleteComment(id);
        return "success!";
    }
    @RequestMapping("select")
    public Comment select(long source_id){
        return commentService.getCommentBySource(source_id);
    }
}
