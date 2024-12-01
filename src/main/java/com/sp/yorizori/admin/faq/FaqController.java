package com.sp.yorizori.admin.faq;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.yorizori.common.MyUtil;

@Controller("admin.faq.faqController")
@RequestMapping("/admin/faq/*")
public class FaqController {

	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "list")
	public String list() throws Exception {
		
		return ".admin.faq.list";
	}
	
	@RequestMapping(value = "detaile")
	public String detailefaq(Model model) throws Exception {
		
		return "admin/faq/detaile";
	}
	
	@RequestMapping(value = "updateFaq", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateFaq(Faq dto) throws Exception {
		String state = "true";
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}
}
