package com.guql.cy.dao;

import java.util.List;

import com.guql.cy.page.Page;
import com.guql.cy.vo.DynamicVo;

public interface DynamicCYDao {
    /**
     * 
     * 功能描述: <br>
     * 〈查询所有重阳动态〉
     *
     * @return
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    public List<DynamicVo> findAll(Page<?> page);  
    /**
     * 
     * 功能描述: <br>
     * 〈根据id查询重阳动态〉
     *
     * @param id
     * @return
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    public DynamicVo findById(int id);
}
