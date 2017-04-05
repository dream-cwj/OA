package org.exnon.util;

import org.exnon.bean.Employee;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class Client {
	public static void main(String[] args) {
		HibernateUtil.ddl();
		
		Session session=HibernateUtil.getCurrentSession();
		Transaction tx=session.beginTransaction();
		
		Employee zhangsan=new Employee();
		zhangsan.setSn("zhangsan");
		zhangsan.setPassword("zhangsan");
		zhangsan.setName("张三");
		session.save(zhangsan);
		
		tx.commit();
	}
}
