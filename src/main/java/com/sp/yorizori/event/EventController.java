package com.sp.yorizori.event;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.yorizori.common.FileManager;
import com.sp.yorizori.common.MyUtil;
import com.sp.yorizori.member.SessionInfo;

@Controller("event.eventController")
@RequestMapping("/event/*")
public class EventController {
	@Autowired
	private EventService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value = "list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "ing") String menu,
			HttpServletRequest req, Model model) throws Exception {
		
		String cp = req.getContextPath();
		
		int rows = 9; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menu", menu);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Event> list = service.listEvent(map);
		
		String query = "menu=" + menu;
		String listUrl = cp + "/event/list?" + query;
		String articleUrl = cp + "/event/article?" + query + "&" + "page=" + current_page;
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("menu", menu);
		
		return ".event.list";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(Model model, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info.getRole() > 0) {
			return "redirect:/event/list";
		}
		
		model.addAttribute("mode", "write");
		
		return ".event.write";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String writeSubmit(Event dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		if(info.getRole() > 0) {
			return "redirect:/event/list";
		}
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "event";
			
			dto.setUserId(info.getUserId());
			service.insertEvent(dto, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/event/list";
	}
	
	@RequestMapping(value = "article")
	public String article(
			@RequestParam int eventNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "ing") String menu,
			Model model) throws Exception {
				
		String query = "menu=" + menu;
		query += "&page=" + page;
		
		Event dto = service.readEvent(eventNum);
		if(dto == null) {
			return "redirect:/event/list?" + query;
		}
		
		dto.setEventContent(myUtil.htmlSymbols(dto.getEventContent()));
		
		int rows = 9;
		int start = (Integer.parseInt(page) - 1) * rows + 1;
		int end = Integer.parseInt(page) * rows;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menu", menu);
		map.put("eventNum", eventNum);
		map.put("start", start);
		map.put("end", end);
				
		// 파일
		List<Event> listFile = service.listFile(eventNum);
		
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("menu", menu);
		
		return ".event.article";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(
			@RequestParam int eventNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "ing") String menu,
			HttpSession session, Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
				
		Event dto = service.readEvent(eventNum);
		if (info.getRole() > 0) {
			return "redirect:/event/list?page=" + page;
		}
		
		List<Event> listFile = service.listFile(eventNum);
		
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);
		model.addAttribute("page", page);
		model.addAttribute("menu", menu);
		model.addAttribute("mode", "update");
		
		return ".event.write";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(
			Event dto,
			@RequestParam String page,
			@RequestParam(defaultValue = "ing") String menu,
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if (info.getRole() > 0) {
			return "redirect:/event/list?page=" + page;
		}
		
		String query = "menu=" + menu;
		query += "&page=" + page;
		
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "event";
			
			dto.setUserId(info.getUserId());
			service.updateEvent(dto, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/event/article?" + query + "&eventNum=" + dto.getEventNum();
	}
	
	@RequestMapping(value = "delete")
	public String delete(
			@RequestParam int eventNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "ing") String menu,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		String query = "menu=" + menu;
		query += "&page=" + page;
		
		if (info.getRole() > 0) {
			return "redirect:/event/list?" + query;
		}
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "event";
			service.deleteEvent(eventNum, pathname);			
		} catch (Exception e) {
		}
		
		return "redirect:/event/list?" + query;
	}
	
	@RequestMapping(value = "deleteFile", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteFile(
			@RequestParam int fileNum,
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "event";
		
		Event dto = service.readFile(fileNum);
		if(dto != null) {
			fileManager.doFileDelete(dto.getFileName(), pathname);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("field", "eventPhotoNum");
		map.put("eventNum", fileNum);
		
		service.deleteFile(map);
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", "true");
		
		return model;
	}
	
}
