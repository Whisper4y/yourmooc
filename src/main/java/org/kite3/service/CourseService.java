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
    public Course getById(int id);

    /**
     * 获取所有
     **/
    public List<Course> queryList(CourseQueryDto queryEntity);

    /**
     * 分页获取
     **/
    public TailPage<Course> queryPage(Course queryEntity, TailPage<Course> page);

    /**
     * 记录学习人数
     */
    public void updateStudyCount(Course queryEntity);

}
