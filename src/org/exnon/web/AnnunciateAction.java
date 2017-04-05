package org.exnon.web;

import java.util.Date;

import org.exnon.bean.Annunciate;
import org.exnon.service.IAnnunciateService;
import org.exnon.util.Page;

/**
 * 通告
 * 
 * @author 陈文健
 * 
 */
public class AnnunciateAction extends BaseAction {

	private IAnnunciateService annunciateService;

	private Annunciate annunciate;
	private Page<Annunciate> page;

	public String list() {
		page = annunciateService.findAnnunciatesByPage(page);
		return "list";
	}

	public String publish() {
		boolean flag = annunciateService.publish(annunciate);
		this.result = flag;
		return "result";
	}

	public String delete() {
		boolean flag = annunciateService.removeAnnunciate(annunciate);
		this.result = flag;
		return "result";
	}

	public Page<Annunciate> getPage() {
		return page;
	}

	public void setPage(Page<Annunciate> page) {
		this.page = page;
	}

	public Annunciate getAnnunciate() {
		return annunciate;
	}

	public void setAnnunciate(Annunciate annunciate) {
		this.annunciate = annunciate;
	}

	public Date getCurrentDate() {
		return new Date();
	}

	public void setAnnunciateService(IAnnunciateService annunciateService) {
		this.annunciateService = annunciateService;
	}

}
