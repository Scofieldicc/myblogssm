package com.qf.myblogssm.controller;

import com.qf.myblogssm.pojo.Comment;
import com.qf.myblogssm.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;
    //删除评论
    @RequestMapping("/delete")
    @ResponseBody
    public void del(int id){
        commentService.del(id);
    }
    //添加评论
    @RequestMapping("/insert/{id}")
    @ResponseBody
    public int insert( Integer articleId , String nickname, String content){

        Comment comm = new Comment();
        comm.setArticleId(articleId);
        comm.setNickname(nickname);
        comm.setContent(content);
        return commentService.insert(comm);
    }
}
