package com.guql.cy.vo;

/**
 * 
 * 〈一句话功能简述〉<br> 
 * 〈日期辅助vo〉
 *
 * @author guqianglong
 * @see [相关类/方法]（可选）
 * @since [产品/模块版本] （可选）
 */
public class DateVo {
    /**
     * 年
     */
    private String year;
    /**
     * 月
     */
    private String month;
    /**
     * 日
     */
    private String date;
    
    public DateVo() {
        super();
    }
    public DateVo(String year, String month, String date) {
        super();
        this.year = year;
        this.month = month;
        this.date = date;
    }
    public String getYear() {
        return year;
    }
    public void setYear(String year) {
        this.year = year;
    }
    public String getMonth() {
        return month;
    }
    public void setMonth(String month) {
        this.month = month;
    }
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }
}
