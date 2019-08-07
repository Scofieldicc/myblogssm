package com.qf.myblogssm.controller;

import com.qf.myblogssm.pojo.Article;
import com.qf.myblogssm.pojo.Comment;
import com.qf.myblogssm.service.ArticleService;
import com.qf.myblogssm.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/articles")
public class ArticleController {
    @Autowired
    private ArticleService articleService;
    @Autowired
    private CommentService commentService;

    //需要一个函数  获取到当前点击的文章  放在共享域中 返回article.jsp
    @RequestMapping("/getById")
    public String selectById(Integer id, Model model){
        Article article = articleService.selectById(id);
        model.addAttribute("article",article);
//加载评论
        List<Comment> commentList = commentService.list(id);
        model.addAttribute("comment",commentList);

        return "article";
    }
    //通过异步的方式实现点赞
    //通过点击点赞按钮，发送异步请求
    //接受请求后
    //通过文章的id确定点赞的文章 然后去数据库中将文章的点赞次数+1
    //返回一个点赞次数给前端

    //http://localhost:8080/myblogssm/articles/star?id=10
    //如果是ajax请求  返回值放在请求ajax对象中
    @RequestMapping("/star")
    @ResponseBody  //将数据转换为json格式
    public Article star(Integer id){
        //这里需要处理
        try {
            articleService.star(id);
            Article article = articleService.selectById(id);
//            Message msg = new Message();
//            msg.setObject(article);
//            msg.setEcode("200");
            return article;
        }catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    //分类跳转
    @RequestMapping("/getSortInfo")
    public String getSortInfo(Model model){
        Map<String,List<Article>> map = articleService.SortMap();
        model.addAttribute("sort_article_map",map);
        return "sort";
    }



}
