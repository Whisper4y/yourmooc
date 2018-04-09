package org.kite3.dao;

import java.util.List;

import org.kite3.entity.UserCollections;
import org.kite3.page.TailPage;

public interface UserCollectionsDao {

	/**
	 * 根据id获取
	 **/
	public UserCollections getById(int id);

	/**
	 * 获取所有
	 **/
	public List<UserCollections> queryAll(UserCollections queryEntity);

	/**
	 * 获取总数量
	 **/
	public int getTotalItemsCount(UserCollections queryEntity);

	/**
	 * 分页获取
	 **/
	public List<UserCollections> queryPage(UserCollections queryEntity, TailPage<UserCollections> page);

	/**
	 * 删除
	 **/
	public void delete(UserCollections entity);

	/**
	 * 创建新记录
	 **/
	public void createSelectivity(UserCollections entity);

}
