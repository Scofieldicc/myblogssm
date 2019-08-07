package com.qf.myblogssm.service.impl;

import com.qf.myblogssm.dao.ArticleMapper;
import com.qf.myblogssm.dao.TagMapper;
import com.qf.myblogssm.pojo.Article;
import com.qf.myblogssm.pojo.Tag;
import com.qf.myblogssm.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TagServiceimpl implements TagService {
    @Autowired
    private TagMapper tagMapper;
    @Autowired
    private ArticleMapper articleMapper;
    @Override
    public int selectTag(){//实现文章个数  分类个数  标签个数
        int tag = tagMapper.selectTag();
        return tag;
    }
    public List<Tag> selectAll(){
        List<Tag> tags = tagMapper.selectAll();
        return tags;
    }

    @Override
    public Map<String, List<Article>> TagMap() {
        List<Tag> tagList = tagMapper.selectAll();
        Map<String,List<Article>> map = new HashMap<>();
        for (Tag tag : tagList) {
            Article article = articleMapper.selectByPrimaryKey(tag.getId());
            System.out.println(article);
            if (map.containsKey(tag.getTag())){
                map.get(tag.getTag()).add(article);
            }else{
                List<Article> list = new ArrayList<>();
                list.add(article);
                map.put(tag.getTag(),list);
            }
        }
        return map;
    }
}
