package org.kite3.service;

import java.util.List;

import org.kite3.entity.UserCollections;
import org.kite3.page.TailPage;

public interface UserCollectionsService {

    /**
     * 根据id获取
     **/
    UserCollections getById(int id);

    /**
     * 获取所有
     **/
    List<UserCollections> queryAll(UserCollections queryEntity);

    /**
     * 分页获取
     **/
    TailPage<UserCollections> queryPage(UserCollections queryEntity, TailPage<UserCollections> page);

    /**
     * 删除
     **/
    void delete(UserCollections entity);

    /**
     * 创建
     **/
    void createSelectivity(UserCollections entity);

}
