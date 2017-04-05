package org.exnon.service;

import org.exnon.bean.Annunciate;
import org.exnon.util.Page;

/**
 * 通告业务层接口
 * @author 陈文健
 *
 */
public interface IAnnunciateService {
	
	/**
	 * 发布公告， 成功放回 true ，否则 false
	 * @param annunciate
	 * @return
	 */
	boolean publish(Annunciate annunciate);
	
	/**
	 * 根据 页面信息查询指定通告列表
	 * @return
	 */
	Page<Annunciate> findAnnunciatesByPage(Page<Annunciate> page);
	
	/**
	 * 删除通告，注：对象 id 必须存在
	 * @param annunciate
	 * @return
	 */
	boolean removeAnnunciate(Annunciate annunciate);

}
