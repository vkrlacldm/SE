package com.sp.yorizori.frige;

import java.util.List;
import java.util.Map;

public interface FrigeService {
	public List<Frige> listIngredient();
	public List<Frige> listRecipe(Map<String, Object> map);

	public int dataCount(Map<String, Object> map);
	
	

}
