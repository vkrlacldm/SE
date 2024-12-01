package com.sp.yorizori.admin.notify;

import java.util.List;
import java.util.Map;

public interface NotifyService {
	public int dataCount(Map<String, Object> map);
	public List<Notify> listCategory(Map<String, Object> map);
	
	public void updateFaq(Notify dto) throws Exception;
	public void deleteFaq(Map<String, Object> map) throws Exception;

}
