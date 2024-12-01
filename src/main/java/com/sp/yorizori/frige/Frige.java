package com.sp.yorizori.frige;

import java.util.List;

public class Frige {
	private int listNum;
	private int recipeNum;
	private List<String> ingredientCodes;
	private int ingredientCode;
	private String ingredientName;
	private String ingredimageName;
	private int parent;
	
	private String recipeSubject;
	private String userId;
	private String imageFilename;
	private String nickName;
	
	
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public int getRecipeNum() {
		return recipeNum;
	}
	public void setRecipeNum(int recipeNum) {
		this.recipeNum = recipeNum;
	}
	public List<String> getIngredientCodes() {
		return ingredientCodes;
	}
	public void setIngredientCodes(List<String> ingredientCodes) {
		this.ingredientCodes = ingredientCodes;
	}
	public int getIngredientCode() {
		return ingredientCode;
	}
	public void setIngredientCode(int ingredientCode) {
		this.ingredientCode = ingredientCode;
	}
	public String getIngredientName() {
		return ingredientName;
	}
	public void setIngredientName(String ingredientName) {
		this.ingredientName = ingredientName;
	}
	public String getIngredimageName() {
		return ingredimageName;
	}
	public void setIngredimageName(String ingredimageName) {
		this.ingredimageName = ingredimageName;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public String getRecipeSubject() {
		return recipeSubject;
	}
	public void setRecipeSubject(String recipeSubject) {
		this.recipeSubject = recipeSubject;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getImageFilename() {
		return imageFilename;
	}
	public void setImageFilename(String imageFilename) {
		this.imageFilename = imageFilename;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	
}
