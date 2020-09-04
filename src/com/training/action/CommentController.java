package com.training.action;

import com.training.model.Comment;
import com.training.model.PageInfo;
import com.training.service.impl.CommentServiceImpl;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    CommentServiceImpl commentService;

    @RequestMapping("/add")
    @ResponseBody
    public String add(Comment comment,HttpServletResponse response){
        cross(response);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        comment.setCmtime(sdf.format(new Date()));
        commentService.addComment(comment);
        return "success!";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(long id,HttpServletResponse response){
        cross(response);
        commentService.deleteComment(id);
        return "success!";
    }
    @RequestMapping("/select")
    @ResponseBody
    public List<Comment> select(long source_id,HttpServletResponse response){
        cross(response);
        return commentService.getCommentBySource(source_id);
    }

    @RequestMapping("/listCommentByPage")
    @ResponseBody
    public PageInfo<Comment> list(Integer currentPage, Integer pageSize, long source_id, HttpServletResponse response){
        cross(response);
        PageInfo<Comment> comments= commentService.listCommentByPage(currentPage,pageSize,source_id);
        return comments;
    }

    @RequestMapping("/listAll")
    @ResponseBody
    public PageInfo<Comment> listAll(Integer currentPage, Integer pageSize,long condition){
        PageInfo<Comment> comments = commentService.listAll(currentPage,pageSize,condition);
        return comments;
    }

    public void cross(HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Credentials", "true");
    }
}
