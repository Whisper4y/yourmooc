package org.kite3.entity;

import java.util.Date;

public class UserFollows {

    /**
     * id
     */
    private Integer id;

    /**
     * 用户id
     **/
    private Integer userId;

    /**
     * 关注的用户id
     **/
    private Integer followId;

    /**
     * 关注用户的名称
     */
    private String followName;

    /**
     * 关注时间
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

    public Integer getFollowId() {
        return followId;
    }

    public void setFollowId(Integer followId) {
        this.followId = followId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getFollowName() {
        return followName;
    }

    public void setFollowName(String followName) {
        this.followName = followName;
    }
}
