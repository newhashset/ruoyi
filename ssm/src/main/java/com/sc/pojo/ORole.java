package com.sc.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class ORole implements Serializable {
    //角色和权限多对多 一个角色可以设置多个权限
    private List<OMenu> menus;

    public List<OMenu> getMenus() {
        return menus;
    }

    public void setMenus(List<OMenu> menus) {
        this.menus = menus;
    }

    private Integer id;

    private String rolename;

    private String overview;

    private String status;

    private Integer operator;

    private Date createtime;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename == null ? null : rolename.trim();
    }

    public String getOverview() {
        return overview;
    }

    public void setOverview(String overview) {
        this.overview = overview == null ? null : overview.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public Integer getOperator() {
        return operator;
    }

    public void setOperator(Integer operator) {
        this.operator = operator;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", rolename=").append(rolename);
        sb.append(", overview=").append(overview);
        sb.append(", status=").append(status);
        sb.append(", operator=").append(operator);
        sb.append(", createtime=").append(createtime);
        sb.append("]");
        return sb.toString();
    }
}