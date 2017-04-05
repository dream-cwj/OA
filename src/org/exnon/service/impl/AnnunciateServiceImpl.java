package org.exnon.service.impl;

import java.util.Date;
import java.util.List;

import org.exnon.bean.Annunciate;
import org.exnon.dao.IAnnunciateDao;
import org.exnon.service.IAnnunciateService;
import org.exnon.util.Page;

/**
 * 通告业务实现类
 * 
 * @author 陈文健
 * 
 */
public class AnnunciateServiceImpl extends BaseService implements
		IAnnunciateService {

	private IAnnunciateDao annunciateDao;

	public void setAnnunciateDao(IAnnunciateDao annunciateDao) {
		this.annunciateDao = annunciateDao;
	}

	@Override
	public boolean publish(Annunciate annunciate) {
		if (annunciate == null)
			return false;
		Integer id = annunciateDao.addAnnunciate(annunciate);
		return id != null;
	}

	@Override
	public Page<Annunciate> findAnnunciatesByPage(Page<Annunciate> page) {
		if (page == null)
			page = new Page<Annunciate>();
		page.setPageSize(4);
		page = annunciateDao.getAnnunciates(page);
		return page;
	}

	@Override
	public boolean removeAnnunciate(Annunciate annunciate) {
		if (annunciate == null || annunciate.getId() == null)
			return false;
		annunciateDao.deleteAnnunciate(annunciate.getId());
		return true;
	}

	@Override
	public List<Annunciate> findAnnunciates() {
		List<Annunciate> list = annunciateDao.getAnnunciates(new Date());
		return list;
	}

}
