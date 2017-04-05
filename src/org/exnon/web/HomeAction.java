package org.exnon.web;

import java.util.List;

import org.exnon.bean.Annunciate;
import org.exnon.bean.Note;
import org.exnon.service.IAnnunciateService;
import org.exnon.service.INoteService;

public class HomeAction extends BaseAction {

	private IAnnunciateService annunciateService;
	private INoteService noteService;

	private List<Annunciate> annunciates;
	private List<Note> notes;

	public String index() {
		annunciates = annunciateService.findAnnunciates();
		notes = noteService.findNotesByPage(null).getData();
		return SUCCESS;
	}

	public String page_menu() {
		return SUCCESS;
	}

	public String page_modal() {
		return SUCCESS;
	}

	public String page_nav() {
		return SUCCESS;
	}

	public String page_footer() {
		return SUCCESS;
	}

	public void setAnnunciateService(IAnnunciateService annunciateService) {
		this.annunciateService = annunciateService;
	}

	public List<Annunciate> getAnnunciates() {
		return annunciates;
	}

	public void setAnnunciates(List<Annunciate> annunciates) {
		this.annunciates = annunciates;
	}

	public void setNoteService(INoteService noteService) {
		this.noteService = noteService;
	}

	public List<Note> getNotes() {
		return notes;
	}

	public void setNotes(List<Note> notes) {
		this.notes = notes;
	}

}
