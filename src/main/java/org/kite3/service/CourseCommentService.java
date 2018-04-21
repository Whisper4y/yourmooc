package org.kite3.service;

import java.util.List;

import org.kite3.entity.CourseComment;
import org.kite3.page.TailPage;

public interface CourseCommentService {

    /**
     * 根据id获取
     **/
    CourseComment getById(int id);

    /**
     * 获取所有
     **/
    List<CourseComment> queryAll(CourseComment queryEntity);

    /**
     * 分页获取
     **/
    TailPage<CourseComment> queryPage(CourseComment queryEntity, TailPage<CourseComment> page);

    /**
     * 创建
     **/
    void create(CourseComment entity);

    /**
     * 创建
     */
    void createSelectivity(CourseComment entity);

}
