package com.qf.myblogssm.service.impl;

import com.qf.myblogssm.dao.ArticleMapper;
import com.qf.myblogssm.pojo.Article;
import com.qf.myblogssm.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ArticleServiceimpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;
    @Override
    public List<Article> selectAll() {
        //还有业务逻辑没有写
        List<Article> articles = articleMapper.selectAll();
        //处理文章
        for(Article article : articles){
            //判断文章的内容是否大于30
             if(article.getContent().length()>30){
//                String content = article.getContent();
//                //对字符串进行剪切    subString参数   表示取前不取后
//                String substring = content.substring(0, 30)+"......";
                article.setContent(article.getContent().substring(0,30)+"......");
            }
        }
        return articles;
    }
    public int selectArticle(){//实现文章个数  分类个数   标签个数
        int article = articleMapper.selectArticle();
        return article;
    }

    @Override
    public Map<String, Integer> getSortAndCoust() {
        //在article类中添加一个分类数量的属性  通过实体类将数据返回到service中
        //然后遍历list集合，将需要的数据添加到对应的map集合中
       List<Article> articleList = articleMapper.selectSortAndCount();

       Map<String,Integer> maps = new HashMap<>();
        for (Article article : articleList) {
            maps.put(article.getSort(),article.getCountsort());
        }
        return maps;
    }

    @Override
    public Article selectById(Integer id) {
        Article article = articleMapper.selectByPrimaryKey(id);
        return article;
    }
//执行增删改操作时 要在服务层添加事物
    @Transactional
    @Override
    public void star(Integer id) {
        //如果你想在服务层捕获异常，并且进行事物的回滚  必须抛出运行时异常
        articleMapper.updataStar(id);
    }

    @Override
    public Map<String, List<Article>> SortMap() {//分类跳转
        List<Article> articles = articleMapper.selectAll();
        Map<String,List<Article>> map = new HashMap<>();
        for (Article article : articles) {
            if(map.containsKey(article.getSort())){
                map.get(article.getSort()).add(article);
            }else{
                List<Article>list = new ArrayList<>();
                list.add(article);
                map.put(article.getSort(),list);
            }
        }
        return map;
    }
}
