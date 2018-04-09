package org.kite3.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.kite3.entity.User;
import org.kite3.entity.UserCollections;
import org.kite3.service.UserCollectionsService;
import org.kite3.service.UserService;
import org.kite3.util.JsonView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/collections")
public class UserCollectionsController {

	@Autowired
	UserCollectionsService userCollectionsService;
	
	@Autowired
	UserService userService;

	/**
	 * 用户收藏
	 *
	 */
	@RequestMapping(value = "/doCollection")
	@ResponseBody
	public String doCollection(int courseId, HttpServletRequest request) {

		// 获取当前用户id
		String curUserName = (String)request.getSession().getAttribute("username");
		User user = new User();
		user = userService.getByUsername(curUserName);
	    int curUserId = user.getId();
	    
		UserCollections userCollections = new UserCollections();
		userCollections.setUserId(curUserId);
		userCollections.setCourseId(courseId);
		
		List<UserCollections> list = userCollectionsService.queryAll(userCollections);

		if (!CollectionUtils.isEmpty(list)) {
			userCollectionsService.delete(list.get(0)); // 取消收藏
			return new JsonView(0).toString();
		} else {
			userCollectionsService.createSelectivity(userCollections);
			return new JsonView(1).toString(); // 已经收藏
		}
	}

	/**
	 * 是否已经收藏
	 *
	 */
	@RequestMapping(value = "/isCollection")
	@ResponseBody
	public String isCollection(int courseId, HttpServletRequest request) {
		// 获取当前用户id
		String curUserName = (String) request.getSession().getAttribute("username");
		User user = new User();
		user = userService.getByUsername(curUserName);
		int curUserId = user.getId();
		
		UserCollections userCollections = new UserCollections();
		userCollections.setUserId(curUserId);
		userCollections.setCourseId(courseId);
		List<UserCollections> list = userCollectionsService.queryAll(userCollections);

		if (!CollectionUtils.isEmpty(list)) { // 已经收藏
			return new JsonView(1).toString();
		} else {
			return new JsonView(0).toString();
		}
	}

}
