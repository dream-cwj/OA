package org.exnon.web;

import org.exnon.bean.Note;
import org.exnon.service.INoteService;
import org.exnon.util.Page;

public class NoteAction extends BaseAction {

	private INoteService noteService;

	private Page<Note> page;
	private Note note;

	public String list() {
		page = noteService.findNotesByPage(page);
		return "list";
	}

	public String save() {
		boolean flag = noteService.saveNote(note);
		this.result = flag;
		return "result";
	}

	public String delete() {
		boolean flag = noteService.removeNote(note);
		this.result = flag;
		return "result";
	}

	public Note getNote() {
		return note;
	}

	public void setNote(Note note) {
		this.note = note;
	}

	public Page<Note> getPage() {
		return page;
	}

	public void setPage(Page<Note> page) {
		this.page = page;
	}

	public void setNoteService(INoteService noteService) {
		this.noteService = noteService;
	}

}
