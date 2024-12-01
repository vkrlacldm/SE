package com.sp.yorizori.admin.chefManage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yorizori.common.dao.CommonDAO;

@Service("chefManage.chefManageService")
public class ChefManageServiceImpl implements ChefManageService {
	@Autowired
	private CommonDAO dao;

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("chefManage.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Chef> listChef(Map<String, Object> map) {
		List<Chef> list = null;
		
		try {
			list = dao.selectList("chefManage.listChef", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Chef readChef(String userId) {
		Chef dto = null;
		
		try {
			dto = dao.selectOne("chefManage.readChef", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		return dto;
	}
	
	@Override
	public void updateFailureCountReset(String userId) throws Exception {
		try {
			dao.updateData("chefManage.updateFailureCountReset", userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateChefEnabled(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("chefManage.updateChefEnabled", map);
			dao.updateData("chefManage.updateMemberRole", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertChefState(Chef dto) throws Exception {
		try {
			dao.updateData("chefManage.insertChefState", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Chef> listChefState(String userId) {
		List<Chef> list = null;
		
		try {
			list = dao.selectList("chefManage.listChefState", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Chef readChefState(String userId) {
		Chef dto = null;
		
		try {
			dto = dao.selectOne("chefManage.readChefState", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int recipeCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("chefManage.recipeCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int followCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("chefManage.followCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int classCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("chefManage.classCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
