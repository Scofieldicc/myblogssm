package com.qf.myblogssm.service;

import com.qf.myblogssm.pojo.Comment;

import java.util.List;

public interface CommentService {
    int selectComment();
    //加载评论
    List<Comment> list(int Id);
//删除评论
    void del(int id);

    int insert(Comment record);
}
