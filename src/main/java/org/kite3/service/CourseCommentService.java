package org.kite3.service;

import java.util.List;

import org.kite3.entity.CourseComment;
import org.kite3.page.TailPage;

public interface CourseCommentService {

    /**
     * 根据id获取
     **/
    public CourseComment getById(int id);

    /**
     * 获取所有
     **/
    public List<CourseComment> queryAll(CourseComment queryEntity);

    /**
     * 分页获取
     **/
    public TailPage<CourseComment> queryPage(CourseComment queryEntity, TailPage<CourseComment> page);

    /**
     * 创建
     **/
    public void create(CourseComment entity);

    /**
     * 创建
     */
    public void createSelectivity(CourseComment entity);

}
