package com.dmall.dcms.dao.mapper;

import com.dmall.dcms.dao.model.DecorationPageSchedule;

public interface DecorationPageScheduleMapper {
    int deleteByPrimaryKey(Long id);

    int insert(DecorationPageSchedule record);

    int insertSelective(DecorationPageSchedule record);

    DecorationPageSchedule selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(DecorationPageSchedule record);

    int updateByPrimaryKey(DecorationPageSchedule record);
}