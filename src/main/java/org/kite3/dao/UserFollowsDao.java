package org.kite3.dao;

import java.util.List;

import org.kite3.entity.UserFollows;
import org.kite3.page.TailPage;

public interface UserFollowsDao {

    /**
     * 根据id获取
     **/
    UserFollows getById(int id);

    /**
     * 获取所有
     **/
    List<UserFollows> queryAll(UserFollows queryEntity);

    /**
     * 获取总数量
     **/
    int getTotalItemsCount(UserFollows queryEntity);

    /**
     * 分页获取
     **/
    List<UserFollows> queryPage(UserFollows queryEntity, TailPage<UserFollows> page);

    /**
     * 删除
     **/
    void delete(UserFollows entity);

    /**
     * 创建新记录
     **/
    void createSelectivity(UserFollows entity);

}
