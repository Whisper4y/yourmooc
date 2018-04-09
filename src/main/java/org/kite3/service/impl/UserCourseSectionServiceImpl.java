package org.kite3.service.impl;

import java.util.List;

import org.kite3.dao.UserCourseSectionDao;
import org.kite3.dto.UserCourseSectionDto;
import org.kite3.entity.UserCourseSection;
import org.kite3.page.TailPage;
import org.kite3.service.UserCourseSectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserCourseSectionServiceImpl implements UserCourseSectionService {

	@Autowired
	private UserCourseSectionDao entityDao;

	public UserCourseSection getById(int id) {
		return entityDao.getById(id);
	}

	public List<UserCourseSection> queryAll(UserCourseSection queryEntity) {
		return entityDao.queryAll(queryEntity);
	}

	public UserCourseSection queryLatest(UserCourseSection queryEntity) {
		return entityDao.queryLatest(queryEntity);
	}

	public TailPage<UserCourseSectionDto> queryPage(UserCourseSection queryEntity,
			TailPage<UserCourseSectionDto> page) {
		Integer itemsTotalCount = entityDao.getTotalItemsCount(queryEntity);
		List<UserCourseSectionDto> items = entityDao.queryPage(queryEntity, page);
		page.setItemsTotalCount(itemsTotalCount);
		page.setItems(items);
		return page;
	}

	public void createSelectivity(UserCourseSection entity) {
		entityDao.createSelectivity(entity);
	}

	public void update(UserCourseSection entity) {
		entityDao.update(entity);
	}

}
