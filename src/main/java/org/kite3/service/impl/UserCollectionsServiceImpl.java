package org.kite3.service.impl;

import java.util.List;

import org.kite3.dao.UserCollectionsDao;
import org.kite3.entity.UserCollections;
import org.kite3.page.TailPage;
import org.kite3.service.UserCollectionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserCollectionsServiceImpl implements UserCollectionsService {

	@Autowired
	private UserCollectionsDao entityDao;

	/**
	 * 根据id获取
	 **/
	public UserCollections getById(int id) {
		return entityDao.getById(id);
	}

	/**
	 * 获取所有
	 **/
	public List<UserCollections> queryAll(UserCollections queryEntity) {
		return entityDao.queryAll(queryEntity);
	}

	/**
	 * 分页获取
	 **/
	public TailPage<UserCollections> queryPage(UserCollections queryEntity, TailPage<UserCollections> page) {
		int itemsTotalCount = entityDao.getTotalItemsCount(queryEntity);
		List<UserCollections> items = entityDao.queryPage(queryEntity, page);
		page.setItemsTotalCount(itemsTotalCount);
		page.setItems(items);
		return page;
	}

	/**
	 * 删除
	 **/
	public void delete(UserCollections entity) {
		entityDao.delete(entity);
	}

	/**
	 * 创建
	 **/
	public void createSelectivity(UserCollections entity) {
		entityDao.createSelectivity(entity);
	}

}
