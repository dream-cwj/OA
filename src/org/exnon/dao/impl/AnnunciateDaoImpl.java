package org.exnon.dao.impl;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.exnon.bean.Annunciate;
import org.exnon.dao.IAnnunciateDao;
import org.exnon.util.Page;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class AnnunciateDaoImpl extends HibernateDaoSupport implements
		IAnnunciateDao {

	@Override
	public Integer addAnnunciate(Annunciate annunciate) {
		Integer id = (Integer) this.getHibernateTemplate().save(annunciate);
		return id;
	}

	@Override
	public Page<Annunciate> getAnnunciates(final Page<Annunciate> page) {
		Page<Annunciate> annunciates = this.getHibernateTemplate().execute(
				new HibernateCallback<Page<Annunciate>>() {
					@Override
					public Page<Annunciate> doInHibernate(Session session)
							throws HibernateException, SQLException {
						Criteria criteria = session
								.createCriteria(Annunciate.class);
						criteria.addOrder(Order.desc("id"));

						// 统计通告总记录数
						criteria.setProjection(Projections.count("id"));
						page.setCount((Integer) criteria.uniqueResult());
						criteria.setProjection(null);

						// 查询指定记录
						criteria.setFirstResult((page.getCurrent() - 1)
								* page.getPageSize());
						criteria.setMaxResults(page.getPageSize());
						page.setData(criteria.list());

						return page;
					}
				});
		return annunciates;
	}

	@Override
	public void deleteAnnunciate(Integer id) {
		Annunciate annunciate = new Annunciate();
		annunciate.setId(id);
		this.getHibernateTemplate().delete(annunciate);
	}

	@Override
	public List<Annunciate> getAnnunciates(final Date date) {
		List<Annunciate> list = this.getHibernateTemplate().execute(
				new HibernateCallback<List<Annunciate>>() {
					@Override
					public List<Annunciate> doInHibernate(Session session)
							throws HibernateException, SQLException {
						Criteria criteria = session.createCriteria(
								Annunciate.class).addOrder(Order.desc("id"));

						criteria.add(Restrictions.le("startTime", date));
						criteria.add(Restrictions.ge("endTime", date));

						return criteria.list();
					}
				});
		return list;
	}

}
