package org.kite3.dao;

import java.util.List;

import org.kite3.entity.CourseComment;
import org.kite3.page.TailPage;

public interface CourseCommentDao {

	/**
	 * 根据id获取
	 **/
	public CourseComment getById(int id);

	/**
	 * 获取所有
	 **/
	public List<CourseComment> queryAll(CourseComment queryEntity);

	/**
	 * 获取总数量
	 **/
	public int getTotalItemsCount(CourseComment queryEntity);

	/**
	 * 分页获取
	 **/
	public List<CourseComment> queryPage(CourseComment queryEntity, TailPage<CourseComment> page);

	/**
	 * 创建新记录
	 **/
	public void create(CourseComment entity);

	/**
	 * 创建新记录
	 */
	public void createSelectivity(CourseComment entity);

}
