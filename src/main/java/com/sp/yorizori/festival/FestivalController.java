package com.sp.yorizori.festival;

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

@Controller("festival.festivalController")
@RequestMapping("/festival/*")
public class FestivalController {
	@Autowired
	private FestivalService service;
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
		
		int rows = 8;
		int total_page = 0;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menu", menu);
		
		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		
		if (total_page < current_page) {
			current_page = total_page;
		}
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Festival> list = service.listFest(map);
		for (Festival dto : list) {
			Festival fileDto = service.searchFile(dto.getNum());
			if (fileDto != null) {
				dto.setFileName(fileDto.getFileName());
			}
		}
		
		String query = "menu=" + menu;
		String listUrl = cp + "/festival/list?" + query;
		String articleUrl = cp + "/festival/article?" + query + "&" + "page=" + current_page;
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("menu", menu);
		
		return ".festival.list";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(Model model) throws Exception {
		model.addAttribute("mode", "write");
		
		return ".festival.write";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String writeSubmit(Festival dto, HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "festival";
		
		try {
			service.insertFest(dto, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/festival/list";
	}
	
	@RequestMapping(value = "article")
	public String article(
			@RequestParam int num,
			@RequestParam String page,
			@RequestParam(defaultValue = "ing") String menu,
			HttpSession session, Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String query = "menu=" + menu;
		query += "&page=" + page;
		
		Festival dto = service.readFest(num);
		if (dto == null) {
			return "redirect:/festival/list?" + query;
		}
		
		dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		
		List<Festival> listFile = service.listFile(num);
		
		// searchFest
		int rows = 8;
		int start = (Integer.parseInt(page) - 1) * rows + 1;
		int end = Integer.parseInt(page) * rows;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menu", menu);
		map.put("num", num);
		map.put("start", start);
		map.put("end", end);
		
		Festival fest = service.searchFest(map);
		map.put("rnum", fest.getRnum());
		
		Festival preReadDto = service.preReadFest(map);
		Festival nextReadDto = service.nextReadFest(map);
		
		map.put("userId", info.getUserId());
		boolean userFestLiked = service.userFestLiked(map);
		
		int replyCount = service.replyCount(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);
		model.addAttribute("userFestLiked", userFestLiked);
		model.addAttribute("replyCount", replyCount);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("menu", menu);
		
		return ".festival.article";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(
			@RequestParam int num,
			@RequestParam String page,
			@RequestParam(defaultValue = "ing") String menu,
			HttpSession session, Model model) throws Exception {
		
		String query = "menu=" + menu;
		query += "&page=" + page;
		
		Festival dto = service.readFest(num);
		if (dto == null) {
			return "redirect:/festival/list?" + query;
		}
		
		dto.setStart_date(dto.getStart_date().replace(".", "-"));
		dto.setEnd_date(dto.getEnd_date().replace(".", "-"));
		
		List<Festival> listFile = service.listFile(num);
		
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);
		model.addAttribute("page", page);
		model.addAttribute("menu", menu);
		model.addAttribute("query", query);
		model.addAttribute("mode", "update");
		
		return ".festival.write";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(
			Festival dto, 
			@RequestParam String page,
			@RequestParam(defaultValue = "ing") String menu,
			HttpSession session) throws Exception {
		
		String query = "menu=" + menu;
		query += "&page=" + page;
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "festival";
		
		try {
			service.updateFest(dto, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/festival/article?" + query + "&num=" + dto.getNum();
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(
			@RequestParam int num,
			@RequestParam String page,
			@RequestParam(defaultValue = "ing") String menu,
			HttpSession session) throws Exception {
		
		String query = "menu=" + menu;
		query += "&page=" + page;
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "festival";
		
		Festival dto = service.readFest(num);
		if (dto == null) {
			return "redirect:/festival/list?" + query;
		}
		
		try {
			service.deleteFest(num, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/festival/list?" + query;
	}
	
	@RequestMapping(value = "deleteFile", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteFile(
			@RequestParam int fileNum,
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "festival";
		
		Festival dto = service.readFile(fileNum);
		if (dto != null) {
			fileManager.doFileDelete(dto.getFileName(), pathname);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("field", "festivalPhotoNum");
		map.put("num", fileNum);
		
		service.deleteFile(map);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", "true");
		
		return model;
	}
	
	@RequestMapping(value = "insertFestLike", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertFestLike(
			@RequestParam int num,
			@RequestParam boolean userFestLiked,
			HttpSession session) throws Exception {
		
		String state = "true";
		int festLikeCount = 0;
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		paramMap.put("userId", info.getUserId());
		
		try {
			if (userFestLiked) {
				service.deleteFestLike(paramMap);
			} else {
				service.insertFestLike(paramMap);
			}
		} catch (Exception e) {
			state = "false";
		}
		
		festLikeCount = service.festLikeCount(num);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		model.put("festLikeCount", festLikeCount);
		
		return model;
	}
	
	@RequestMapping(value = "listReply")
	public String listReply(
			@RequestParam int num,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			Model model, HttpSession session) throws Exception {
		
		int rows = 5;
		int total_page = 0;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		
		dataCount = service.replyCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		if (current_page > total_page) {
			current_page = total_page;
		}
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Reply> listReply = service.listReply(map);
		
		for (Reply dto : listReply) {
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		}
		
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("listReply", listReply);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("replyCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return "festival/listReply";
	}
	
	@RequestMapping(value = "insertReply", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReply(Reply dto, HttpSession session) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state = "true";
		
		try {
			dto.setUserId(info.getUserId());
			service.insertReply(dto);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping(value = "deleteReply", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteReply(@RequestParam Map<String, Object> paramMap) {
		String state = "true";
		
		try {
			service.deleteReply(paramMap);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("state", state);
		
		return map;
	}
}
