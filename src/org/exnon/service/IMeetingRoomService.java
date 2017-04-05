package org.exnon.service;

import org.exnon.bean.MeetingRoom;
import org.exnon.util.Page;

/**
 * 会议室业务层接口
 * 
 * @author 陈文健
 * 
 */
public interface IMeetingRoomService {

	/**
	 * 保存会议室信息，id为空时添加，否则为修改
	 * @param meetingRoom
	 * @return
	 */
	boolean saveMeetingRoom(MeetingRoom meetingRoom);
	
	/**
	 * 删除会议室信息
	 * @param meetingRoom
	 * @return
	 */
	boolean removeMeetingRoom(MeetingRoom meetingRoom);
	
	/**
	 * 根据分页查询会议室信息
	 * @param page
	 * @return
	 */
	Page<MeetingRoom> findMeetingRoomsByPage(Page<MeetingRoom> page);

}
