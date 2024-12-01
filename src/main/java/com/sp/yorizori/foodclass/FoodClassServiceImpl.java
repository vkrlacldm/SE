package com.sp.yorizori.foodclass;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yorizori.common.FileManager;
import com.sp.yorizori.common.dao.CommonDAO;
import com.sp.yorizori.mypage.MyClass;

@Service("foodclass.foodClassService")
public class FoodClassServiceImpl implements FoodClassService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertClass(FoodClass dto, String pathname) throws Exception {
		try {
			int seq = dao.selectOne("foodClass.classSeq");
			dto.setClassCode(seq);
			
			dao.insertData("foodClass.insertClass", dto);
			
			String saveFilename;
			if(! dto.getImageFile().isEmpty()) {
				saveFilename = fileManager.doFileUpload(dto.getImageFile(), pathname);
				dto.setImageFileName(saveFilename);
			}
			if(! dto.getPreviewFile().isEmpty()) {
				saveFilename = fileManager.doFileUpload(dto.getPreviewFile(), pathname);
				dto.setPreviewFileName(saveFilename);
			}
			if(! dto.getVideoFile().isEmpty()) {
				saveFilename = fileManager.doFileUpload(dto.getVideoFile(), pathname);
				dto.setVideoFileName(saveFilename);
			}
			
			insertFile(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<FoodClass> listClass(Map<String, Object> map) {
		List<FoodClass> list = null;
		
		try {
			list = dao.selectList("foodClass.listClass", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("foodClass.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public FoodClass readClass(int classCode) {
		FoodClass dto = null;
		
		try {
			dto = dao.selectOne("foodClass.readClass", classCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateHitCount(int classCode) throws Exception {
		try {
			dao.updateData("foodClass.updateHitCount", classCode);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	@Override
	public void insertFile(FoodClass dto) throws Exception {
		try {
			dao.insertData("foodClass.insertFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<FoodClass> listFile(int classCode) {
		List<FoodClass> listFile = null;
		
		try {
			listFile = dao.selectList("foodClass.listFile", classCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listFile;
	}

	@Override
	public FoodClass searchFile(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FoodClass readFile(int fileNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertClassLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("foodClass.insertClassLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteClassLike(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("foodClass.deleteClassLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int classLikeCount(int num) {
		int result = 0;
		
		try {
			result = dao.selectOne("foodClass.classLikeCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean userClassLike(Map<String, Object> map) {
		boolean b = false;
		
		try {
			int result = dao.selectOne("foodClass.userClassLike", map);
			if(result > 0) {
				b = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	@Override
	public List<FoodClass> classCategory(Map<String, Object> map) {
		List<FoodClass> list = null;
		
		try {
			list = dao.selectList("foodClass.classCategory", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<MyClass> readReview(Map<String, Object> map) {
		List<MyClass> list = null;
		
		try {
			list = dao.selectList("foodClass.readReview", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int reviewCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("foodClass.reviewCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
