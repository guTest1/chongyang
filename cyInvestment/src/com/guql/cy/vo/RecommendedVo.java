package com.guql.cy.vo;
/**
 * 
 * 〈一句话功能简述〉<br> 
 * 〈重阳推荐vo〉
 *
 * @author guqianglong
 * @see [相关类/方法]（可选）
 * @since [产品/模块版本] （可选）
 */
public class RecommendedVo {
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
     * author
     */
    private String author;
    /**
     * source
     */
    private String source;
    /**
     * content
     */
    private String content;
    
    public RecommendedVo() {
        super();
    }
    public RecommendedVo(String id, String title, String releasedate, String releasetime, String author, String source,
            String content) {
        super();
        this.id = id;
        this.title = title;
        this.releasedate = releasedate;
        this.releasetime = releasetime;
        this.author = author;
        this.source = source;
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
    public String getAuthor() {
        return author;
    }
    public void setAuthor(String author) {
        this.author = author;
    }
    public String getSource() {
        return source;
    }
    public void setSource(String source) {
        this.source = source;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
}
