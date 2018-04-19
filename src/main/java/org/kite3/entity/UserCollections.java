package org.kite3.entity;

import java.util.Date;

public class UserCollections {

    /**
     * id
     */
    private Integer id;

    /**
     * 用户id
     **/
    private Integer userId;

    /**
     * 用户收藏课程id
     */
    private Integer courseId;

    /**
     * 用户收藏课程名称
     */
    private String courseName;

    /**
     * 创建时间
     */
    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }
}
