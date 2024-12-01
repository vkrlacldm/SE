package com.sp.yorizori.payment;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;

import com.sp.yorizori.common.dao.CommonDAO;

@Service("payment.paymentService")
public class PaymentServiceImpl implements PaymentService {
	
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public String kakaoPay(Map<String, Object> map) {
		 
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "a7b3ba6f74927449f9eb3364171dff00");
        
		return null;
	}
	
	@Override
	public List<Payment> listCoupon(String userId) {
		
		List<Payment> listCoupon = null;
		
		try {
			listCoupon = dao.selectList("payment.listcoupon", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listCoupon;
	}

	@Override
	public Payment readClass(int classCode) {
		
		Payment dto = null;
		
		try {
			dto = dao.selectOne("payment.classInfo", classCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Payment readMember(String userId) {
		Payment dto = null;
		
		try {
			dto = dao.selectOne("payment.readmember", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<Payment> coupon(int eventNum) {
		List<Payment> list = null;
		
		try {
			list = dao.selectList("payment.readcoupon", eventNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insertOrder(Payment dto) throws Exception {
		int seq = dao.selectOne("payment.paymentseq");
		dto.setOrderCode(seq);
		
		try {
			dao.insertData("payment.insertOrdering", dto);
			dao.insertData("payment.insertpayment", dto);
			dao.updateData("payment.useCoupon", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Payment readOrder(int orderCode) {

		Payment dto = null;
		
		try {
			dto = dao.selectOne("payment.readOrder", orderCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

}
