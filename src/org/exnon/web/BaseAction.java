package org.exnon.web;

import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport {
	
	protected Object result;

	public Object getResult() {
		return result;
	}

	public void setResult(Object result) {
		this.result = result;
	}

}
