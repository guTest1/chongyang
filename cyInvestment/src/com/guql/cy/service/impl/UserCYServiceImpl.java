package com.guql.cy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.guql.cy.dao.UserCYDao;
import com.guql.cy.service.UserCYService;
import com.guql.cy.vo.UserVo;

public class UserCYServiceImpl implements UserCYService {
    
    @Autowired
    private UserCYDao userCYDao;

    @Override
    public UserVo getUser(UserVo user) {
        return userCYDao.getUser(user);
    }

}
