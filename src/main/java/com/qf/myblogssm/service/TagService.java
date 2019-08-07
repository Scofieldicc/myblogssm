package com.qf.myblogssm.service;

import com.qf.myblogssm.pojo.Article;
import com.qf.myblogssm.pojo.Tag;

import java.util.List;
import java.util.Map;

public interface TagService {
    int selectTag();

    List<Tag> selectAll();

    Map<String, List<Article>> TagMap();
}
