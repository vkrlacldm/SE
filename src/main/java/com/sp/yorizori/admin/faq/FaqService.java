package com.sp.yorizori.admin.faq;

import java.util.List;
import java.util.Map;

public interface FaqService {
	public void insertFaq(Faq dto) throws Exception;
	public int dataCount(Map<String, Object> map);
	public List<Faq> listCategory(Map<String, Object> map);
	
	public void updateFaq(Faq dto) throws Exception;
	public void deleteFaq(Map<String, Object> map) throws Exception;
}
