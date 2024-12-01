package com.sp.yorizori.category;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.yorizori.common.MyUtil;

@Controller("category.categoryController")
@RequestMapping("/category/*")
public class CategoryController {
		@Autowired
		private CategoryService service;
		@Autowired
		private MyUtil myUtil;
		
		@RequestMapping(value = "list")
		public String list (Model model,
					@RequestParam(required = false) List<String> caseNum,
					@RequestParam(required = false) List<String> countryNum,
					@RequestParam(required = false) List<String> recipeLevel,
					@RequestParam(required = false) List<String> ingredientCode,
					@RequestParam(required = false) List<String> parent,
					@RequestParam(required = false) String recipeTime,
					@RequestParam(defaultValue = "date") String sortField)
					
																			{
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("caseNum",caseNum);
			map.put("countryNum",countryNum);
			map.put("recipeLevel",recipeLevel);
			map.put("ingredientCode",ingredientCode);
			map.put("parent",parent);
			map.put("recipeTime",recipeTime);
			map.put("sortField",sortField);
			
			List<Category> categolist=service.listCategory(map);

			model.addAttribute("categolist", categolist);
			

			model.addAttribute("caseNumList", caseNum);
			model.addAttribute("countryNumList", countryNum);
			model.addAttribute("recipeLevelList", recipeLevel);
			model.addAttribute("ingredientCodeList", ingredientCode);
			model.addAttribute("parentList", parent);
			model.addAttribute("recipeTime", recipeTime);
			model.addAttribute("sortField", sortField);
			
			
			return ".category.list";
		}

		@RequestMapping("recipe")	
		@ResponseBody
		public Map<String, Object>  recipe(Category category,String[] caseNum) {
			System.out.println(category.getRecipeNum());

			Map<String, Object> result = new HashMap<String, Object>();
			
			
			
			
			result.put("condition", "test");
			result.put("keyword", "tkey");
			return result;
			//return ".category.list";
		}
	}
