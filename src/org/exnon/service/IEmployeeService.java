package org.exnon.service;

import org.exnon.bean.Employee;

/**
 * 员工业务接口
 * 
 * @author 陈文健
 * 
 */
public interface IEmployeeService {

	/**
	 * 员工登录，登录成功返回登录后员工实例，失败则返回 null
	 * @param employee
	 * @return
	 */
	Employee login(Employee employee);
	
	/**
	 * 员工登出，清除员工所有回话信息
	 */
	void logout();
	
	/**
	 * 验证密码
	 * @param employee
	 * @return
	 */
	boolean verifyPassword(Employee employee);
	
	/**
	 * 修改员工登录密码
	 * @param employee
	 */
	boolean alterPassword(Employee employee);

}
