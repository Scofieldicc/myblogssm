package com.qf.myblogssm.service;

import com.qf.myblogssm.pojo.Article;

import java.util.List;
import java.util.Map;

/*
*文章的服务层接口
 */
public interface ArticleService {
    /*
    *获取所有文章
    * @return
     */
    List<Article> selectAll();


    int selectArticle();
/*
*获取文章的分类以及个数
 */
    Map<String, Integer> getSortAndCoust();

    /**
     * 通过id获取到文章
     * @param id
     * @return
     */
    Article selectById(Integer id);

    /**
     * 增加点赞次数
     * @param id
     */
    void star(Integer id);

    /**
     * 分类
     * @return
     */
    Map<String, List<Article>> SortMap();

}
