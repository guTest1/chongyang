package com.guql.cy.service;

import java.util.List;

import com.guql.cy.page.Page;
import com.guql.cy.vo.RecommendedVo;

public interface RecommendedCYService {
    /**
     * 
     * 功能描述: <br>
     * 〈分页查询〉
     *
     * @param page
     * @return
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    public List<RecommendedVo> findAll(Page<?> page);
    /**
     * 
     * 功能描述: <br>
     * 〈根据id查询〉
     *
     * @param id
     * @return
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    public RecommendedVo findById(int id);
}
