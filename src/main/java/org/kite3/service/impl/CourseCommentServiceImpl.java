package org.kite3.service.impl;

import java.util.List;

import org.kite3.dao.CourseCommentDao;
import org.kite3.entity.CourseComment;
import org.kite3.page.TailPage;
import org.kite3.service.CourseCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CourseCommentServiceImpl implements CourseCommentService {

	@Autowired
	private CourseCommentDao courseCommentDao;

	@Override
	public CourseComment getById(int id) {
		return courseCommentDao.getById(id);
	}

	@Override
	public List<CourseComment> queryAll(CourseComment queryEntity) {
		return courseCommentDao.queryAll(queryEntity);
	}

	@Override
	public TailPage<CourseComment> queryPage(CourseComment queryEntity, TailPage<CourseComment> page) {
		int itemsTotalCount = courseCommentDao.getTotalItemsCount(queryEntity);
		List<CourseComment> items = courseCommentDao.queryPage(queryEntity, page);
		page.setItemsTotalCount(itemsTotalCount);
		page.setItems(items);
		return page;
	}

	@Override
	public void create(CourseComment entity) {
		courseCommentDao.create(entity);
	}

	/**
	 * 创建
	 */
	public void createSelectivity(CourseComment entity) {
		courseCommentDao.createSelectivity(entity);
	}

}
