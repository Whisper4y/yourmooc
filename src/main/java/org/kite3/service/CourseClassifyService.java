package org.kite3.service;

import java.util.List;

import org.kite3.entity.CourseClassify;

public interface CourseClassifyService {

	/**
	 * 根据id获取
	 **/
	public CourseClassify getById(int id);

	/**
	 * 根据code获取
	 */
	public CourseClassify getByCode(String code);

	/**
	 * 获取所有
	 **/
	public List<CourseClassify> queryAll();

	/**
	 * 根据条件动态获取
	 **/
	public List<CourseClassify> queryByCondition(CourseClassify queryEntity);

}
