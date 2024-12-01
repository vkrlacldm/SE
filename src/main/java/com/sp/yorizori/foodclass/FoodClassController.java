package com.sp.yorizori.foodclass;

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

import com.sp.yorizori.common.MyUtil;
import com.sp.yorizori.foodclass.qna.Board;
import com.sp.yorizori.foodclass.qna.BoardService;
import com.sp.yorizori.member.SessionInfo;
import com.sp.yorizori.mypage.MyClass;

@Controller("foodclass.foodClassController")
@RequestMapping("/class/*")
public class FoodClassController {
	@Autowired
	private FoodClassService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private BoardService qnaService;
	
	@RequestMapping(value = "list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "category", defaultValue = "0") int category,
			HttpServletRequest req, HttpSession session, Model model) throws Exception {
		
		String cp = req.getContextPath();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		int rows = 16;
		int total_page = 0;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		// boolean userClassLike = service.userClassLike(map);
		
		map.put("userId", info.getUserId());
		map.put("category", category);
		// map.put("userClassLike", userClassLike);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		
		if (total_page < current_page) {
			current_page = total_page;
		}
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<FoodClass> list = service.listClass(map);
		for(FoodClass dto : list) {
			FoodClass fileDto = service.searchFile(dto.getClassCode());
			if(fileDto != null) {
				dto.setImageFileName(fileDto.getImageFileName());
			}
		}
		
		String query = "category=" + category;
		String listUrl = cp + "/class/list?" + query;
		String articleUrl = cp + "/class/article?" + query + "&" + "page=" + current_page;
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("category", category);
		// model.addAttribute("userClassLike", userClassLike);
		
		return ".class.list";
	}
	
	@RequestMapping(value = "article")
	public String article(
			@RequestParam int classCode,
			@RequestParam String page,
			@RequestParam int category,
			HttpServletRequest req,
			HttpSession session, Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
				
		String query = "category=" + category;
		query += "&page=" + page;
		
		service.updateHitCount(classCode);
		
		map.put("category", category);
		map.put("classCode", classCode);
		map.put("userId", info.getUserId());
		map.put("nickname", info.getNickName());
		
		boolean userClassLike = service.userClassLike(map);
		FoodClass dto = service.readClass(classCode);
		if(dto == null) {
			return "redirect:/class/list?" + query;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("query", query);
		model.addAttribute("page", page);
		model.addAttribute("category", category);
		model.addAttribute("userClassLike", userClassLike);
		
		return ".class.article";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(Model model) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		List<FoodClass> classCategory = service.classCategory(map);
		
		model.addAttribute("category", classCategory);
		
		return ".class.write";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String writeSubmit(FoodClass dto, HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "class";
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			service.insertClass(dto, pathname);
			service.insertFile(dto);
		} catch (Exception e) {
		}
		
		return "redirect:/class/list";
	}
	
	@RequestMapping(value = "insertClassLike", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertClassLike(
			@RequestParam int classCode,
			@RequestParam boolean userClassLike,
			HttpSession session
			) throws Exception {
		
		String state = "true";
		int classLikeCount = 0;
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("classCode", classCode);
		map.put("userId", info.getUserId());
		
		try {
			if(userClassLike) {
				service.deleteClassLike(map);
			} else {
				service.insertClassLike(map);
			}
		} catch (Exception e) {
			state = "false";
		}
		
		classLikeCount = service.classLikeCount(classCode);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		model.put("classLikeCount", classLikeCount);
		
		return model;
	}
	
	@RequestMapping(value = "reviewList")
	@ResponseBody
	public Map<String, Object> reviewList(
			@RequestParam int classCode,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			HttpSession session
			) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("classCode", classCode);
		
		int rows = 5;
		int dataCount = service.reviewCount(map);
		int total_page = myUtil.pageCount(rows, dataCount);
		
		if (current_page > total_page) {
			current_page = total_page;
		}

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		FoodClass classDto = service.readClass(classCode);
		
		List<MyClass> list = service.readReview(map);
		for(MyClass dto : list) {
			dto.setReviewContent(dto.getReviewContent().replaceAll("\n", "<br>"));
		}
		
		String paging = myUtil.pagingMethod(current_page, total_page, "reviewPage");
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("dataCount", dataCount);
		model.put("page", current_page);
		model.put("paging", paging);
		model.put("list", list);
		model.put("dto", classDto);
		
		return model; 
	}
	
	@RequestMapping(value = "qnaList")
	@ResponseBody
	public Map<String, Object> qnaList(
			@RequestParam int classCode,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			HttpSession session
			) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("classCode", classCode);
		map.put("userId", info.getUserId());
		map.put("nickname", info.getNickName());
		
		int rows = 5;
		int dataCount = qnaService.dataCount(map);
		int total_page = myUtil.pageCount(rows, dataCount);
		
		if (current_page > total_page) {
			current_page = total_page;
		}

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		FoodClass classDto = service.readClass(classCode);
		
		List<Board> list = qnaService.readBoard(map);
		for(Board dto : list) {
			if(dto.getAnswer() != null) {
				dto.setAnswer(dto.getAnswer().replaceAll("\n", "<br>"));
			}
			dto.setClassQContent(dto.getClassQContent().replaceAll("\n", "<br>"));
		}
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("dataCount", dataCount);
		model.put("page", current_page);
		model.put("paging", paging);
		model.put("list", list);
		model.put("dto", classDto);
		
		return model; 
	}
	
	@RequestMapping(value = "qnaInsert", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> qnaInsert(Board dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		String state = "true";
		try {
			dto.setUserId(info.getUserId());
			qnaService.insertBoard(dto);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value = "insertAnswer", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertAnswer(
			Board dto,
			HttpSession session) throws Exception {
		
		String state = "true";
		try {
			qnaService.updateBoard(dto);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping(value = "deleteQuestion", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteQuestion(@RequestParam int classQNum, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		String state = "true";
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("classQNum", classQNum);
			map.put("userId", info.getUserId());
			qnaService.deleteQuestion(map);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
}
