package com.sp.yorizori.user.contest;

import java.util.List;
import java.util.Map;

public interface ContestService {
	public void insertContest(Contest dto, String pathname) throws Exception;
	public Contest readContest(int partNum);
	public void updateContest(Contest dto, String pathname) throws Exception;
	public void deleteContest(int partNum, String pathname) throws Exception;
	public void insertFile(Contest dto) throws Exception;
	public List<Contest> listFile(int partNum);
	public Contest readFile(int fileNum);
	public void deleteFile(Map<String, Object> map) throws Exception;

}
