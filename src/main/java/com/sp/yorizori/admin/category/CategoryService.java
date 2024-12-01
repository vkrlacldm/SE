package com.sp.yorizori.admin.category;

import java.util.List;
import java.util.Map;

public interface CategoryService {
	public void insertFaq(Category dto) throws Exception;
	public int dataCount(Map<String, Object> map);
	public List<Category> listCategory(Map<String, Object> map);
	
	public void updateFaq(Category dto) throws Exception;
	public void deleteFaq(Map<String, Object> map) throws Exception;
}
