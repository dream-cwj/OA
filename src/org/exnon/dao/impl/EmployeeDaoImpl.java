package org.exnon.dao.impl;

import java.sql.SQLException;

import org.exnon.bean.Employee;
import org.exnon.dao.IEmployeeDao;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class EmployeeDaoImpl extends HibernateDaoSupport implements
		IEmployeeDao {

	@Override
	public Employee getEmployee(final Employee employee) {
		Employee emp = this.getHibernateTemplate().execute(
				new HibernateCallback<Employee>() {
					@Override
					public Employee doInHibernate(Session session)
							throws HibernateException, SQLException {
						Criteria criteria = session
								.createCriteria(Employee.class);

						if (employee.getSn() != null
								&& !employee.getSn().isEmpty())
							criteria.add(Restrictions.eq("sn", employee.getSn()));

						if (employee.getPassword() != null
								&& !employee.getPassword().isEmpty())
							criteria.add(Restrictions.eq("password",
									employee.getPassword()));

						return (Employee) criteria.uniqueResult();
					}
				});
		return emp;
	}

	@Override
	public void updateEmployee(Employee employee) {
		this.getHibernateTemplate().update(employee);
	}

}
