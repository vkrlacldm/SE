package com.sp.yorizori.festival;

import java.util.List;
import java.util.Map;

public interface FestivalService {
	public void insertFest(Festival dto, String pathname) throws Exception;
	public List<Festival> listFest(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Festival searchFest(Map<String, Object> map);
	public Festival readFest(int num);
	public Festival preReadFest(Map<String, Object> map);
	public Festival nextReadFest(Map<String, Object> map);
	public void updateFest(Festival dto, String pathname) throws Exception;
	public void deleteFest(int num, String pathname) throws Exception;
	
	public void insertFile(Festival dto) throws Exception;
	public List<Festival> listFile(int num);
	public Festival searchFile(int num);
	public Festival readFile(int fileNum);
	public void deleteFile(Map<String, Object> map) throws Exception;
	
	public void insertFestLike(Map<String, Object> map) throws Exception;
	public void deleteFestLike(Map<String, Object> map) throws Exception;
	public int festLikeCount(int num);
	public boolean userFestLiked(Map<String, Object> map);
	
	public void insertReply(Reply dto) throws Exception;
	public int replyCount(Map<String, Object> map);
	public List<Reply> listReply(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
}
