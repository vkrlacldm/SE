package com.sp.yorizori.category;

import java.util.List;

import java.util.Map;

public interface CategoryService {
	public void insertCategory(Category dto, String pathname) throws Exception;
	public int dataCount(Map<String, Object> map);
	public List<Category> listCategory(Map<String, Object> map);
	public Category readCategory(int num);
	public Category preReadCategory(Map<String, Object> map);
	public Category nextReadCategory(Map<String, Object> map);
	public void updateCategory(Category dto, String pathname) throws Exception;
	public void deleteCateogry(int num, String pathname) throws Exception;
	void deleteCategory(int num, String pathname) throws Exception;
	

}
