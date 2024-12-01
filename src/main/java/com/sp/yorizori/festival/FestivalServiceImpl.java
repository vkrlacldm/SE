package com.sp.yorizori.festival;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.yorizori.common.FileManager;
import com.sp.yorizori.common.dao.CommonDAO;

@Service("festival.festivalService")
public class FestivalServiceImpl implements FestivalService {
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;

	@Override
	public void insertFest(Festival dto, String pathname) throws Exception {
		try {
			int seq = dao.selectOne("festival.seq");
			dto.setNum(seq);
			
			dao.insertData("festival.insertFest", dto);
			
			if (! dto.getSelectFile().isEmpty()) {
				for (MultipartFile mf : dto.getSelectFile()) {
					String fileName = fileManager.doFileUpload(mf, pathname);
					if (fileName == null) {
						continue;
					}
					
					dto.setFileName(fileName);
					
					insertFile(dto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Festival> listFest(Map<String, Object> map) {
		List<Festival> list = null;
		
		try {
			list = dao.selectList("festival.listFest", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("festival.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public Festival searchFest(Map<String, Object> map) {
		Festival dto = null;
		
		try {
			dto = dao.selectOne("festival.searchFest", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Festival readFest(int num) {
		Festival dto = null;
		
		try {
			dto = dao.selectOne("festival.readFest", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Festival preReadFest(Map<String, Object> map) {
		Festival dto = null;
		
		try {
			dto = dao.selectOne("festival.preReadFest", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Festival nextReadFest(Map<String, Object> map) {
		Festival dto = null;
		
		try {
			dto = dao.selectOne("festival.nextReadFest", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateFest(Festival dto, String pathname) throws Exception {
		try {
			dao.updateData("festival.updateFest", dto);
			
			if (! dto.getSelectFile().isEmpty()) {
				for (MultipartFile mf : dto.getSelectFile()) {
					String fileName = fileManager.doFileUpload(mf, pathname);
					if (fileName == null) {
						continue;
					}
					
					dto.setFileName(fileName);
					
					insertFile(dto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteFest(int num, String pathname) throws Exception {
		try {
			List<Festival> listFile = listFile(num);
			if (listFile != null) {
				for (Festival dto : listFile) {
					fileManager.doFileDelete(dto.getFileName(), pathname);
				}
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "festivalNum");
			map.put("num", num);
			deleteFile(map);
			
			dao.deleteData("festival.deleteFest", num);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertFile(Festival dto) throws Exception {
		try {
			dao.insertData("festival.insertFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Festival> listFile(int num) {
		List<Festival> listFile = null;
		
		try {
			listFile = dao.selectList("festival.listFile", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listFile;
	}
	
	@Override
	public Festival searchFile(int num) {
		Festival dto = null;
		
		try {
			dto = dao.selectOne("festival.searchFile", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Festival readFile(int fileNum) {
		Festival dto = null;
		
		try {
			dto = dao.selectOne("festival.readFile", fileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("festival.deleteFile", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertFestLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("festival.insertFestLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteFestLike(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("festival.deleteFestLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int festLikeCount(int num) {
		int result = 0;
		
		try {
			result = dao.selectOne("festival.festLikeCount", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public boolean userFestLiked(Map<String, Object> map) {
		boolean result = false;
		
		try {
			int cnt = dao.selectOne("festival.userFestLiked", map);
			if (cnt != 0) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void insertReply(Reply dto) throws Exception {
		try {
			dao.insertData("festival.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("festival.replyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list = null;
		
		try {
			list = dao.selectList("festival.listReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("festival.deleteReply", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
