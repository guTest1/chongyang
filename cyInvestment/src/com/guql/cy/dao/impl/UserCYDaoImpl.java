package com.guql.cy.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.guql.cy.dao.UserCYDao;
import com.guql.cy.vo.UserVo;

public class UserCYDaoImpl implements UserCYDao {
    /**
     * 查询所有
     */
    private final static String FINDUSER = "findUser";
    
    /**
     * 
     */
    @Autowired
    private SqlSessionTemplate sqlSession;
    
    @Override
    public UserVo getUser(UserVo user) {
        String sql = getStatementId(UserVo.class,FINDUSER);
        UserVo us = sqlSession.selectOne(sql, user);
        return us;
    }
    
    /**   
     * 映射sqlid 
     */  
    private String getStatementId(Class<?> entityClass, String suffix)
    {
        String sqlStr = entityClass.getName() + "." + suffix;
        return sqlStr;
    }
}
