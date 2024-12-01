package com.sp.yorizori.admin.coupon;

import java.util.List;
import java.util.Map;

public interface CouponService {
	public void insertCoupon(Coupon dto, String pathname) throws Exception;
	public List<Coupon> listCoupon(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public Coupon readCoupon(int eventNum);
	
	public void deleteCoupon(int eventNum, String pathname) throws Exception;
			
	public void insertFile(Coupon dto) throws Exception;
	public List<Coupon> listFile(int eventNum);
	public Coupon readFile(int fileNum);
	public void deleteFile(Map<String, Object> map) throws Exception;
}
