package org.kite3.service;

import java.util.List;

import org.kite3.dto.UserCourseSectionDto;
import org.kite3.entity.UserCourseSection;
import org.kite3.page.TailPage;

public interface UserCourseSectionService {

    /**
     * 根据id获取
     **/
    public UserCourseSection getById(int id);

    /**
     * 获取所有
     **/
    public List<UserCourseSection> queryAll(UserCourseSection queryEntity);

    /**
     * 获取最新的
     */
    public UserCourseSection queryLatest(UserCourseSection queryEntity);

    /**
     * 分页获取
     **/
    public TailPage<UserCourseSectionDto> queryPage(UserCourseSection queryEntity, TailPage<UserCourseSectionDto> page);

    /**
     * 创建
     **/
    public void createSelectivity(UserCourseSection entity);

    /**
     * 根据id更新
     **/
    public void update(UserCourseSection entity);

}
