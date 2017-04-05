package org.exnon.dao;

import org.exnon.bean.Annunciate;
import org.exnon.util.Page;

/**
 * ้ๅๆไนๅฑ?
 * @author ้ๆๅ?
 *
 */
public interface IAnnunciateDao {
	
	/**
	 * ๆทปๅ ้ๅ
	 * @param annunciate
	 * @return
	 */
	Integer addAnnunciate(Annunciate annunciate);
	
	/**
	 * ๅ้กต ่ทๅ้ๅๅ่กจ
	 * @param page	้กต้ข็ธๅณๆฐๆฎ
	 * @return
	 */
	Page<Annunciate> getAnnunciates(Page<Annunciate> page);
	
	/**
	 * ๆ นๆฎ id ๅ ้ค้ๅ
	 * @param id
	 */
	void deleteAnnunciate(Integer id);

}
