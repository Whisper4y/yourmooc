package org.kite3.service;

import java.util.List;

import org.kite3.dto.UserCourseSectionDto;
import org.kite3.entity.UserCourseSection;
import org.kite3.page.TailPage;

public interface UserCourseSectionService {

    /**
     * 根据id获取
     **/
    UserCourseSection getById(int id);

    /**
     * 根据user_id获取
     */
    List<UserCourseSection> queryByUserId(int id);

    /**
     * 获取所有
     **/
    List<UserCourseSection> queryAll(UserCourseSection queryEntity);

    /**
     * 获取最新的
     */
    UserCourseSection queryLatest(UserCourseSection queryEntity);

    /**
     * 分页获取
     **/
    TailPage<UserCourseSectionDto> queryPage(UserCourseSection queryEntity, TailPage<UserCourseSectionDto> page);

    /**
     * 创建
     **/
    void createSelectivity(UserCourseSection entity);

    /**
     * 根据id更新
     **/
    void update(UserCourseSection entity);

}
