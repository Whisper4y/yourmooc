package org.kite3.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.kite3.business.IndexBusiness;
import org.kite3.dto.CourseClassifyDto;
import org.kite3.entity.Course;
import org.kite3.entity.CourseClassify;
import org.kite3.page.TailPage;
import org.kite3.service.CourseClassifyService;
import org.kite3.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/course")
public class CourseListController {

    @Autowired
    private IndexBusiness indexBusiness;

    @Autowired
    private CourseClassifyService courseClassifyService;

    @Autowired
    private CourseService courseService;

    /**
     * 课程分类页
     *
     * @param c    分类code
     * @param sort 排序
     * @param page 分页
     */
    @RequestMapping("/list")
    public ModelAndView list(String c, String sort, TailPage<Course> page) {
        ModelAndView mv = new ModelAndView("list");
        String curCode = "-1"; // 当前点击下的一级分类
        String curSubCode = "-2"; // 当前点击下的当前二级分类

        // 一级分类
        Map<String, CourseClassifyDto> classifyMap = indexBusiness.queryAllClassifyMap();
        List<CourseClassifyDto> classifysList = new ArrayList<CourseClassifyDto>();
        for (CourseClassifyDto dto : classifyMap.values()) {
            classifysList.add(dto);
        }
        mv.addObject("classifys", classifysList);

        // 当前分类
        CourseClassify curClassify = courseClassifyService.getByCode(c);

        // 二级分类
        if (null == curClassify) {// 没有此分类，加载所有二级分类
            List<CourseClassify> subClassifys = new ArrayList<CourseClassify>();
            for (CourseClassifyDto dto : classifyMap.values()) {
                subClassifys.addAll(dto.getSubClassifyList());
            }
            mv.addObject("subClassifys", subClassifys);
        } else {
            if (!"0".endsWith(curClassify.getParentCode())) {// 当前是二级分类
                curSubCode = curClassify.getCode();
                curCode = curClassify.getParentCode();
                mv.addObject("subClassifys", classifyMap.get(curClassify.getParentCode()).getSubClassifyList());// 此分类平级的二级分类
            } else {// 当前是一级分类
                curCode = curClassify.getCode();
                mv.addObject("subClassifys", classifyMap.get(curClassify.getCode()).getSubClassifyList());// 此分类下的二级分类
            }
        }
        mv.addObject("curCode", curCode); // 当前点击下的一级分类
        mv.addObject("curSubCode", curSubCode); // 当前点击下的二级分类

        Course queryEntity = new Course();
        if (!"-1".equals(curCode)) {
            queryEntity.setClassify(curCode);
        }
        if (!"-2".equals(curSubCode)) {
            queryEntity.setSubClassify(curSubCode);
        }

        // 排序参数
        if ("pop".equals(sort)) {// 最热
            page.descSortField("studyCount");
        } else {
            sort = "last";
            page.descSortField("id");
        }
        mv.addObject("sort", sort);

        // 分页参数
        page = this.courseService.queryPage(queryEntity, page);
        mv.addObject("page", page);

        return mv;
    }

}
