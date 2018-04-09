package org.kite3.business;

import java.util.List;
import java.util.Map;

import org.kite3.dto.CourseClassifyDto;

public interface IndexBusiness {

	/**
	 * 获取所有分类
	 */
	Map<String, CourseClassifyDto> queryAllClassifyMap();

	/**
	 * 获取所有，包括一级分类&二级分类
	 */
	List<CourseClassifyDto> queryAllClassify();

	/**
	 * 为分类设置课程推荐
	 */
	void prepareRecomdCourses(List<CourseClassifyDto> classifyDtoList);

}
