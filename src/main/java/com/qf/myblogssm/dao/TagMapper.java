package com.qf.myblogssm.dao;

import com.qf.myblogssm.pojo.Tag;
import java.util.List;

public interface TagMapper {
    int insert(Tag record);
    int selectTag();
    List<Tag> selectAll();
}