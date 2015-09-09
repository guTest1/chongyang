package com.guql.cy.dao.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.guql.cy.dao.ViewCYDao;
import com.guql.cy.page.Page;
import com.guql.cy.vo.ViewVo;

public class ViewCYDaoImpl implements ViewCYDao {
    
    private static final Log log = LogFactory.getLog(ViewCYDaoImpl.class);
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
    public List<ViewVo> findAll(Page<?> page) {
        String sql = this.getStatementId(ViewVo.class, FINDALL);
        log.info("findAll QuestionVo:" + sql);
        List<ViewVo> list = sqlSession.selectList(sql,page);
        return list;
    }

    @Override
    public ViewVo findById(int id) {
        String sql = this.getStatementId(ViewVo.class, FINDBYID);
        ViewVo question = sqlSession.selectOne(sql,id);
        return question;
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
