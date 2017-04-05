package org.exnon.bean;

/**
 * 便签
 * @author 陈文�?
 *
 */
public class Note {
	
	private Integer id;
	
	private String title;
	
	private String content;
	
	private Employee creator;	//创建�?

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Employee getCreator() {
		return creator;
	}

	public void setCreator(Employee creator) {
		this.creator = creator;
	}

}
