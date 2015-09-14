package com.guql.cy.vo;
/**
 * 
 * 〈一句话功能简述〉<br> 
 * 〈用户vo〉
 *
 * @author guqianglong
 * @see [相关类/方法]（可选）
 * @since [产品/模块版本] （可选）
 */
public class UserVo {
    /**
     * 
     */
    private String userid;
    /**
     * 
     */
    private String name;
    /**
     * 
     */
    private String phone;
    /**
     * 
     */
    private String fundcode;
    /**
     * 
     */
    private String idcard;
    /**
     * 
     */
    private String passport;
    /**
     * 
     */
    private String come;
    /**
     * 
     */
    private String soldiers;
    /**
     * 
     */
    private String returncard;
    /**
     * 
     */
    private String register;
    /**
     * 
     */
    private String civiliancard;
    /**
     * 
     */
    private String policecard;
    /**
     * 
     */
    private String other;
    /**
     * 
     */
    private String password;
    
    public UserVo() {
        super();
    }
    public UserVo(String userid, String name, String phone, String fundcode, String idcard, String passport, String come,
            String soldiers, String returncard, String register, String civiliancard, String policecard, String other,
            String password) {
        super();
        this.userid = userid;
        this.name = name;
        this.phone = phone;
        this.fundcode = fundcode;
        this.idcard = idcard;
        this.passport = passport;
        this.come = come;
        this.soldiers = soldiers;
        this.returncard = returncard;
        this.register = register;
        this.civiliancard = civiliancard;
        this.policecard = policecard;
        this.other = other;
        this.password = password;
    }
    public String getUserid() {
        return userid;
    }
    public void setUserid(String userid) {
        this.userid = userid;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getFundcode() {
        return fundcode;
    }
    public void setFundcode(String fundcode) {
        this.fundcode = fundcode;
    }
    public String getIdcard() {
        return idcard;
    }
    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }
    public String getPassport() {
        return passport;
    }
    public void setPassport(String passport) {
        this.passport = passport;
    }
    public String getCome() {
        return come;
    }
    public void setCome(String come) {
        this.come = come;
    }
    public String getSoldiers() {
        return soldiers;
    }
    public void setSoldiers(String soldiers) {
        this.soldiers = soldiers;
    }
    public String getReturncard() {
        return returncard;
    }
    public void setReturncard(String returncard) {
        this.returncard = returncard;
    }
    public String getRegister() {
        return register;
    }
    public void setRegister(String register) {
        this.register = register;
    }
    public String getCiviliancard() {
        return civiliancard;
    }
    public void setCiviliancard(String civiliancard) {
        this.civiliancard = civiliancard;
    }
    public String getPolicecard() {
        return policecard;
    }
    public void setPolicecard(String policecard) {
        this.policecard = policecard;
    }
    public String getOther() {
        return other;
    }
    public void setOther(String other) {
        this.other = other;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
}
