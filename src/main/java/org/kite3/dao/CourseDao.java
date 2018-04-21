package org.kite3.dao;

import java.util.List;

import org.kite3.dto.CourseQueryDto;
import org.kite3.entity.Course;
import org.kite3.page.TailPage;

public interface CourseDao {

    /**
     * 根据id获取
     **/
    Course queryById(int id);

    /**
     * 根据条件获取所有， queryEntity：查询条件；
     **/
    List<Course> queryList(CourseQueryDto queryEntity);

    /**
     * 获取总数量
     **/
    Integer getTotalItemsCount(Course queryEntity);

    /**
     * 分页获取
     **/
    List<Course> queryPage(Course queryEntity, TailPage<Course> page);

    /**
     * 记录学习人数
     */
    void updateStudyCount(Course queryEntity);

}
