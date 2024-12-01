package com.sp.yorizori.admin.notify;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.yorizori.admin.category.Category;
import com.sp.yorizori.common.MyUtil;

@Controller("admin.notify.notifyCotroller")
@RequestMapping("/admin/notify/*")
public class NotifyCotroller {
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model) throws Exception {
		
		return ".admin.notify.list";
	}
	
	@RequestMapping(value = "detaile")
	public String detaileNotify(Model model) throws Exception {
		
		return "admin/Notify/detaile";
	}
	
	@RequestMapping(value = "updateNotify", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateNotify(Category dto) throws Exception {
		String state = "true";
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}

}
