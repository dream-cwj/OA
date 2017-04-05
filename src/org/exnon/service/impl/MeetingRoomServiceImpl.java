package org.exnon.service.impl;

import org.exnon.bean.MeetingRoom;
import org.exnon.dao.IMeetingRoomDao;
import org.exnon.service.IMeetingRoomService;
import org.exnon.util.Page;

/**
 * 会议室业务层实现类
 * 
 * @author 陈文健
 * 
 */
public class MeetingRoomServiceImpl extends BaseService implements
		IMeetingRoomService {
	
	private IMeetingRoomDao meetingRoomDao;

	public void setMeetingRoomDao(IMeetingRoomDao meetingRoomDao) {
		this.meetingRoomDao = meetingRoomDao;
	}

	@Override
	public boolean saveMeetingRoom(MeetingRoom meetingRoom) {
		if(meetingRoom==null) return false;
		if(meetingRoom.getId()==null)
			meetingRoomDao.addMeetingRoom(meetingRoom);
		else
			meetingRoomDao.updateMeetingRoom(meetingRoom);
		return true;
	}

	@Override
	public boolean removeMeetingRoom(MeetingRoom meetingRoom) {
		if (meetingRoom==null||meetingRoom.getId()==null) {
			return false;
		}
		meetingRoomDao.deleteMeetingRoom(meetingRoom);
		return true;
	}

	@Override
	public Page<MeetingRoom> findMeetingRoomsByPage(Page<MeetingRoom> page) {
		if (page==null) {
			page=new Page<MeetingRoom>();
			page.setPageSize(4);
		}
		page = meetingRoomDao.getMeetingRooms(page);
		return page;
	}

}
