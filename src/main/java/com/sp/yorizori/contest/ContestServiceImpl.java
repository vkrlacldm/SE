package com.sp.yorizori.contest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.yorizori.common.FileManager;
import com.sp.yorizori.common.dao.CommonDAO;

@Service("contest.contestService")
public class ContestServiceImpl implements ContestService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertContest(Contest dto, String pathname) throws Exception {
		try {
			int seq = dao.selectOne("contest.seq");
			dto.setContestNum(seq);
			
			dao.insertData("contest.inserContest", dto);
			
			if(! dto.getSelectFile().isEmpty()) {
				for(MultipartFile mf : dto.getSelectFile()) {
					String fileName = fileManager.doFileUpload(mf, pathname);
					if(fileName == null) {
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
	public List<Contest> listContest(Map<String, Object> map) {
		List<Contest> list = null;
		
		try {
			list = dao.selectList("contest.listContest", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("contest.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public Contest readContest(int contestNum) {
		Contest dto = null;
		
		try {
			dto = dao.selectOne("contest.readContest", contestNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	@Override
	public void updateContest(Contest dto, String pathname) throws Exception {
		try {
			dao.updateData("contest.updateContest", dto);
			
			if(! dto.getSelectFile().isEmpty()) {
				for(MultipartFile mf : dto.getSelectFile()) {
					String fileName = fileManager.doFileUpload(mf, pathname);
					if(fileName == null) {
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
	public void deleteContest(int contestNum, String pathname) throws Exception {
		try {
			List<Contest> listFile = listFile(contestNum);
			if(listFile != null) {
				for(Contest dto : listFile) {
					fileManager.doFileDelete(dto.getFileName(), pathname);
				}				
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("contestNum", contestNum);
			deleteFile(map);
			
			dao.deleteData("contest.deleteContest", contestNum);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertFile(Contest dto) throws Exception {
		try {
			dao.insertData("contest.insertFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public List<Contest> listFile(int contestNum) {
		List<Contest> listFile = null;
		
		try {
			listFile = dao.selectList("contest.listFile", contestNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listFile;
	}
	
	@Override
	public Contest readFile(int fileNum) {
		Contest dto = null;
		
		try {
			dto = dao.selectOne("contest.readFile", fileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("contest.deleteFile", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
