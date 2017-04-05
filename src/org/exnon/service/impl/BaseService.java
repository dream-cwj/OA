package org.exnon.service.impl;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

public class BaseService {

	protected Map<String, Object> getSessionMap() {
		return ActionContext.getContext().getSession();
	}

}
