package com.guql.cy.dao.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.guql.cy.dao.QuestionCYDao;
import com.guql.cy.page.Page;
import com.guql.cy.vo.QuestionVo;

public class QuestionCYDaoImpl implements QuestionCYDao {
    
    private static final Log log = LogFactory.getLog(QuestionCYDaoImpl.class);
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
    public List<QuestionVo> findAll(Page<?> page) {
        String sql = this.getStatementId(QuestionVo.class, FINDALL);
        log.info("findAll QuestionVo:" + sql);
        List<QuestionVo> list = sqlSession.selectList(sql,page);
        return list;
    }

    @Override
    public QuestionVo findById(int id) {
        String sql = this.getStatementId(QuestionVo.class, FINDBYID);
        QuestionVo question = sqlSession.selectOne(sql,id);
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
