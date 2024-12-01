package com.sp.yorizori.rank;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("rank.rankController")
@RequestMapping("/rank/*")
public class RankController {
	@Autowired
	private RankService service;
	
	@RequestMapping(value = "recipe")
	public String recipe(Model model) throws Exception {
		
		List<RankRecipe> list = service.rankRecipe();
		
		model.addAttribute("list", list);
		
		return ".rank.recipe";
	}
	
	@RequestMapping(value = "chef")
	public String chef(Model model) throws Exception {
		
		List<RankChef> list = service.rankChef();
		
		model.addAttribute("list", list);
		
		return ".rank.chef";
	}
	
	@RequestMapping(value = "article")
	public String article() throws Exception {
		
		return ".rank.article";
	}
}
