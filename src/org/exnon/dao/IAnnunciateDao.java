package org.exnon.dao;

import org.exnon.bean.Annunciate;
import org.exnon.util.Page;

/**
 * 通告持久�?
 * @author 陈文�?
 *
 */
public interface IAnnunciateDao {
	
	/**
	 * 添加通告
	 * @param annunciate
	 * @return
	 */
	Integer addAnnunciate(Annunciate annunciate);
	
	/**
	 * 分页 获取通告列表
	 * @param page	页面相关数据
	 * @return
	 */
	Page<Annunciate> getAnnunciates(Page<Annunciate> page);
	
	/**
	 * 根据 id 删除通告
	 * @param id
	 */
	void deleteAnnunciate(Integer id);

}
