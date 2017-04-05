package org.exnon.dao.impl;

import java.sql.SQLException;

import org.exnon.bean.Note;
import org.exnon.dao.INoteDao;
import org.exnon.util.Page;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class NoteDaoImpl extends HibernateDaoSupport implements INoteDao {

	@Override
	public Integer addNote(Note note) {
		Integer id = (Integer) this.getHibernateTemplate().save(note);
		return id;
	}

	@Override
	public void updateNote(Note note) {
		this.getHibernateTemplate().update(note);
	}

	@Override
	public void deleteNote(Note note) {
		this.getHibernateTemplate().delete(note);
	}

	@Override
	public Page<Note> getNotes(final Note note, final Page<Note> page) {
		Page<Note> notes = this.getHibernateTemplate().execute(
				new HibernateCallback<Page<Note>>() {
					@Override
					public Page<Note> doInHibernate(Session session)
							throws HibernateException, SQLException {
						Criteria criteria = session.createCriteria(Note.class)
								.addOrder(Order.desc("id"));

						if (note.getTitle() != null
								&& !note.getTitle().isEmpty())
							criteria.add(Restrictions.like("title",
									note.getTitle(), MatchMode.ANYWHERE));
						if (note.getContent() != null
								&& !note.getContent().isEmpty())
							criteria.add(Restrictions.like("content",
									note.getContent(), MatchMode.ANYWHERE));
						if (note.getCreator() != null
								&& note.getCreator().getSn() != null)
							criteria.add(Restrictions.eq("creator.sn", note
									.getCreator().getSn()));

						criteria.setProjection(Projections.count("id"));
						page.setCount((Integer) criteria.uniqueResult());
						criteria.setProjection(null);

						criteria.setFirstResult((page.getCurrent() - 1)
								* page.getPageSize());
						criteria.setMaxResults(page.getPageSize());
						page.setData(criteria.list());

						return page;
					}
				});
		return notes;
	}

	@Override
	public Note getNote(Integer id) {
		Note note = this.getHibernateTemplate().get(Note.class, id);
		return note;
	}

}
