package com.sp.yorizori.category;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yorizori.common.FileManager;
import com.sp.yorizori.common.dao.CommonDAO;

@Service("category.CategoryService")
public class CategoryServiceImpl implements CategoryService{
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;

	@Override
	public void insertCategory(Category dto, String pathname) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if (saveFilename != null) {
				dto.setRecipePhotoName(saveFilename);

				dao.insertData("category.insertCategory", dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.selectOne("category.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<Category> listCategory(Map<String, Object> map) {
		List<Category> list = null;

		try {
			list = dao.selectList("category.listCategory", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public Category readCategory(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Category preReadCategory(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Category nextReadCategory(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateCategory(Category dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteCateogry(int num, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteCategory(int num, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
