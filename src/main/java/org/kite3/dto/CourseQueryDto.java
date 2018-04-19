package org.kite3.dto;

import org.kite3.entity.Course;

/**
 * 课程查询实体
 *
 * @author kite3
 */
public class CourseQueryDto extends Course {

    private Integer start = 0; // limit开始

    private Integer count; // 数量

    private Integer end; // limit结束

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getEnd() {
        if (null != this.count) {
            if (null == this.start) {
                this.start = 0;
            }
            this.end = this.start + this.count;
        }
        return end;
    }

}
