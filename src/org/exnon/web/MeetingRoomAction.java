package org.exnon.web;

import org.exnon.bean.MeetingRoom;
import org.exnon.service.IMeetingRoomService;
import org.exnon.util.Page;

public class MeetingRoomAction extends BaseAction {
	
	private IMeetingRoomService meetingRoomService;

	public void setMeetingRoomService(IMeetingRoomService meetingRoomService) {
		this.meetingRoomService = meetingRoomService;
	}
	
	private Page<MeetingRoom> page;
	private MeetingRoom meetingRoom;
	
	public String list(){
		page = meetingRoomService.findMeetingRoomsByPage(page);
		return "list";
	}
	
	public String save(){
		boolean flag=meetingRoomService.saveMeetingRoom(meetingRoom);
		this.result = flag;
		return "result";
	}
	
	public String delete(){
		boolean flag = meetingRoomService.removeMeetingRoom(meetingRoom);
		this.result = flag;
		return "result";
	}

	public MeetingRoom getMeetingRoom() {
		return meetingRoom;
	}

	public void setMeetingRoom(MeetingRoom meetingRoom) {
		this.meetingRoom = meetingRoom;
	}

	public Page<MeetingRoom> getPage() {
		return page;
	}

	public void setPage(Page<MeetingRoom> page) {
		this.page = page;
	}

}
