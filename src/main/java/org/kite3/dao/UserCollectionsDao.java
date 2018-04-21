package org.kite3.dao;

import java.util.List;

import org.kite3.entity.UserCollections;
import org.kite3.page.TailPage;

public interface UserCollectionsDao {

    /**
     * 根据id获取
     **/
    UserCollections getById(int id);

    /**
     * 获取所有
     **/
    List<UserCollections> queryAll(UserCollections queryEntity);

    /**
     * 获取总数量
     **/
    int getTotalItemsCount(UserCollections queryEntity);

    /**
     * 分页获取
     **/
    List<UserCollections> queryPage(UserCollections queryEntity, TailPage<UserCollections> page);

    /**
     * 删除
     **/
    void delete(UserCollections entity);

    /**
     * 创建新记录
     **/
    void createSelectivity(UserCollections entity);

}
