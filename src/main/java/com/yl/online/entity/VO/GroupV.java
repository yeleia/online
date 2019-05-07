package com.yl.online.entity.VO;

/**
 * @author yelei
 * @date 2019/5/7
 */
public class GroupV {
    private Integer groupid;
    private String groupname;
    private StringBuilder username;


    public Integer getGroupid() {
        return groupid;
    }

    public void setGroupid(Integer groupid) {
        this.groupid = groupid;
    }

    public String getGroupname() {
        return groupname;
    }

    public void setGroupname(String groupname) {
        this.groupname = groupname;
    }

    public StringBuilder getUsername() {
        return username;
    }

    public void setUsername(StringBuilder username) {
        this.username = username;
    }
}
