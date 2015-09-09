package com.guql.cy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.guql.cy.dao.QuestionCYDao;
import com.guql.cy.page.Page;
import com.guql.cy.service.QuestionCYService;
import com.guql.cy.vo.QuestionVo;

public class QuestionCYServiceImpl implements QuestionCYService {
    
    /**
     * 重阳问答
     */
    @Autowired
    private QuestionCYDao questionCYDao;

    @Override
    public List<QuestionVo> findAll(Page<?> page) {
        return questionCYDao.findAll(page);
    }

    @Override
    public QuestionVo findById(int id) {
        return questionCYDao.findById(id);
    }

}
