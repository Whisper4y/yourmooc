package org.kite3.entity;

public class UserCollections {

	/**
	 * id
	 */
	private Integer id;

	/**
	 * 用户id
	 **/
	private Integer userId;

	/**
	 * 用户收藏id
	 */
	private Integer courseId;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getCourseId() {
		return courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

}
