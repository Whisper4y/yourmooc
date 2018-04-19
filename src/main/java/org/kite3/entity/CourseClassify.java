package org.kite3.entity;

/**
 * 课程分类实体类
 *
 * @author kite3
 */
public class CourseClassify {

    // id
    private Integer id;

    // 名称
    private String name;

    // 编码
    private String code;

    // 父级分类编码
    private String parentCode;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getParentCode() {
        return parentCode;
    }

    public void setParentCode(String parentCode) {
        this.parentCode = parentCode;
    }

}
