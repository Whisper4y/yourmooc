package org.kite3.service.impl;

import java.util.List;

import org.kite3.dao.UserFollowsDao;
import org.kite3.entity.UserFollows;
import org.kite3.page.TailPage;
import org.kite3.service.UserFollowsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserFollowsServiceImpl implements UserFollowsService {

	@Autowired
	private UserFollowsDao entityDao;

	public UserFollows getById(int id) {
		return entityDao.getById(id);
	}

	public List<UserFollows> queryAll(UserFollows queryEntity) {
		return entityDao.queryAll(queryEntity);
	}

	public TailPage<UserFollows> queryPage(UserFollows queryEntity, TailPage<UserFollows> page) {
		int itemsTotalCount = entityDao.getTotalItemsCount(queryEntity);
		List<UserFollows> items = entityDao.queryPage(queryEntity, page);
		page.setItemsTotalCount(itemsTotalCount);
		page.setItems(items);
		return page;
	}

	public void delete(UserFollows entity) {
		entityDao.delete(entity);
	}

	public void createSelectivity(UserFollows entity) {
		entityDao.createSelectivity(entity);
	}

}
