package com.guql.cy.vo;

import java.io.Serializable;

/**
 * 
 * 〈一句话功能简述〉<br> 
 * 〈登陆时返回vo〉
 *
 * @author Administrator
 * @see [相关类/方法]（可选）
 * @since [产品/模块版本] （可选）
 */
public class LoginReturns implements Serializable {
    /**
     */
    private static final long serialVersionUID = 1L;
    /**
     * 
     */
    private String returns;
    /**
     * 
     */
    private String returns_msg;
    
    public LoginReturns() {
        super();
    }
    public LoginReturns(String returns, String returns_msg) {
        super();
        this.returns = returns;
        this.returns_msg = returns_msg;
    }
    public String getReturns() {
        return returns;
    }
    public void setReturns(String returns) {
        this.returns = returns;
    }
    public String getReturns_msg() {
        return returns_msg;
    }
    public void setReturns_msg(String returns_msg) {
        this.returns_msg = returns_msg;
    }
}
