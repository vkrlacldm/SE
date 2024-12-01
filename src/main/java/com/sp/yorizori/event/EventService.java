package com.sp.yorizori.event;

import java.util.List;
import java.util.Map;

public interface EventService {
	public void insertEvent(Event dto, String pathname) throws Exception;
	public List<Event> listEvent(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Event readEvent(int eventNum);
	
	public void updateEvent(Event dto, String pathname) throws Exception;
	public void deleteEvent(int eventNum, String pathname) throws Exception;
	
	public void insertFile(Event dto) throws Exception;
	public List<Event> listFile(int eventNum);
	public Event readFile(int fileNum);
	public void deleteFile(Map<String, Object> map) throws Exception;
	
}
