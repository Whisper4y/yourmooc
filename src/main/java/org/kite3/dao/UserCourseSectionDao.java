package org.kite3.dao;

import java.util.List;

import org.kite3.dto.UserCourseSectionDto;
import org.kite3.entity.UserCourseSection;
import org.kite3.page.TailPage;

public interface UserCourseSectionDao {

    /**
     * 根据id获取
     **/
    public UserCourseSection getById(int id);

    /**
     * 根据user_id获取
     */
    public List<UserCourseSection> queryByUserId(int id);

    /**
     * 获取所有
     **/
    public List<UserCourseSection> queryAll(UserCourseSection queryEntity);

    /**
     * 获取最新的学习记录
     */
    public UserCourseSection queryLatest(UserCourseSection queryEntity);

    /**
     * 获取总数量
     **/
    public int getTotalItemsCount(UserCourseSection queryEntity);

    /**
     * 分页获取
     **/
    public List<UserCourseSectionDto> queryPage(UserCourseSection queryEntity, TailPage<UserCourseSectionDto> page);

    /**
     * 创建新记录
     **/
    public void createSelectivity(UserCourseSection entity);

    /**
     * 根据id更新
     **/
    public void update(UserCourseSection entity);

}
