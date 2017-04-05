package org.exnon.dao;

import org.exnon.bean.Note;
import org.exnon.util.Page;

/**
 * 便签持久化接�?
 * 
 * @author 陈文�?
 * 
 */
public interface INoteDao {

	/**
	 * 添加�?��新的便签
	 * 
	 * @param note
	 * @return
	 */
	Integer addNote(Note note);

	/**
	 * 修改便签内容，id 不能为空
	 * 
	 * @param note
	 */
	void updateNote(Note note);

	/**
	 * 删除便签内容�?id 不能为空
	 * 
	 * @param note
	 */
	void deleteNote(Note note);

	/**
	 * 分页获取登录用户的便�?
	 * @param note	便签查询条件
	 * @param page	分页数据
	 * @return
	 */
	Page<Note> getNotes(Note note, Page<Note> page);
	
	/**
	 * 根据id获取便签
	 * @param id
	 * @return
	 */
	Note getNote(Integer id);

}
