package org.kite3.entity;

import java.util.Date;

/**
 * 课程评论
 */
public class CourseComment {

	/**
	 * 评论id
	 */
	private Integer id;

	/**
	 * 用户username
	 **/
	private String username;

	/**
	 * 评论对象username
	 **/
	private String toUsername;

	/**
	 * 课程id
	 **/
	private Integer courseId;

	/**
	 * 章节id
	 **/
	private Integer sectionId;

	/**
	 * 章节标题
	 **/
	private String sectionTitle;

	/**
	 * 评论内容
	 **/
	private String content;

	/**
	 * 创建时间
	 */
	private Date createTime;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getToUsername() {
		return toUsername;
	}

	public void setToUsername(String toUsername) {
		this.toUsername = toUsername;
	}

	public Integer getCourseId() {
		return courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	public Integer getSectionId() {
		return sectionId;
	}

	public void setSectionId(Integer sectionId) {
		this.sectionId = sectionId;
	}

	public String getSectionTitle() {
		return sectionTitle;
	}

	public void setSectionTitle(String sectionTitle) {
		this.sectionTitle = sectionTitle;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}
