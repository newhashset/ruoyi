package com.sc.mapper;

import com.sc.pojo.OFeedback;

public interface OFeedbackMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OFeedback record);

    int insertSelective(OFeedback record);

    OFeedback selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OFeedback record);

    int updateByPrimaryKey(OFeedback record);
}