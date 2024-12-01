package com.sp.yorizori.admin.chefManage;

import java.util.List;
import java.util.Map;

public interface ChefManageService {
	public int dataCount(Map<String, Object> map);
	public List<Chef> listChef(Map<String, Object> map);
	
	public Chef readChef(String userId);
	
	public void updateFailureCountReset(String userId) throws Exception;
	public void updateChefEnabled(Map<String, Object> map) throws Exception;
	public void insertChefState(Chef dto) throws Exception;
	
	public List<Chef> listChefState(String userId);
	public Chef readChefState(String userId);
	
	public int recipeCount(Map<String, Object> map);
	public int followCount(Map<String, Object> map);
	public int classCount(Map<String, Object> map);
}
