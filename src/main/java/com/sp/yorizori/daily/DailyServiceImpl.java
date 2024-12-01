package com.sp.yorizori.daily;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yorizori.common.FileManager;
import com.sp.yorizori.common.dao.CommonDAO;

@Service("daily.dailyService")
public class DailyServiceImpl implements DailyService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public void insertDaily(Daily dto, String pathname) throws Exception {
		try {
			
			int seq = dao.selectOne("daily.seq");
			dto.setDailyNum(seq);
			
			dao.insertData("daily.insertDaily", dto);
			
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if(saveFilename != null) {
				dto.setDailyPhotoName(saveFilename);
				dao.insertData("daily.insertDailyFile", dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
			throw e;
		}
		
	}

	@Override
	public List<Daily> listDaily(Map<String, Object> map) {
		List<Daily> list = null;
		
		try {
			list = dao.selectList("daily.listDaily", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("daily.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Daily readDaily(int dailyNum) {
		Daily dto = null;
		
		try {
			dto = dao.selectOne("daily.readDaily", dailyNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateHitCount(int dailyNum) throws Exception {
		
		try {
			dao.updateData("daily.updateHitCount", dailyNum);
			
		} catch (Exception e) {
			e.printStackTrace();
			
			throw e;
		}
		
	}

	@Override
	public Daily preReadDaily(Map<String, Object> map) {
		Daily dto = null;
		
		try {
			dto = dao.selectOne("daily.preReadDaily", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Daily nextReadDaily(Map<String, Object> map) {
		Daily dto = null;
		
		try {
			dto = dao.selectOne("daily.nextReadDaily", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateDaily(Daily dto, String pathname) throws Exception {

		try {
			dao.updateData("daily.updateDaily", dto);

			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if(saveFilename != null) {
				
				if(dto.getDailyPhotoName() != null) {
					fileManager.doFileDelete(dto.getDailyPhotoName(), pathname);
				}
				
				dto.setDailyPhotoName(saveFilename);
				dao.updateData("daily.updateFile", dto);
			}

			
		} catch (Exception e) {
			e.printStackTrace();
			
			throw e;
		}
	}

	@Override
	public void deleteDaily(int dailyNum, String pathname) throws Exception {
		try {
			if (pathname != null) {
				fileManager.doFileDelete(pathname);
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "dailyNum");
			map.put("dailyNum", dailyNum);
			dao.deleteData("daily.deleteFile", map);		

			dao.deleteData("daily.deleteDaily", dailyNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
		

	@Override
	public void insertReply(DailyReply dto) throws Exception {
		try {
			dao.insertData("daily.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<DailyReply> listReply(Map<String, Object> map) {
		List<DailyReply> list = null;
		
		try {
			list = dao.selectList("daily.listReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("daily.replyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("daily.deleteReply", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}



	@Override
	public void insertReplyLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("daily.insertReplyLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Map<String, Object> replyLikeCount(Map<String, Object> map) {
		Map<String, Object> countMap = null;
		
		try {
			countMap = dao.selectOne("daily.replyLikeCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return countMap;
	}

	@Override
	public void insertFile(Daily dto) throws Exception {
		try {
			dao.insertData("daily.insertFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Daily> listFile(int dailyNum) {
		List<Daily> listFile = null;

		try {
			listFile = dao.selectList("daily.listFile", dailyNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return listFile;

	}

	@Override
	public Daily readFile(int dailyPhotoNum) {
		Daily dto = null;

		try {
			dto = dao.selectOne("daily.readFile", dailyPhotoNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public Daily readFile2(int dailyNum) {
		Daily dto = null;

		try {
			dto = dao.selectOne("daily.readFile2", dailyNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

}
