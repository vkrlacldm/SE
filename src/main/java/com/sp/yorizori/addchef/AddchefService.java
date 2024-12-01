package com.sp.yorizori.addchef;

import java.util.Map;

public interface AddchefService {
	
	public void insertAddchef(Addchef dto) throws Exception;
	public void updateAcceptance(Map<String, Object> map) throws Exception;
	public Addchef readAddchef(String userId);
	
	
	

}
