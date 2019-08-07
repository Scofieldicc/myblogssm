package com.qf.myblogssm.controller;

import com.qf.myblogssm.pojo.Article;
import com.qf.myblogssm.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/tags")
public class TagController {
    @Autowired
    private TagService tagService;
    @RequestMapping("/getTagInfo")
    public String getTagInfo(Model model){//标签跳转
        Map<String, List<Article>> map = tagService.TagMap();
        model.addAttribute("tag_map",map);
        return "tags";
    }
}
