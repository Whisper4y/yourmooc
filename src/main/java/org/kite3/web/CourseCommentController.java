package org.kite3.web;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.kite3.entity.Course;
import org.kite3.entity.CourseComment;
import org.kite3.service.CourseCommentService;
import org.kite3.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 课程评论管理
 */
@Controller
@RequestMapping("/courseComment")
public class CourseCommentController {

    @Autowired
    private CourseCommentService courseCommentService;

    @Autowired
    private CourseService courseService;

    /**
     * 评论
     */
    @RequestMapping(value = "/doComment")
    public ModelAndView doRegister(CourseComment entity, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("redirect:/course/video/" + entity.getSectionId());
        entity.setCreateTime(new Date());
        Course course = courseService.getById(entity.getCourseId());
        entity.setToUsername(course.getUsername());
        String username = (String) request.getSession().getAttribute("username");
        entity.setUsername(username == null ? "游客" : username);
        this.courseCommentService.create(entity);
        return mv;
    }
}
