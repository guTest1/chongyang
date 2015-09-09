package com.guql.cy.vo;
/**
 * 
 * 〈一句话功能简述〉<br> 
 * 〈重阳动态Vo〉
 *
 * @author guqianglong
 * @see [相关类/方法]（可选）
 * @since [产品/模块版本] （可选）
 */
public class DynamicVo {
    /**
     * 
     */
    private String id;
    /**
     * 
     */
    private String title;
    /**
     * 
     */
    private String releasedate;
    /**
     * 
     */
    private String releasetime;
    /**
     * 
     */
    private String department;
    /**
     * 
     */
    private String publicdate;
    /**
     * 
     */
    private String content;
    
    public DynamicVo() {
        super();
    }
    
    public DynamicVo(String id, String title, String releasedate, String releasetime, String department, String publicdate,
            String content) {
        super();
        this.id = id;
        this.title = title;
        this.releasedate = releasedate;
        this.releasetime = releasetime;
        this.department = department;
        this.publicdate = publicdate;
        this.content = content;
    }

    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getReleasedate() {
        return releasedate;
    }
    public void setReleasedate(String releasedate) {
        this.releasedate = releasedate;
    }
    public String getReleasetime() {
        return releasetime;
    }
    public void setReleasetime(String releasetime) {
        this.releasetime = releasetime;
    }
    public String getDepartment() {
        return department;
    }
    public void setDepartment(String department) {
        this.department = department;
    }
    public String getPublicdate() {
        return publicdate;
    }
    public void setPublicdate(String publicdate) {
        this.publicdate = publicdate;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
}
