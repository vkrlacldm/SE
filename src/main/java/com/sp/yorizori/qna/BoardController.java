package com.sp.yorizori.qna;

import java.net.URLDecoder;
import java.net.URLEncoder;
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

import com.sp.yorizori.common.MyUtil;
import com.sp.yorizori.member.SessionInfo;

// 질문과 답변
@Controller("qna.boardController")
@RequestMapping(value = "/qna/*")
public class BoardController {
	@Autowired
	private BoardService service;

	@Autowired
	private MyUtil myUtil;

	@RequestMapping(value = "list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model) throws Exception {

		String cp = req.getContextPath();

		int rows = 10;
		int total_page;
		int dataCount;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "UTF-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);

		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);

		if (total_page < current_page) {
			current_page = total_page;
		}

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);

		List<Board> list = service.listBoard(map);
		
		int listNum, n = 0;
		for (Board dto : list) {
			listNum = dataCount - (start + n - 1);
			dto.setListNum(listNum);
			n++;
		}

		String query = "";
		String listUrl = cp + "/qna/list";
		String articleUrl = cp + "/qna/article?page=" + current_page;
		if (keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}

		if (query.length() != 0) {
			listUrl = cp + "/qna/list?" + query;
			articleUrl = cp + "/qna/article?page=" + current_page + "&" + query;
		}

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);

		return ".qna.list";
	}

	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(Model model) throws Exception {

		List<Board> listCategory = service.listCategory();

		model.addAttribute("listCategory", listCategory);
		model.addAttribute("mode", "write");
		return ".qna.write";
	}

	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String writeSubmit(Board dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			dto.setUserId(info.getUserId());
			service.insertBoard(dto);
		} catch (Exception e) {
		}

		return "redirect:/qna/list";
	}

	@RequestMapping(value = "article", method = RequestMethod.GET)
	public String article(@RequestParam int num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session,
			Model model) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		keyword = URLDecoder.decode(keyword, "utf-8");

		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}

		Board questionDto = service.readQuestion(num);
		if (questionDto == null) {
			return "redirect:/qna/list?" + query;
		}
		if (questionDto.getQuestionPrivate() == 1 && (!info.getUserId().equals(questionDto.getUserId()))
				&& info.getRole() != 0 ) {
			return "redirect:/qna/list?" + query;
		}

		questionDto.setContent(questionDto.getContent().replaceAll("\n", "<br>"));

		Board answerDto = service.readAnswer(questionDto.getNum());
		if (answerDto != null) {
			answerDto.setContent(answerDto.getContent().replaceAll("\n", "<br>"));
		}

		// 이전 글, 다음 글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", questionDto.getNum());
		map.put("condition", condition);
		map.put("keyword", keyword);

		Board preReadDto = service.preReadQuestion(map);
		Board nextReadDto = service.nextReadQuestion(map);

		model.addAttribute("questionDto", questionDto);
		model.addAttribute("answerDto", answerDto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);

		return ".qna.article";
	}

	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(@RequestParam int num,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Board dto = service.readQuestion(num);
		if (dto == null) {
			return "redirect:/qna/list?page=" + page;
		}

		if (!info.getUserId().equals(dto.getUserId())) {
			return "redirect:/qna/list?page=" + page;
		}

		List<Board> listCategory = service.listCategory();

		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		model.addAttribute("listCategory", listCategory);

		return ".qna.write";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(Board dto,
			@RequestParam String page,
			HttpSession session) throws Exception {
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			dto.setUserId(info.getUserId());
			service.updateBoard(dto);
		} catch (Exception e) {
		}

		return "redirect:/qna/list?page=" + page;
	}

	@RequestMapping(value = "answer", method = RequestMethod.GET)
	public String answerForm(@RequestParam int num,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Board dto = service.readQuestion(num);
		if (dto == null) {
			return "redirect:/qna/list?page=" + page;
		}

		if (info.getRole() != 0) {
			return "redirect:/qna/list?page=" + page;
		}

		dto.setContent("[" + dto.getSubject() + "] 에 대한 답변입니다.\n");

		List<Board> listCategory = service.listCategory();

		model.addAttribute("mode", "answer");
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		model.addAttribute("listCategory", listCategory);

		return ".qna.write";
	}

	@RequestMapping(value = "answer", method = RequestMethod.POST)
	public String answerSubmit(Board dto,
			@RequestParam String page,
			HttpSession session) throws Exception {

		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			dto.setUserId(info.getUserId());
			service.insertBoard(dto);
		} catch (Exception e) {
		}

		return "redirect:/qna/list?page=" + page;
	}

	@RequestMapping(value = "delete")
	public String delete(@RequestParam int num,
			@RequestParam String page,
			@RequestParam String mode,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		keyword = URLDecoder.decode(keyword, "utf-8");
		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}
		
		Board dto = service.readQuestion(num);
		
		if (dto != null) {
			if (info.getUserId().equals(dto.getUserId()) || info.getRole() == 0) {
				try {
					if (mode.equals("question")) {
						service.deleteQuestion(num);
					} else if (mode.equals("answer")) {
						service.deleteAnswer(num);
					}
				} catch (Exception e) {
				}
			}
		}

		return "redirect:/qna/list?" + query;
	}
}
