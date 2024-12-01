package com.sp.yorizori.daily;

import java.util.List;
import java.util.Map;

public interface DailyService {
	public void insertDaily(Daily dto, String pathname) throws Exception;
	public List<Daily> listDaily(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Daily readDaily(int dailyNum);
	public void updateHitCount(int dailyNum) throws Exception;
	public Daily preReadDaily(Map<String, Object> map);
	public Daily nextReadDaily(Map<String, Object> map);
	public void updateDaily(Daily dto, String pathname) throws Exception;
	public void deleteDaily(int dailyNum, String pathname) throws Exception;
	
	public void insertFile(Daily dto) throws Exception;
	public List<Daily> listFile(int dailyNum);
	public Daily readFile(int dailyPhotoNum);
	public Daily readFile2(int dailyNum);
	
	public void insertReply(DailyReply dto) throws Exception;
	public List<DailyReply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	public void insertReplyLike(Map<String, Object> map) throws Exception;
	public Map<String, Object> replyLikeCount(Map<String, Object> map);

}
