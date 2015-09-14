package com.guql.cy.service;

import com.guql.cy.vo.UserVo;


public interface UserCYService {
    /**
     * 
     * 功能描述: <br>
     * 〈根据条件获取User对象〉
     *
     * @param user
     * @return
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    public UserVo getUser(UserVo user);
}
