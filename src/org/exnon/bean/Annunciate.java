package org.exnon.bean;

import java.util.Date;

/**
 * 通告
 * @author 陈文�?
 *
 */
public class Annunciate {
	
	private Integer id;
	
	private String title;
	
	private Boolean urgency;	//是否紧�?
	
	private Date startTime;
	
	private Date endTime;
	
	private Date publishTime;	//发布时间
	
	private Employee publisher;	//发布�?
	
	private String content;

	public Annunciate() {
		super();
	}

	public Annunciate(Integer id, String title, Boolean urgency,
			Date startTime, Date endTime, Date publishTime, Employee publisher,
			String content) {
		super();
		this.id = id;
		this.title = title;
		this.urgency = urgency;
		this.startTime = startTime;
		this.endTime = endTime;
		this.publishTime = publishTime;
		this.publisher = publisher;
		this.content = content;
	}

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

	public Boolean getUrgency() {
		return urgency;
	}

	public void setUrgency(Boolean urgency) {
		this.urgency = urgency;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Date getPublishTime() {
		return publishTime;
	}

	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}

	public Employee getPublisher() {
		return publisher;
	}

	public void setPublisher(Employee publisher) {
		this.publisher = publisher;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}	

}
