package com.guql.cy.vo;

/**
 * 
 * 〈一句话功能简述〉<br> 
 * 〈重阳问答vo〉
 *
 * @author guqianglong
 * @see [相关类/方法]（可选）
 * @since [产品/模块版本] （可选）
 */
public class QuestionVo {
    /**
     * id
     */
    private String id;
    /**
     * title
     */
    private String title;
    /**
     * releasedate
     */
    private String releasedate;
    /**
     * releasetime
     */
    private String releasetime;
    /**
     * content
     */
    private String content;
    
    public QuestionVo() {
        super();
    }
    public QuestionVo(String id, String title, String releasedate, String releasetime, String content) {
        super();
        this.id = id;
        this.title = title;
        this.releasedate = releasedate;
        this.releasetime = releasetime;
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
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
}
