package org.kite3.service.impl;

import java.util.List;

import org.kite3.dao.CourseDao;
import org.kite3.dto.CourseQueryDto;
import org.kite3.entity.Course;
import org.kite3.page.TailPage;
import org.kite3.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

@Service
public class CourseServiceImpl implements CourseService {

	@Autowired
	private CourseDao courseDao;

	@Override
	public Course getById(int id) {
		Course course = courseDao.queryById(id);
		return course;
	}

	@Override
	public List<Course> queryList(CourseQueryDto queryEntity) {
		return courseDao.queryList(queryEntity);
	}

	@Override
	public TailPage<Course> queryPage(Course queryEntity, TailPage<Course> page) {
		Integer itemsTotalCount = courseDao.getTotalItemsCount(queryEntity);
		List<Course> items = courseDao.queryPage(queryEntity, page);
		page.setItemsTotalCount(itemsTotalCount);
		page.setItems(items);
		return page;
	}

	@Override
	public void updateStudyCount(Course queryEntity) {
		courseDao.updateStudyCount(queryEntity);
	}

}
