package org.kite3.web;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.kite3.entity.User;
import org.kite3.entity.UserFollows;
import org.kite3.service.UserFollowsService;
import org.kite3.service.UserService;
import org.kite3.util.JsonView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 用户关注
 */
@Controller
@RequestMapping("/follow")
public class UserFollowsController {

	@Autowired
	private UserFollowsService userFollowsService;

	@Autowired
	UserService userService;

	@RequestMapping(value = "/doFollow")
	@ResponseBody
	public String doFollow(int followId, HttpServletRequest request) {
		// 获取当前用户id
		String curUserName = (String) request.getSession().getAttribute("username");
		User user = new User();
		user = userService.getByUsername(curUserName);
		int curUserId = user.getId();

		UserFollows userFollows = new UserFollows();
		userFollows.setUserId(curUserId);
		userFollows.setFollowId(followId);
		userFollows.setFollowName(userService.getById(followId).getUsername());
		userFollows.setCreateTime(new Date());

		List<UserFollows> list = userFollowsService.queryAll(userFollows);

		if (!CollectionUtils.isEmpty(list)) {
			userFollowsService.delete(list.get(0));
			return new JsonView(0).toString();  // 取消关注
		} else {
			userFollowsService.createSelectivity(userFollows);
			return new JsonView(1).toString();  // 关注成功
		}
	}

	/**
	 * 是否已经关注
	 */
	@RequestMapping(value = "/isFollow")
	@ResponseBody
	public String isFollow(int followId, HttpServletRequest request) {
		// 获取当前用户id
		String curUserName = (String) request.getSession().getAttribute("username");
		User user = new User();
		user = userService.getByUsername(curUserName);
		int curUserId = user.getId();

		UserFollows userFollows = new UserFollows();
		userFollows.setUserId(curUserId);
		userFollows.setFollowId(followId);

		List<UserFollows> list = userFollowsService.queryAll(userFollows);

		if (!CollectionUtils.isEmpty(list)) { // 关注成功
			return new JsonView(1).toString();
		} else {
			return new JsonView(0).toString(); // 取消关注
		}
	}

}
