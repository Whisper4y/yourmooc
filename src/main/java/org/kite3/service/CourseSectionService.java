package org.kite3.service;

import java.util.List;

import org.kite3.entity.CourseSection;

public interface CourseSectionService {

	/**
	 * 根据id获取
	 **/
	public CourseSection getById(int id);

	/**
	 * 获取所有
	 **/
	public List<CourseSection> queryAll(CourseSection queryEntity);

}
