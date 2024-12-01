package com.sp.yorizori.frige;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller("frige.frigeController")
@RequestMapping("/frige/*")
public class FrigeController {
	
	@Autowired
	private FrigeService service;
	
	
	@RequestMapping(value="main")
	public String main(Model model) throws Exception {
			
			List<Frige> list = service.listIngredient();

			model.addAttribute("list", list);
			
			return ".frige.main";
			
		}
	
	
	@RequestMapping(value = "list")
		public String listRecipe(
				HttpServletRequest req,
				HttpSession session,
				@RequestParam List<Integer> ingredientCodes,
				Model model
				) throws Exception {
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", ingredientCodes);

			List<Frige> list2 = service.listRecipe(map);
			List<Frige> list = new ArrayList<Frige>();
			
			Map<Integer, Integer> test = new HashMap<Integer, Integer>();
			
			for(Frige dto : list2) {
			   if (test.containsKey(dto.getRecipeNum())) {
				   test.put(dto.getRecipeNum(), test.get(dto.getRecipeNum()) + 1);
			   } else {
				   test.put(dto.getRecipeNum(), 1);
			   }
			   
			   if (test.get(dto.getRecipeNum()) == 3)
			   {
			      list.add(dto);
			   }
			}	

			int dataCount = list.size();
			
			model.addAttribute("dataCount", dataCount);
			
			model.addAttribute("list", list);
			
			return ".frige.list";
		}

}
