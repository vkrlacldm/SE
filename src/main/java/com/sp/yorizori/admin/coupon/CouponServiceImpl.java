package com.sp.yorizori.admin.coupon;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.yorizori.common.FileManager;
import com.sp.yorizori.common.dao.CommonDAO;

@Service("admin.coupon.couponService")
public class CouponServiceImpl implements CouponService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired FileManager fileManager;

	@Override
	public void insertCoupon(Coupon dto, String pathname) throws Exception {
		try {
			int seq = dao.selectOne("coupon.seq");
			dto.setEventNum(seq);
			
			dao.insertData("coupon.insertCoupon", dto);
			
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
	public List<Coupon> listCoupon(Map<String, Object> map) {
		List<Coupon> list = null;
		
		try {
			list = dao.selectList("coupon.listCoupon", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("coupon.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public Coupon readCoupon(int eventNum) {
		Coupon dto = null;
		
		try {
			dto = dao.selectOne("coupon.readCoupon", eventNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void deleteCoupon(int eventNum, String pathname) throws Exception {
		try {
			List<Coupon> listFile = listFile(eventNum);
			if(listFile != null) {
				for(Coupon dto : listFile) {
					fileManager.doFileDelete(dto.getFileName(), pathname);
				}
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("eventNum", eventNum);
			deleteFile(map);
			
			dao.deleteData("coupon.deleteCoupon", eventNum);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertFile(Coupon dto) throws Exception {
		try {
			dao.insertData("coupon.inserFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}	
	}

	@Override
	public List<Coupon> listFile(int eventNum) {
		List<Coupon> listFile = null;
		
		try {
			listFile = dao.selectList("coupon.listFile", eventNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listFile;
	}

	@Override
	public Coupon readFile(int fileNum) {
		Coupon dto = null;
		
		try {
			dto = dao.selectOne("coupon.readFile", fileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("coupon.deleteFile", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
