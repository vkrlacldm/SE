package com.sp.yorizori.user.contest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.yorizori.common.FileManager;
import com.sp.yorizori.common.dao.CommonDAO;

@Service("user.contest.contestService")
public class ContestServiceImpl implements ContestService {
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;

	@Override
	public void insertContest(Contest dto, String pathname) throws Exception {
		try {
			int seq = dao.selectOne("participation_seq");
			dto.setContestNum(seq);
			
			dao.insertData("contest.userinserContest", dto);
			
			if(! dto.getSelectFile().isEmpty()) {
				for(MultipartFile mf : dto.getSelectFile()) {
					String partPhotoName = fileManager.doFileUpload(mf, pathname);
					if(partPhotoName == null) {
						continue;
					}
					
					dto.setFileName(partPhotoName);
					
					insertFile(dto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Contest readContest(int partNum) {
		Contest dto = null;
		
		try {
			dto = dao.selectOne("user.contest.readContest", partNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateContest(Contest dto, String pathname) throws Exception {
		try {
			dao.updateData("user.contest.updateContest", dto);
			
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
	public void deleteContest(int partNum, String pathname) throws Exception {
		try {
			List<Contest> listFile = listFile(partNum);
			if(listFile != null) {
				for(Contest dto : listFile) {
					fileManager.doFileDelete(dto.getFileName(), pathname);
				}
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("partNum", partNum);
			deleteFile(map);
			
			dao.deleteData("user.contest.deleteContest", partNum);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertFile(Contest dto) throws Exception {
		try {
			dao.insertData("user.contest.insertFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Contest> listFile(int partNum) {
		List<Contest> listFile = null;
		
		try {
			listFile = dao.selectList("user.contest.listFile", partNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listFile;
	}

	@Override
	public Contest readFile(int fileNum) {
		Contest dto = null;
		
		try {
			dto = dao.selectOne("user.contest.readFile", fileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("user.contest.deleteFile", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
