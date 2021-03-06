package com.guql.cy.dao;

import java.util.List;

import com.guql.cy.page.Page;
import com.guql.cy.vo.ViewVo;

public interface ViewCYDao {
    /**
     * 
     * 功能描述: <br>
     * 〈分页查询重阳问答〉
     *
     * @param page
     * @return
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    public List<ViewVo> findAll(Page<?> page);
    /**
     * 
     * 功能描述: <br>
     * 〈根据id查询重阳问答〉
     *
     * @param id
     * @return
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    public ViewVo findById(int id);
}
