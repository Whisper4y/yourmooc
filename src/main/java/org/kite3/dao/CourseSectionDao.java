package org.kite3.dao;

import java.util.List;

import org.kite3.entity.CourseSection;

public interface CourseSectionDao {

    /**
     * 根据id获取
     **/
    CourseSection getById(int id);

    /**
     * 获取所有
     **/
    List<CourseSection> queryAll(CourseSection queryEntity);

    /**
     * 获取总数量
     **/
    int getTotalItemsCount(CourseSection queryEntity);

}
