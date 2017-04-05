package org.exnon.service.impl;

import org.exnon.bean.Employee;
import org.exnon.bean.Note;
import org.exnon.dao.INoteDao;
import org.exnon.service.INoteService;
import org.exnon.util.Page;

public class NoteServiceImpl extends BaseService implements INoteService {

	private INoteDao noteDao;

	public void setNoteDao(INoteDao noteDao) {
		this.noteDao = noteDao;
	}

	@Override
	public boolean saveNote(Note note) {
		if (note == null)
			return false;
		Employee current_user = (Employee) this.getSessionMap().get("user");
		note.setCreator(current_user);
		if (note.getId() == null)
			noteDao.addNote(note);
		else
			noteDao.updateNote(note);
		return true;
	}

	@Override
	public boolean removeNote(Note note) {
		if (note == null || note.getId() == null)
			return false;
		noteDao.deleteNote(note);
		return true;
	}

	@Override
	public Page<Note> findNotesByPage(Page<Note> page) {
		if (page == null)
			page = new Page<Note>();
		page.setPageSize(4);
		Note note = new Note();
		note.setCreator((Employee) this.getSessionMap().get("user"));
		page = noteDao.getNotes(note, page);
		return page;
	}

}
