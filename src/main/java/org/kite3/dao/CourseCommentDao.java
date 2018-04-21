package org.kite3.dao;

import java.util.List;

import org.kite3.entity.CourseComment;
import org.kite3.page.TailPage;

public interface CourseCommentDao {

    /**
     * 根据id获取
     **/
    CourseComment getById(int id);

    /**
     * 获取所有
     **/
    List<CourseComment> queryAll(CourseComment queryEntity);

    /**
     * 获取总数量
     **/
    int getTotalItemsCount(CourseComment queryEntity);

    /**
     * 分页获取
     **/
    List<CourseComment> queryPage(CourseComment queryEntity, TailPage<CourseComment> page);

    /**
     * 创建新记录
     **/
    void create(CourseComment entity);

    /**
     * 创建新记录
     */
    void createSelectivity(CourseComment entity);

}
