package com.guql.cy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.guql.cy.dao.DynamicCYDao;
import com.guql.cy.page.Page;
import com.guql.cy.service.DynamicCYService;
import com.guql.cy.vo.DynamicVo;

public class DynamicCYServiceImpl implements DynamicCYService {
    
    /**
     * 重阳动态
     */
    @Autowired
    private DynamicCYDao dynamicCYDao;

    @Override
    public List<DynamicVo> findAll(Page<?> page) {
        return dynamicCYDao.findAll(page);
    }

    @Override
    public DynamicVo findById(int id) {
        return dynamicCYDao.findById(id);
    }
}
