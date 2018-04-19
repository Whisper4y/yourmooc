package org.kite3.business.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.kite3.business.IndexBusiness;
import org.kite3.dto.CourseClassifyDto;
import org.kite3.dto.CourseQueryDto;
import org.kite3.entity.Course;
import org.kite3.entity.CourseClassify;
import org.kite3.service.CourseClassifyService;
import org.kite3.service.CourseService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

/**
 * 首页业务层
 */
@Service
public class IndexBusinessImpl implements IndexBusiness {

    @Autowired
    private CourseClassifyService courseClassifyService;

    @Autowired
    private CourseService courseService;

    /**
     * 获取所有一级分类的Map集合。
     * Map中，String存储的是一级分类的code，CourseClassifyDto除了包含一级分类的基本信息外，还包含了一级分类下的所有二级分类。
     */
    public Map<String, CourseClassifyDto> queryAllClassifyMap() {
        Map<String, CourseClassifyDto> resultMap = new LinkedHashMap<String, CourseClassifyDto>();
        Iterator<CourseClassify> it = courseClassifyService.queryAll().iterator();

        while (it.hasNext()) {
            CourseClassify c = it.next();
            if ("0".equals(c.getParentCode())) {// 一级分类
                CourseClassifyDto Dto = new CourseClassifyDto();
                BeanUtils.copyProperties(c, Dto);
                resultMap.put(Dto.getCode(), Dto);
            } else {// 二级分类
                if (null != resultMap.get(c.getParentCode())) {
                    resultMap.get(c.getParentCode()).getSubClassifyList().add(c);// 添加到子分类中
                }
            }
        }
        return resultMap;
    }

    /**
     * 获取所有，其中二级分类存在一级分类的dto中
     */
    public List<CourseClassifyDto> queryAllClassify() {
        List<CourseClassifyDto> resultList = new ArrayList<CourseClassifyDto>();
        for (CourseClassifyDto Dto : this.queryAllClassifyMap().values()) {
            resultList.add(Dto);
        }
        return resultList;
    }

    /**
     * 为分类设置课程推荐
     */
    public void prepareRecomdCourses(List<CourseClassifyDto> classifyDtoList) {
        if (!CollectionUtils.isEmpty(classifyDtoList)) {
            for (CourseClassifyDto item : classifyDtoList) {
                CourseQueryDto queryEntity = new CourseQueryDto();
                queryEntity.setCount(5); // 推荐5门课程
                queryEntity.setClassify(item.getCode());// 根据分类code来查询相应课程

                List<Course> tmpList = this.courseService.queryList(queryEntity);
                if (!CollectionUtils.isEmpty(tmpList)) {
                    item.setRecomdCourseList(tmpList);
                }
            }
        }
    }

}
