package com.sp.yorizori.contest;

import java.util.List;
import java.util.Map;

public interface ContestService {
	public void insertContest(Contest dto, String pathname) throws Exception;
	public List<Contest> listContest(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Contest readContest(int contestNum);
	
	public void updateContest(Contest dto, String pathname) throws Exception;
	public void deleteContest(int contestNum, String pathname) throws Exception;

	public void insertFile(Contest dto) throws Exception;
	public List<Contest> listFile(int contestNum);
	public Contest readFile(int fileNum);
	public void deleteFile(Map<String, Object> map) throws Exception;

}
