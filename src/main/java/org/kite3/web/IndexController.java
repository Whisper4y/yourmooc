package org.kite3.web;

import java.util.List;

import org.kite3.business.IndexBusiness;
import org.kite3.dto.CourseClassifyDto;
import org.kite3.dto.CourseQueryDto;
import org.kite3.entity.Course;
import org.kite3.entity.SiteCarousel;
import org.kite3.entity.User;
import org.kite3.service.CourseService;
import org.kite3.service.SiteCarouseService;
import org.kite3.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 网站首页
 */
@Controller
@RequestMapping("")
public class IndexController {

    @Autowired
    private SiteCarouseService siteCarouselService;

    @Autowired
    private IndexBusiness indexBusiness;

    @Autowired
    private CourseService courseService;

    @Autowired
    private UserService userService;

    @RequestMapping("/")
    public ModelAndView indexPage() {
        return index();
    }

    @RequestMapping("/index")
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView("index");

        // 加载轮播
        List<SiteCarousel> carouselList = siteCarouselService.queryCarousels(4);
        mv.addObject("carouselList", carouselList);

        // 课程分类
        List<CourseClassifyDto> classifys = indexBusiness.queryAllClassify();
        // 课程推荐
        indexBusiness.prepareRecomdCourses(classifys);
        mv.addObject("classifys", classifys);

        // 获取5门好课推荐，根据权重（weight）进行排序
        CourseQueryDto queryEntity = new CourseQueryDto();
        queryEntity.setCount(5);
        List<Course> goodCourseList = this.courseService.queryList(queryEntity);
        mv.addObject("goodCourseList", goodCourseList);

        // 获取7门java课程，根据权重（学习数量studyCount）进行排序
        queryEntity.setCount(7);
        queryEntity.setSubClassify("java");// java分类
        List<Course> javaCourseList = this.courseService.queryList(queryEntity);
        mv.addObject("javaCourseList", javaCourseList);

        // 加载讲师
        List<User> recomdTeacherList = userService.queryRecomd();
        mv.addObject("recomdTeacherList", recomdTeacherList);

        return mv;
    }

}
