package com.sp.yorizori.foodclass.qna;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yorizori.common.dao.CommonDAO;

@Service("foodclass.qna.boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertBoard(Board dto) throws Exception {
		try {
			dao.insertData("classQna.insertBoard", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("classQna.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Board> readBoard(Map<String, Object> map) {
		List<Board> list = null;
		
		try {
			list = dao.selectList("classQna.readBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public void updateBoard(Board dto) throws Exception {
		try {
			dao.updateData("classQna.insertAnswer", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public void deleteQuestion(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("classQna.deleteQuestion", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
