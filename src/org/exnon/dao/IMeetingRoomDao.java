package org.exnon.dao;

import org.exnon.bean.MeetingRoom;
import org.exnon.util.Page;

/**
 * 会议室持久层接口
 * 
 * @author 陈文�?
 * 
 */
public interface IMeetingRoomDao {

	/**
	 * 添加会议�?
	 * 
	 * @param meetingRoom
	 * @return
	 */
	Integer addMeetingRoom(MeetingRoom meetingRoom);

	/**
	 * 删除会议室，id不能为空
	 * 
	 * @param meetingRoom
	 */
	void deleteMeetingRoom(MeetingRoom meetingRoom);

	/**
	 * 更新会议室信�?
	 * 
	 * @param meetingRoom
	 */
	void updateMeetingRoom(MeetingRoom meetingRoom);
	
	/**
	 * 分页查询会议室列�?
	 * @param page
	 * @return
	 */
	Page<MeetingRoom> getMeetingRooms(Page<MeetingRoom> page);

}
