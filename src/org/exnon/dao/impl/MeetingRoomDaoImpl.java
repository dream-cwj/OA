package org.exnon.dao.impl;

import java.sql.SQLException;

import org.exnon.bean.MeetingRoom;
import org.exnon.dao.IMeetingRoomDao;
import org.exnon.util.Page;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class MeetingRoomDaoImpl extends HibernateDaoSupport implements
		IMeetingRoomDao {

	@Override
	public Integer addMeetingRoom(MeetingRoom meetingRoom) {
		Integer id = (Integer) this.getHibernateTemplate().save(meetingRoom);
		return id;
	}

	@Override
	public void deleteMeetingRoom(MeetingRoom meetingRoom) {
		this.getHibernateTemplate().delete(meetingRoom);
	}

	@Override
	public void updateMeetingRoom(MeetingRoom meetingRoom) {
		this.getHibernateTemplate().update(meetingRoom);
	}

	@Override
	public Page<MeetingRoom> getMeetingRooms(final Page<MeetingRoom> page) {
		Page<MeetingRoom> list = this.getHibernateTemplate().execute(
				new HibernateCallback<Page<MeetingRoom>>() {
					@Override
					public Page<MeetingRoom> doInHibernate(Session session)
							throws HibernateException, SQLException {
						Criteria criteria = session
								.createCriteria(MeetingRoom.class);

						criteria.setProjection(Projections.count("id"));
						page.setCount((Integer) criteria.uniqueResult());
						criteria.setProjection(null);
						
						criteria.setFirstResult((page.getCurrent()-1)*page.getPageSize());
						criteria.setMaxResults(page.getPageSize());
						page.setData(criteria.list());

						return page;
					}
				});
		return list;
	}

}
