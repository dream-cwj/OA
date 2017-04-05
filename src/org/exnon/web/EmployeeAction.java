package org.exnon.web;

import java.util.HashMap;
import java.util.Map;

import org.exnon.bean.Employee;
import org.exnon.service.IEmployeeService;

public class EmployeeAction extends BaseAction {

	private IEmployeeService employeeService;

	private Employee employee;
	private String verify;

	public String login() {
		employee = employeeService.login(employee);
		Map<String, Object> result=new HashMap<String, Object>();
		result.put("accessGranted", employee != null);
		this.result = result;
		return "result";
	}
	
	public String logout(){
		employeeService.logout();
		return "logout";
	}
	
	public String verifyPassword(){
		boolean flag = employeeService.verifyPassword(employee);
		this.result = flag;
		return "result";
	}
	
	public String alterPassword(){
		boolean flag = employeeService.alterPassword(employee);
		this.result = flag;
		return "result";
	}

	public String getVerify() {
		return verify;
	}

	public void setVerify(String verify) {
		this.verify = verify;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public void setEmployeeService(IEmployeeService employeeService) {
		this.employeeService = employeeService;
	}

}
