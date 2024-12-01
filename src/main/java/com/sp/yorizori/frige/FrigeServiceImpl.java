package com.sp.yorizori.frige;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yorizori.common.dao.CommonDAO;

@Service("frige.frigeService")
public class FrigeServiceImpl implements FrigeService {
	
	@Autowired
	private CommonDAO dao;

	@Override
	public List<Frige> listIngredient() {
		List<Frige> list = null;
		
		try {
			list = dao.selectList("frige.listIngredient");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Frige> listRecipe(Map<String, Object> map) {
		List<Frige> list = null;
		
		try {
			list = dao.selectList("frige.listRecipe", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;	
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("frige.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}


}
