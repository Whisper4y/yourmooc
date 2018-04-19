package org.kite3.web;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.kite3.business.CourseBusiness;
import org.kite3.dto.CourseQueryDto;
import org.kite3.dto.CourseSectionDto;
import org.kite3.entity.Course;
import org.kite3.entity.CourseComment;
import org.kite3.entity.CourseSection;
import org.kite3.entity.User;
import org.kite3.entity.UserCourseSection;
import org.kite3.page.TailPage;
import org.kite3.service.CourseCommentService;
import org.kite3.service.CourseSectionService;
import org.kite3.service.CourseService;
import org.kite3.service.UserCourseSectionService;
import org.kite3.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 课程管理
 *
 * @author kite3
 */
@Controller
@RequestMapping("/course")
public class CourseController {

    @Autowired
    private CourseService courseService;

    @Autowired
    private CourseBusiness courseBusiness;

    @Autowired
    private UserService userService;

    @Autowired
    private CourseSectionService courseSectionService;

    @Autowired
    private CourseCommentService courseCommentService;

    @Autowired
    UserCourseSectionService userCourseSectionService;

    /**
     * 课程章节页面
     */
    @RequestMapping("/learn/{courseId}")
    public ModelAndView learn(@PathVariable int courseId, HttpServletRequest request) {

        ModelAndView mv = new ModelAndView("learn");

        // 获取课程
        Course course = courseService.getById(courseId);
        mv.addObject("course", course);

        // 获取课程章节
        List<CourseSectionDto> chaptSections = this.courseBusiness.queryCourseSection(courseId);
        mv.addObject("chaptSections", chaptSections);

        // 获取讲师
        User courseTeacher = this.userService.getByUsername(course.getUsername());
        mv.addObject("courseTeacher", courseTeacher);

        // 获取推荐课程
        CourseQueryDto queryEntity = new CourseQueryDto();
        queryEntity.setCount(5);// 5门推荐课程
        queryEntity.setSubClassify(course.getSubClassify());
        List<Course> recomdCourseList = this.courseService.queryList(queryEntity);
        mv.addObject("recomdCourseList", recomdCourseList);

        // 当前学习的章节（未登录不展示）
        if (!StringUtils.isEmpty((String) request.getSession().getAttribute("username"))) {
            String curUserName = (String) request.getSession().getAttribute("username");
            User user = new User();
            user = userService.getByUsername(curUserName);
            int curUserId = user.getId();

            UserCourseSection userCourseSection = new UserCourseSection();
            userCourseSection.setCourseId(courseId);
            userCourseSection.setUserId(curUserId);
            userCourseSection = userCourseSectionService.queryLatest(userCourseSection);
            if (null != userCourseSection) {
                CourseSection curCourseSection = courseSectionService.getById(userCourseSection.getSectionId());
                mv.addObject("curCourseSection", curCourseSection);
            }
        }

        mv.addObject("isComment", "no");

        return mv;

    }

    /**
     * 课程评论页面
     */
    @RequestMapping("/segment")
    public ModelAndView segment(CourseComment queryEntity, TailPage<CourseComment> page, HttpServletRequest request) {

        ModelAndView mv = new ModelAndView("learnComment");

        Integer courseId = queryEntity.getCourseId();

        // 获取课程
        Course course = courseService.getById(courseId);
        mv.addObject("course", course);

        // 获取课程章节
        List<CourseSectionDto> chaptSections = this.courseBusiness.queryCourseSection(courseId);
        mv.addObject("chaptSections", chaptSections);

        // 获取讲师
        User courseTeacher = userService.getByUsername(course.getUsername());
        mv.addObject("courseTeacher", courseTeacher);

        // 获取推荐课程
        CourseQueryDto queryEntity1 = new CourseQueryDto();
        queryEntity1.setCount(5);// 5门推荐课程
        queryEntity1.setSubClassify(course.getSubClassify());
        List<Course> recomdCourseList = this.courseService.queryList(queryEntity1);
        mv.addObject("recomdCourseList", recomdCourseList);

        TailPage<CourseComment> commentPage = courseCommentService.queryPage(queryEntity, page);
        mv.addObject("page", commentPage);

        // 当前学习的章节（未登录不展示）
        if (!StringUtils.isEmpty((String) request.getSession().getAttribute("username"))) {
            String curUserName = (String) request.getSession().getAttribute("username");
            User user = new User();
            user = userService.getByUsername(curUserName);
            int curUserId = user.getId();

            UserCourseSection userCourseSection = new UserCourseSection();
            userCourseSection.setCourseId(courseId);
            userCourseSection.setUserId(curUserId);
            userCourseSection = userCourseSectionService.queryLatest(userCourseSection);
            if (null != userCourseSection) {
                CourseSection curCourseSection = courseSectionService.getById(userCourseSection.getSectionId());
                mv.addObject("curCourseSection", curCourseSection);
            }
        }

        mv.addObject("isComment", "yes");

        return mv;
    }

    /**
     * 视频学习页面
     */
    @RequestMapping("/video/{sectionId}")
    public ModelAndView video(@PathVariable int sectionId, HttpServletRequest request) {

        ModelAndView mv = new ModelAndView("video");

        // 当前章节
        CourseSection courseSection = courseSectionService.getById(sectionId);
        // 当前章节所在课程
        Integer curCourseId = courseSection.getCourseId();
        mv.addObject("courseSection", courseSection);

        // 课程章节列表
        List<CourseSectionDto> chaptSections = this.courseBusiness.queryCourseSection(courseSection.getCourseId());
        mv.addObject("chaptSections", chaptSections);

        // 评论
        CourseComment courseCommentEntity = new CourseComment();
        courseCommentEntity.setSectionId(sectionId);
        List<CourseComment> comments = courseCommentService.queryAll(courseCommentEntity);
        mv.addObject("comments", comments);

        // 记录当前学习人数以及章节（未登录不记录）
        if (!StringUtils.isEmpty((String) request.getSession().getAttribute("username"))) {
            String curUserName = (String) request.getSession().getAttribute("username");
            User user = new User();
            user = userService.getByUsername(curUserName);
            int curUserId = user.getId();

            // 记录当前学习人数
            Course course = courseService.getById(curCourseId);
            Integer count = course.getStudyCount();
            course.setStudyCount(++count);
            courseService.updateStudyCount(course);

            // 记录当前章节
            UserCourseSection userCourseSection = new UserCourseSection();
            userCourseSection.setUserId(curUserId); // 当前用户id
            userCourseSection.setCourseId(courseSection.getCourseId()); // 当前课程id
            userCourseSection.setSectionId(courseSection.getId()); // 当前章节id
            UserCourseSection result = userCourseSectionService.queryLatest(userCourseSection);

            if (null == result) { // 如果没有，插入
                userCourseSection.setCreateTime(new Date());
                userCourseSection.setUpdateTime(new Date());
                userCourseSectionService.createSelectivity(userCourseSection);
            } else {
                result.setUpdateTime(new Date()); // 如果已存在，则更新时间
                userCourseSectionService.update(result);
            }
        }

        return mv;

    }

}
