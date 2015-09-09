package com.guql.cy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.guql.cy.dao.RecommendedCYDao;
import com.guql.cy.page.Page;
import com.guql.cy.service.RecommendedCYService;
import com.guql.cy.vo.RecommendedVo;

public class RecommendedCYServiceImpl implements RecommendedCYService {
    
    /**
     * 重阳问答
     */
    @Autowired
    private RecommendedCYDao recommendedCYDao;

    @Override
    public List<RecommendedVo> findAll(Page<?> page) {
        return recommendedCYDao.findAll(page);
    }

    @Override
    public RecommendedVo findById(int id) {
        return recommendedCYDao.findById(id);
    }

}
