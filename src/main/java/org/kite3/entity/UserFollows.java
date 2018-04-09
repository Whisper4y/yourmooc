package org.kite3.entity;

public class UserFollows {

	/**
	 * id
	 */
	private Integer id;

	/**
	 * 用户id
	 **/
	private Integer userId;

	/**
	 * 关注的用户id
	 **/
	private Integer followId;

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

	public Integer getFollowId() {
		return followId;
	}

	public void setFollowId(Integer followId) {
		this.followId = followId;
	}

}
