package org.kite3.dao;

import java.util.List;

import org.kite3.entity.CourseSection;

public interface CourseSectionDao {

    /**
     * 根据id获取
     **/
    public CourseSection getById(int id);

    /**
     * 获取所有
     **/
    public List<CourseSection> queryAll(CourseSection queryEntity);

    /**
     * 获取总数量
     **/
    public int getTotalItemsCount(CourseSection queryEntity);

}
