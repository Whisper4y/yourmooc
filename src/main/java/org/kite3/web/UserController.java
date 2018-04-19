package org.kite3.web;

import org.apache.commons.io.FileUtils;
import org.kite3.dto.UserCourseSectionDto;
import org.kite3.entity.User;
import org.kite3.entity.UserCollections;
import org.kite3.entity.UserCourseSection;
import org.kite3.entity.UserFollows;
import org.kite3.page.TailPage;
import org.kite3.service.UserCollectionsService;
import org.kite3.service.UserCourseSectionService;
import org.kite3.service.UserFollowsService;
import org.kite3.service.UserService;
import org.kite3.util.JsonView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

/**
 * 个人中心
 *
 * @author kite3
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    UserCollectionsService userCollectionsService;

    @Autowired
    UserFollowsService userFollowsService;

    @Autowired
    UserCourseSectionService userCourseSectionService;

    /**
     * 我的课程
     */
    @RequestMapping("/course")
    public ModelAndView course(TailPage<UserCourseSectionDto> page, HttpServletRequest request) {

        ModelAndView mv = new ModelAndView("user/course");
        mv.addObject("curNav", "course");

        // 获取当前用户id
        String curUserName = (String) request.getSession().getAttribute("username");
        User user = new User();
        user = userService.getByUsername(curUserName);
        int curUserId = user.getId();

        UserCourseSection queryEntity = new UserCourseSection();
        queryEntity.setUserId(curUserId);
        page = userCourseSectionService.queryPage(queryEntity, page);
        mv.addObject("page", page);

        return mv;
    }

    /**
     * 我的收藏
     */
    @RequestMapping("/collect")
    public ModelAndView collect(TailPage<UserCollections> page, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("user/collect");
        mv.addObject("curNav", "collect");

        // 获取当前用户id
        String curUserName = (String) request.getSession().getAttribute("username");
        User user = new User();
        user = userService.getByUsername(curUserName);
        int curUserId = user.getId();

        UserCollections queryEntity = new UserCollections();
        queryEntity.setUserId(curUserId);
        page = userCollectionsService.queryPage(queryEntity, page);

        mv.addObject("page", page);
        return mv;
    }

    /**
     * 我的关注
     */
    @RequestMapping("/follow")
    public ModelAndView follow(TailPage<UserFollows> page, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("user/follow");
        mv.addObject("curNav", "follow");

        // 获取当前用户id
        String curUserName = (String) request.getSession().getAttribute("username");
        User user = new User();
        user = userService.getByUsername(curUserName);
        int curUserId = user.getId();

        UserFollows queryEntity = new UserFollows();
        queryEntity.setUserId(curUserId);
        page = userFollowsService.queryPage(queryEntity, page);

        mv.addObject("page", page);
        return mv;
    }

    /**
     * 个人信息
     */
    @RequestMapping("/info")
    public ModelAndView info(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("user/info");
        mv.addObject("curNav", "info");

        User user = userService.getByUsername((String) request.getSession().getAttribute("username"));
        mv.addObject("user", user);
        return mv;
    }

    /**
     * 保存个人信息
     */
    @RequestMapping("/saveInfo")
    @ResponseBody
    public String saveInfo(User user, @RequestParam("file") MultipartFile file) {
        try {
            if (!file.isEmpty()) {
                FileUtils.copyInputStreamToFile(file.getInputStream(),
                        new File("D:\\ProgramData\\workspace\\yourmooc\\src\\main\\webapp\\resources\\images",
                                file.getOriginalFilename()));
                user.setHeader(file.getOriginalFilename());
            }
            userService.updateSelectivity(user);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return new JsonView().toString();

    }

    /**
     * 显示密码修改页面
     */
    @RequestMapping("/passwd")
    public ModelAndView passwd() {
        ModelAndView mv = new ModelAndView("user/passwd");
        mv.addObject("curNav", "passwd");
        return mv;
    }

    /**
     * 密码
     */
    @RequestMapping("/savePasswd")
    @ResponseBody
    public String savePasswd(String oldPassword, String password, String rePassword, HttpServletRequest request) {
        User currentUser = userService.getByUsername((String) request.getSession().getAttribute("username"));
        if (null == currentUser) {
            return JsonView.render(1, "用户不存在！");
        }
        oldPassword = oldPassword.trim();
        if (!oldPassword.equals(currentUser.getPassword())) {
            return JsonView.render(1, "The old password is wrong !");
        }
        if (StringUtils.isEmpty(password.trim())) {
            return JsonView.render(1, "New password cannot be empty!");
        }
        if (!password.trim().equals(rePassword.trim())) {
            return JsonView.render(1, "The new password is inconsistent with the duplicate password!");
        }
        currentUser.setPassword(password);
        userService.updateSelectivity(currentUser);
        return new JsonView().toString();
    }

}
