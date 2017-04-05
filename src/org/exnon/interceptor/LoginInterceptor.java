package org.exnon.interceptor;

import org.exnon.bean.Employee;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		Employee employee = (Employee) ActionContext.getContext().getSession()
				.get("user");
		if (employee == null)
			return "login";
		return invocation.invoke();
	}

}
