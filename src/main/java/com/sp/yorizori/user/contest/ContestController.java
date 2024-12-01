package com.sp.yorizori.user.contest;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.yorizori.common.FileManager;
import com.sp.yorizori.common.MyUtil;
import com.sp.yorizori.member.SessionInfo;

@Controller("user.contest.contestController")
@RequestMapping("/user/contest/*")
public class ContestController {
	@Autowired
	private ContestService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(HttpSession session, Model model) throws Exception {
		
		model.addAttribute("mode", "write");
		
		return ".contest.user.write";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String writeSubmit(Contest dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "contest";
			
			dto.setUserId(info.getUserId());
			service.insertContest(dto, pathname);
		} catch (Exception e) {
		}
		return "redirect:/contest/article";
	}
	
	@RequestMapping(value = "article")
	public String article(
			@RequestParam int partNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "ing") String menu,
			Model model) throws Exception {
		
		String query = "menu=" + menu;
		query += "&page=" + page;
		
		Contest dto = service.readContest(partNum);
		if(dto == null) {
			return "redirect:/contest/article?" + query;
		}
		
		dto.setPartContent(myUtil.htmlSymbols(dto.getPartContent()));
		
		int rows = 9;
		int start = (Integer.parseInt(page) - 1) * rows + 1;
		int end = Integer.parseInt(page) * rows;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menu", menu);
		map.put("partNum", partNum);
		map.put("start", start);
		map.put("end", end);
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("menu", menu);
		
		return ".contest.user.article";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(
			@RequestParam int partNum,
			@RequestParam String page,
			@RequestParam int rows,
			@RequestParam(defaultValue = "ing") String menu,
			HttpSession session, Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Contest dto = service.readContest(partNum);
		if (dto == null || ! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/contest/user/article?page=" + page + "&rows=" + rows;
		}
		
		List<Contest> listFile = service.listFile(partNum);
		
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);
		model.addAttribute("page", page);
		model.addAttribute("menu", menu);
		model.addAttribute("mode", "update");
		
		return ".contest.write";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(
			Contest dto,
			@RequestParam String page,
			@RequestParam(defaultValue = "ing") String menu,
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		String query = "menu=" + menu;
		query += "&page=" + page;
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "contest";
			
			dto.setUserId(info.getUserId());
			service.updateContest(dto, pathname);
		} catch (Exception e) {
		}
		return "redirect:/contest/user/article?" + query + "&partNum=" + dto.getPartNum();
	}
	
	@RequestMapping(value = "delete")
	public String delete(
			@RequestParam int partNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "ing") String menu,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		String query = "menu=" + menu;
		query += "&page=" + page;
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "contest";
			service.deleteContest(partNum, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/contest/list?" + query;
	}

}
