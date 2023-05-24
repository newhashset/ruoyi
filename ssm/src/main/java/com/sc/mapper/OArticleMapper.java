package com.sc.mapper;

import com.sc.pojo.OArticle;

public interface OArticleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OArticle record);

    int insertSelective(OArticle record);

    OArticle selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OArticle record);

    int updateByPrimaryKey(OArticle record);
}