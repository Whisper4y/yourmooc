package org.kite3.dao;

import java.util.List;

import org.kite3.dto.UserCourseSectionDto;
import org.kite3.entity.UserCourseSection;
import org.kite3.page.TailPage;

public interface UserCourseSectionDao {

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
     * 获取最新的学习记录
     */
    UserCourseSection queryLatest(UserCourseSection queryEntity);

    /**
     * 获取总数量
     **/
    int getTotalItemsCount(UserCourseSection queryEntity);

    /**
     * 分页获取
     **/
    List<UserCourseSectionDto> queryPage(UserCourseSection queryEntity, TailPage<UserCourseSectionDto> page);

    /**
     * 创建新记录
     **/
    void createSelectivity(UserCourseSection entity);

    /**
     * 根据id更新
     **/
    void update(UserCourseSection entity);

}
