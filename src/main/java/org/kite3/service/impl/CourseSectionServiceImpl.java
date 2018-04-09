package org.kite3.service.impl;

import java.util.List;

import org.kite3.dao.CourseSectionDao;
import org.kite3.entity.CourseSection;
import org.kite3.service.CourseSectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CourseSectionServiceImpl implements CourseSectionService {

	@Autowired
	private CourseSectionDao courseSectionDao;

	public CourseSection getById(int id) {
		return courseSectionDao.getById(id);
	}

	public List<CourseSection> queryAll(CourseSection queryEntity) {
		return courseSectionDao.queryAll(queryEntity);
	}

}
