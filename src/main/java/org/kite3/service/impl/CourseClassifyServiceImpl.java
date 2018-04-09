package org.kite3.service.impl;

import java.util.List;

import org.kite3.dao.CourseClassifyDao;
import org.kite3.entity.CourseClassify;
import org.kite3.service.CourseClassifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

@Service
public class CourseClassifyServiceImpl implements CourseClassifyService {

	@Autowired
	private CourseClassifyDao courseClassifyDao;

	@Override
	public CourseClassify getById(int id) {
		return courseClassifyDao.getById(id);
	}

	@Override
	public CourseClassify getByCode(String code) {
		if (StringUtils.isEmpty(code))
			return null;
		CourseClassify queryEntity = new CourseClassify();
		queryEntity.setCode(code);
		List<CourseClassify> list = courseClassifyDao.queryByCondition(queryEntity);
		if (!CollectionUtils.isEmpty(list))
			return list.get(0);
		return null;
	}

	@Override
	public List<CourseClassify> queryAll() {
		return courseClassifyDao.queryAll();
	}

	@Override
	public List<CourseClassify> queryByCondition(CourseClassify queryEntity) {
		return courseClassifyDao.queryByCondition(queryEntity);
	}

}
