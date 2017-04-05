package org.exnon.service.impl;

import org.exnon.bean.Employee;
import org.exnon.dao.IEmployeeDao;
import org.exnon.service.IEmployeeService;

public class EmployeeServiceImpl extends BaseService implements
		IEmployeeService {

	private IEmployeeDao employeeDao;

	public void setEmployeeDao(IEmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}

	@Override
	public Employee login(Employee employee) {
		if (employee == null || employee.getSn() == null
				|| employee.getPassword() == null || employee.getSn().isEmpty()
				|| employee.getPassword().isEmpty())
			return null;

		employee = employeeDao.getEmployee(employee);
		this.getSessionMap().put("user", employee);

		return employee;
	}

	@Override
	public void logout() {
		this.getSessionMap().clear();
	}

	@Override
	public boolean alterPassword(Employee employee) {
		if (employee == null || employee.getPassword() == null
				|| employee.getPassword().isEmpty())
			return false;
		String password = employee.getPassword();
		employee = (Employee) this.getSessionMap().get("user");
		Employee emp = employeeDao.getEmployee(employee);
		emp.setPassword(password);
		employeeDao.updateEmployee(emp);
		return true;
	}

	@Override
	public boolean verifyPassword(Employee employee) {
		Employee emp = (Employee) this.getSessionMap().get("user");
		return emp.getPassword().equals(employee.getPassword());
	}

}
