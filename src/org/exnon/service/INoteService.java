package org.exnon.service;

import org.exnon.bean.Note;
import org.exnon.util.Page;

/**
 * 便签业务层接口
 * @author 陈文健
 *
 */
public interface INoteService {
	
	/**
	 * 保存便签，如果id存在,则修改便签
	 * @param note
	 * @return
	 */
	boolean saveNote(Note note);
	
	/**
	 * 移除便签
	 * @param note
	 * @return
	 */
	boolean removeNote(Note note);
	
	/**
	 * 分页查询便签列表
	 * @param page
	 * @return
	 */
	Page<Note> findNotesByPage(Page<Note> page);

}
