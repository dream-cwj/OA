package org.exnon.dao;

import org.exnon.bean.Employee;

/**
 * 员工持久化接�?
 * 
 * @author 陈文�?
 * 
 */
public interface IEmployeeDao {

	/**
	 * 获取员工信息，只能返回唯�?��果，否则异常
	 * @param employee
	 * @return
	 */
	Employee getEmployee(Employee employee);
	
	/**
	 * 更新修改员工信息
	 * @param employee
	 */
	void updateEmployee(Employee employee);

}
