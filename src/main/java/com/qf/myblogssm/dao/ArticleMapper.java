package com.qf.myblogssm.dao;

import com.qf.myblogssm.pojo.Article;
import java.util.List;

public interface ArticleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Article record);

    Article selectByPrimaryKey(Integer id);

    List<Article> selectAll();

    int updateByPrimaryKey(Article record);


    int selectArticle();

    /**
     * 获取文章的分类及个数
     * @return
     */
    List<Article> selectSortAndCount();

    /**
     * 增加点赞次数
     * @param id
     */
    void updataStar(Integer id);

}
