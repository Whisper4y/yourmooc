package org.kite3.service;

import java.util.List;

import org.kite3.dto.CourseQueryDto;
import org.kite3.entity.Course;
import org.kite3.page.TailPage;

/**
 * 课程服务层
 */
public interface CourseService {

    /**
     * 根据id获取
     **/
    Course getById(int id);

    /**
     * 获取所有
     **/
    List<Course> queryList(CourseQueryDto queryEntity);

    /**
     * 分页获取
     **/
    TailPage<Course> queryPage(Course queryEntity, TailPage<Course> page);

    /**
     * 记录学习人数
     */
    void updateStudyCount(Course queryEntity);

}
