package com.guql.cy.dao.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.guql.cy.dao.DynamicCYDao;
import com.guql.cy.page.Page;
import com.guql.cy.vo.DynamicVo;

public class DynamicCYDaoImpl implements DynamicCYDao {
    
    private static final Log log = LogFactory.getLog(DynamicCYDaoImpl.class);
    /**
     * 查询所有
     */
    private final static String FINDALL = "findAll";
    /**
     * 根据id查询
     */
    private final static String FINDBYID = "findById";
    /**
     * 
     */
    @Autowired
    private SqlSessionTemplate sqlSession;

    @Override
    public List<DynamicVo> findAll(Page<?> page) {
        String sql = this.getStatementId(DynamicVo.class, FINDALL);
        log.info("findAll Dynamic:" + sql);
        List<DynamicVo> list = sqlSession.selectList(sql,page);
        return list;
    }

    @Override
    public DynamicVo findById(int id) {
        String sql = this.getStatementId(DynamicVo.class, FINDBYID);
        DynamicVo dynamic = sqlSession.selectOne(sql,id);
        return dynamic;
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
