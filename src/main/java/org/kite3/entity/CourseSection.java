package org.kite3.entity;

/**
 * 课程章节
 */
public class CourseSection {

    /**
     * 章节id
     */
    private Integer id;

    /**
     * 归属课程id
     **/
    private Integer courseId;

    /**
     * 父章节id，（只有2级）
     **/
    private Integer parentId;

    /**
     * 章节名称
     **/
    private String name;

    /**
     * 时长
     **/
    private String time;

    /**
     * 视频url
     */
    private String videoUrl;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }

}
