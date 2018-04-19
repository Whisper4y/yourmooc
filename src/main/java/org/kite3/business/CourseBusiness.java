package org.kite3.business;

import java.util.List;

import org.kite3.dto.CourseSectionDto;

public interface CourseBusiness {

    /**
     * 获取课程章节
     */
    List<CourseSectionDto> queryCourseSection(int courseId);

}
