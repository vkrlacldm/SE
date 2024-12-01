package com.sp.yorizori.foodclass.qna;

import java.util.List;
import java.util.Map;

public interface BoardService {
	public void insertBoard(Board dto) throws Exception;
	public int dataCount(Map<String, Object> map);
	
	public List<Board> readBoard(Map<String, Object> map);
	
	public void updateBoard(Board dto) throws Exception;
	public void deleteQuestion(Map<String, Object> map) throws Exception;
	
}
