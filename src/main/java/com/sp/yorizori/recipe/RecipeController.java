package com.sp.yorizori.recipe;

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
import com.sp.yorizori.member.SessionInfo;

@Controller("recipe.recipeController")
@RequestMapping("/recipe/*")
public class RecipeController {
	
	@Autowired
	private RecipeService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "feed")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "rows", defaultValue = "8") int rows,
			HttpServletRequest req,
			HttpSession session,
			Recipe dto,
			Model model
			) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		map.put("recipeNum", dto.getRecipeNum());
		boolean isFollow = service.isFollow(map);
		boolean isRecipeLike = service.isRecipeLike(map);
		
		map.put("isFollow", isFollow);
		map.put("isRecipeLike", isRecipeLike);
		map.put("userCountryNum", info.getCountryNum());
		
		int dataCount = service.dataCount(map);
		int total_page = myUtil.pageCount(rows, dataCount);
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		map.put("dataCount", dataCount);
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/recipe/feed";
		String articleUrl = cp + "/recipe/article?page=" + current_page;
		
		listUrl += "?" + query;
		articleUrl += "&" + query;
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		List<Recipe> list = service.listRecipeFeed(map);

		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("rows", rows);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("paging", paging);
		model.addAttribute("isRecipeLike", isRecipeLike);
		
		model.addAttribute("list", list);
		
		return ".recipe.feed";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(Model model) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> ingredientMap = new HashMap<String, Object>();
		
		ingredientMap.put("parent", null);
		
		List<Recipe> caseCategory = service.listcaseCategory(map);
		List<Recipe> countryCategory = service.listcountryCategory(map);
		
		List<Recipe> ingredientCategory = service.listingredient(ingredientMap);
		
		model.addAttribute("mode", "write");
		model.addAttribute("caseCategory", caseCategory);
		model.addAttribute("countryCategory", countryCategory);
		model.addAttribute("ingredientCategory", ingredientCategory);
		
		return ".recipe.write";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String writeSubmit(Recipe dto, HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "recipe";
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			service.insertRecipe(dto, path);
		} catch (Exception e) {
		}
		
		return "redirect:/recipe/feed";
	}
	
	
	@RequestMapping(value = "article")
	public String article(
			@RequestParam int recipeNum,
			@RequestParam String page,
			HttpSession session, Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		String query = "page=" + page;
		
		service.updateHitCount(recipeNum);
		Recipe dto = service.readRecipe(recipeNum);
		List<Recipe> list = service.readRecipeingredient(recipeNum);
		List<Recipe> selist = service.readRecipeseasoning(recipeNum);
		
		if(dto == null) {
			return "redirect:/recipe/feed?" + query;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		// boolean isFollow = service.isFollow(map); // 이전글 다음글 짤때를 위해서
		
		// map.put("isFollow", isFollow);
		map.put("recipeNum", recipeNum);
		map.put("userId", info.getUserId());
		map.put("nickName", info.getNickName());
		map.put("userCountryNum", info.getCountryNum());
		
		Recipe preReadDto = service.preReadRecipe(map);
		Recipe nextReadDto = service.nextReadRecipe(map);
		
		boolean isRecipeLike = service.isRecipeLike(map);
		boolean isrecipenotifyPost = service.isrecipenotifyPost(map);
		
		model.addAttribute("isrecipenotifyPost", isrecipenotifyPost);
		model.addAttribute("selist", selist);
		model.addAttribute("list", list);
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("isRecipeLike", isRecipeLike);
		
		return ".recipe.article";
	}
	
	@RequestMapping(value = "ingredient", method = RequestMethod.GET) 
	@ResponseBody
	public Map<String, Object> listingredient (
			@RequestParam int ingredientCode
			) throws Exception {
		
		List<Recipe> list = service.listingredient(ingredientCode);
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("list", list);
		
		return model;
	}
	
	@RequestMapping(value = "delete")
	public String delete(
			@RequestParam int recipeNum,
			@RequestParam String page,
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		String query = "page=" + page;
		
		try {
			
			service.deleteRecipe(recipeNum, info.getUserId(), info.getRole());
			
		} catch (Exception e) {
			
		}
		
		return "redirect:/recipe/feed?" + query;
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String update(
			@RequestParam int recipeNum,
			@RequestParam String page,
			HttpSession session,
			Model model
			) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Recipe dto = service.readRecipe(recipeNum);
		
		if(dto == null) {
			return "redirect:/recipe/list?page=" + page;
		}
		
		if(!info.getUserId().equals(dto.getUserId())) {
			return "redirect:/recipe/list?page=" + page;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> ingredientMap = new HashMap<String, Object>();
		
		List<Recipe> list = service.updateRecipeingredient(recipeNum);
		
		ingredientMap.put("parent", null);
		
		List<Recipe> caseCategory = service.listcaseCategory(map);
		List<Recipe> countryCategory = service.listcountryCategory(map);
		
		List<Recipe> ingredientCategory = service.listingredient(ingredientMap);
		
		model.addAttribute("dto", dto);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("mode", "update");
		model.addAttribute("caseCategory", caseCategory);
		model.addAttribute("countryCategory", countryCategory);
		model.addAttribute("ingredientCategory", ingredientCategory);
		
		return ".recipe.write";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(
			Recipe dto,
			HttpSession session
			) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "recipe";
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			
			service.deleteRecipeingredientList(dto.getRecipeNum());
			
			service.updateRecipe(dto, path);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/recipe/feed";
	}
	
	@RequestMapping(value = "notify")
	public String insertnotifyPost (
			@RequestParam int recipeNum,
			HttpSession session,
			Model model,
			Notify dto
			) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");		
		
		try {
			dto.setUserId(info.getUserId());
			
			service.insertnotifyPost(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/recipe/article?page=1&recipeNum=" + recipeNum;
	}
	
	@RequestMapping(value = "insertRecipeLike", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertRecipeLike (
			@RequestParam int recipeNum,
			@RequestParam boolean isRecipeLike,
			HttpSession session
			) throws Exception {
		
		String state = "true";
		int recipeLikeCount = 0;
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("recipeNum", recipeNum);
		map.put("userId", info.getUserId());
		
		try {
			if(isRecipeLike) {
				service.deleteRecipeLike(map);
			} else {
				service.insertRecipeLike(map);
			}
		} catch (Exception e) {
			state = "false";
		}
		
		recipeLikeCount = service.RecipeLikeCount(recipeNum);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		model.put("recipeLikeCount", recipeLikeCount);
		
		return model;
	}
	
	// 댓글 리스트
	@RequestMapping(value = "listReply") 
	public String listReply(
			@RequestParam int recipeNum,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			Model model
			) throws Exception {
		
		int rows = 5;
		int total_page = 0;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("recipeNum", recipeNum);
		
		dataCount = service.replyCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Reply> listReply = service.listReply(map);
		
		for(Reply dto : listReply) {
			dto.setCommentContent(dto.getCommentContent().replaceAll("\n", "<br>"));
		}		
		
		// AJAX 용 페이징
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("listReply", listReply);
		model.addAttribute("paging", paging);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("replyCount", dataCount);
		model.addAttribute("total_page", total_page);
		
		return "recipe/reply";
	}
			
	
	// 댓글, 답글 등록
	// AJAX
	@RequestMapping(value = "insertReply", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReply(
			Reply dto,
			HttpSession session) {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state = "true";
		
		try {
			dto.setUserId(info.getUserId());
			dto.setNickName(info.getNickName());
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
	
	@RequestMapping(value = "listReplyAnswer")
	public String listReplyAnswer(
			@RequestParam int parentCommentNum, Model model
			) throws Exception {
		
		List<Reply> listReplyAnswer = service.listReplyAnswer(parentCommentNum);
		
		for(Reply dto : listReplyAnswer) {
			dto.setCommentContent(dto.getCommentContent().replaceAll("\n", "<br>"));
		}
		
		model.addAttribute("listReplyAnswer", listReplyAnswer);
		
		return "recipe/listReplyAnswer";
	}
	
	@RequestMapping(value = "countReplyAnswer")
	@ResponseBody
	public Map<String, Object> countReplyAnswer(
			@RequestParam(value = "parentCommentNum") int parentCommentNum) {
		
		int count = service.replyAnswerCount(parentCommentNum);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("count", count);
		
		return model;
	}
	
	// 댓글 신고
	@RequestMapping(value = "replynotify")
	public String insertnotifyReply (
			@RequestParam int recipeNum,
			@RequestParam int recipeCommentNum,
			@RequestParam String replyreason,
			HttpSession session,
			Model model,
			Notify dto
			) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			
			service.insertnotifyReply(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/recipe/article?page=1&recipeNum=" + recipeNum;
	}
	
}
