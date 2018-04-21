package org.kite3.dto;

import java.util.ArrayList;
import java.util.List;

import org.kite3.entity.Course;
import org.kite3.entity.CourseClassify;

/**
 * 课程分类DTO
 *
 * @author kite3
 */
public class CourseClassifyDto extends CourseClassify {

    // 子分类列表
    private List<CourseClassify> subClassifyList = new ArrayList<CourseClassify>();

    // 课程推荐列表
    private List<Course> recomdCourseList;

    public List<CourseClassify> getSubClassifyList() {
        return subClassifyList;
    }

    public void setSubClassifyList(List<CourseClassify> subClassifyList) {
        this.subClassifyList = subClassifyList;
    }

    public List<Course> getRecomdCourseList() {
        return recomdCourseList;
    }

    public void setRecomdCourseList(List<Course> recomdCourseList) {
        this.recomdCourseList = recomdCourseList;
    }

}
