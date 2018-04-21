package org.kite3.service;

import java.util.List;

import org.kite3.entity.CourseClassify;

public interface CourseClassifyService {

    /**
     * 根据id获取
     **/
    CourseClassify getById(int id);

    /**
     * 根据code获取
     */
    CourseClassify getByCode(String code);

    /**
     * 获取所有
     **/
    List<CourseClassify> queryAll();

    /**
     * 根据条件动态获取
     **/
    List<CourseClassify> queryByCondition(CourseClassify queryEntity);

}
