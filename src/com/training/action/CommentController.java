package com.training.action;

import com.training.model.Comment;
import com.training.service.impl.CommentServiceImpl;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    CommentServiceImpl commentService;

    @RequestMapping("/add")
    @ResponseBody
    public String add(Comment comment){
        commentService.addComment(comment);
        return "success!";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(long id){
        commentService.deleteComment(id);
        return "success!";
    }
    @RequestMapping("/select")
    public List<Comment> select(long source_id){
        return commentService.getCommentBySource(source_id);
    }

    @RequestMapping("/listCommentByPage")
    @ResponseBody
    public List<Comment> list(Integer currentPage, Integer pageSize,long source_id){
        List<Comment> comments= commentService.listCommentByPage(currentPage,pageSize,source_id);
        return comments;
    }
}
