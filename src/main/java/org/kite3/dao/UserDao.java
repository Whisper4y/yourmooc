package org.kite3.dao;

import java.util.List;

import org.kite3.entity.User;

public interface UserDao {

	/**
	 * 根据id获取
	 **/
	public User getById(int id);

	/**
	 * 根据username获取
	 */
	public User getByUsername(String username);

	/**
	 * 根据username 和 password获取
	 *
	 */
	public User getByUsernameAndPassword(User User);

	/**
	 * 获取首页推荐5个讲师
	 **/
	public List<User> queryRecomd();

	/**
	 * 创建新用户
	 **/
	public void createSelectivity(User user);

	/**
	 * 根据id选择性更新
	 **/
	public void updateSelectivity(User entity);

}
