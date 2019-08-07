package com.qf.myblogssm.service.impl;

import com.qf.myblogssm.dao.CommentMapper;
import com.qf.myblogssm.pojo.Comment;
import com.qf.myblogssm.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceimpl implements CommentService {
    @Autowired
    private CommentMapper commentMapper;
    @Override
    public int selectComment(){//实现文章个数  分类个数   标签个数
        int comment = commentMapper.selectComment();
        return comment;
    }
    public List<Comment> list(int id){//加载评论
        List<Comment> comments = commentMapper.list(id);
        return comments;
    }

    @Override
    public void del(int id) {   //删除评论
        commentMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Comment record) {
        return commentMapper.insert(record);
    }
}
