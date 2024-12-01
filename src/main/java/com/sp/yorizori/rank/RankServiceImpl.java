package com.sp.yorizori.rank;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yorizori.common.dao.CommonDAO;

@Service("rank.rankService")
public class RankServiceImpl implements RankService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<RankRecipe> rankRecipe() {
		List<RankRecipe> list = null;
		
		try {
			list = dao.selectList("rank.rankRecipe");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<RankChef> rankChef() {
		List<RankChef> list = null;
		
		try {
			list = dao.selectList("rank.rankChef");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
