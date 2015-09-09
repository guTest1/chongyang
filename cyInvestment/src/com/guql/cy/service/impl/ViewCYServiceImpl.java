package com.guql.cy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.guql.cy.dao.ViewCYDao;
import com.guql.cy.page.Page;
import com.guql.cy.service.ViewCYService;
import com.guql.cy.vo.ViewVo;

public class ViewCYServiceImpl implements ViewCYService {
    
    /**
     * 重阳问答
     */
    @Autowired
    private ViewCYDao viewCYDao;

    @Override
    public List<ViewVo> findAll(Page<?> page) {
        return viewCYDao.findAll(page);
    }

    @Override
    public ViewVo findById(int id) {
        return viewCYDao.findById(id);
    }

}
