package com.sp.yorizori.admin.chefManage;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.yorizori.common.MyUtil;

@Controller("admin.chefManage.chefManageController")
@RequestMapping("/admin/chefManage/*")
public class ChefManageController {
	@Autowired
	private ChefManageService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("chefList")
	public String chefManage(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "userId") String condition,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String enabled,
			@RequestParam(defaultValue = "") String intro,
			@RequestParam(defaultValue = "") String accept,

			HttpServletRequest req,
			Model model) throws Exception {
		
		String cp = req.getContextPath();
		
		int rows = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("enabled", enabled);
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("intro", intro);
		map.put("accept", accept);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int start = (current_page - 1) * rows +1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Chef> list = service.listChef(map);
		
		int listNum, n = 0;
		for(Chef dto : list) {
			listNum = dataCount - (start + n - 1);
			dto.setListNum(listNum);
			n++;
		}
		
		String query = "";
		String listUrl = cp + "/admin/chefManage/chefList";
		
		if(keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}
		
		if(enabled.length() != 0) {
			if(query.length() != 0)
				query = query + "&enabled=" + enabled;
			else
				query = "enabled=" + enabled;
		}
		
		if(query.length() != 0) {
			listUrl = listUrl + "?" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("enabled", enabled);
		model.addAttribute("condition", condition);
		model.addAttribute("intro", intro);
		model.addAttribute("accept", accept);
		
		
		return ".admin.chefManage.chefList";
	}
	
	@RequestMapping(value = "detaile")
	public String detaileChef(@RequestParam String userId, Model model,			
							  @RequestParam(defaultValue = "") String intro,
							  @RequestParam(defaultValue = "") String birth,
						      @RequestParam(defaultValue = "") String tel,
							  @RequestParam(defaultValue = "") String accept) throws Exception {
		
		Chef dto = service.readChef(userId);
		Chef chefState = service.readChefState(userId);
		List<Chef> listState = service.listChefState(userId);
		
		model.addAttribute("dto", dto);
		model.addAttribute("chefState", chefState);
		model.addAttribute("birth", birth);
		model.addAttribute("tel", tel);
		model.addAttribute("listState", listState);
		model.addAttribute("intro", intro);
		model.addAttribute("accept", accept);
				
		return "admin/chefManage/detaile";
	}
	
	@RequestMapping(value = "updateChefState", method = RequestMethod.POST)
	public String updateChefState(Chef dto) throws Exception {
	
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("userId", dto.getUserId());
			map.put("accept", dto.getAccept());
			map.put("role", 2);
			
			service.updateChefEnabled(map);
			
		} catch (Exception e) {
			
		}
	
		
		return "redirect:/admin/chefManage/chefList";
	}
	
}
