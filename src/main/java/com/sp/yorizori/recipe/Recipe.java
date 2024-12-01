package com.sp.yorizori.recipe;
/*
 recipeNum NUMBER(3) NOT NULL,
    caseNum NUMBER(3) NOT NULL,
    countryNum NUMBER(3) NOT NULL,
    recipeSubject VARCHAR2(100) NOT NULL, 
    recipeHitcount NUMBER(3) NOT NULL,
    recipeReg_date DATE DEFAULT SYSDATE,,
    recipeServing NUMBER(3) NOT NULL,
    recipeLevel VARCHAR2(50) NOT NULL,
    recipeContent CLOB NOT NULL,
    recipeTime NUMBER(3) NOT NULL,
    userId VARCHAR2(50) NOT NULL, 
    active NUMBER(3) NOT NULL,
 */

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Recipe {
	private int recipeNum;
	private String recipeSubject;
	private int recipeHitCount;
	private int recipeServing; // 1인분 2인분 3인분
	private String recipeLevel; // 상 중 하
	private String recipeContent;
	private int recipeTime; // 분 단위
	private String userId;
	private int active; // 0: 활성화 1: 비활성화
	private String recipeReg_date;
	private String imageFilename;
	private String nickName;
	private int userRecipeLike;
	
	private int caseNum;
	private String caseName;
	
	private int countryNum;
	private String countryName;
	private int userCountryNum;
	
	private List<Integer> ingredientCodes;
	private int ingredientCode;
	private String ingredientName;
	private String ingredimageName;
	private int parent;
	
	private String memberImageName;
	
	private MultipartFile selectFile;
	
	private int recipeLikeCount;
	private String follwer_id;
	
	private int replyCount;
	
	public int getRecipeNum() {
		return recipeNum;
	}
	public void setRecipeNum(int recipeNum) {
		this.recipeNum = recipeNum;
	}
	public String getRecipeSubject() {
		return recipeSubject;
	}
	public void setRecipeSubject(String recipeSubject) {
		this.recipeSubject = recipeSubject;
	}
	public int getRecipeHitCount() {
		return recipeHitCount;
	}
	public void setRecipeHitCount(int recipeHitCount) {
		this.recipeHitCount = recipeHitCount;
	}
	public int getRecipeServing() {
		return recipeServing;
	}
	public void setRecipeServing(int recipeServing) {
		this.recipeServing = recipeServing;
	}
	public String getRecipeLevel() {
		return recipeLevel;
	}
	public void setRecipeLevel(String recipeLevel) {
		this.recipeLevel = recipeLevel;
	}
	public String getRecipeContent() {
		return recipeContent;
	}
	public void setRecipeContent(String recipeContent) {
		this.recipeContent = recipeContent;
	}
	public int getRecipeTime() {
		return recipeTime;
	}
	public void setRecipeTime(int recipeTime) {
		this.recipeTime = recipeTime;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	public String getImageFilename() {
		return imageFilename;
	}
	public void setImageFilename(String imageFilename) {
		this.imageFilename = imageFilename;
	}
	public int getUserRecipeLike() {
		return userRecipeLike;
	}
	public void setUserRecipeLike(int userRecipeLike) {
		this.userRecipeLike = userRecipeLike;
	}
	public int getCaseNum() {
		return caseNum;
	}
	public void setCaseNum(int caseNum) {
		this.caseNum = caseNum;
	}
	public String getCaseName() {
		return caseName;
	}
	public void setCaseName(String caseName) {
		this.caseName = caseName;
	}
	public int getCountryNum() {
		return countryNum;
	}
	public void setCountryNum(int countryNum) {
		this.countryNum = countryNum;
	}
	public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	public int getUserCountryNum() {
		return userCountryNum;
	}
	public void setUserCountryNum(int userCountryNum) {
		this.userCountryNum = userCountryNum;
	}
	public List<Integer> getIngredientCodes() {
		return ingredientCodes;
	}
	public void setIngredientCodes(List<Integer> ingredientCodes) {
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
	public String getMemberImageName() {
		return memberImageName;
	}
	public void setMemberImageName(String memberImageName) {
		this.memberImageName = memberImageName;
	}
	public MultipartFile getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(MultipartFile selectFile) {
		this.selectFile = selectFile;
	}
	public int getRecipeLikeCount() {
		return recipeLikeCount;
	}
	public void setRecipeLikeCount(int recipeLikeCount) {
		this.recipeLikeCount = recipeLikeCount;
	}
	public String getFollwer_id() {
		return follwer_id;
	}
	public void setFollwer_id(String follwer_id) {
		this.follwer_id = follwer_id;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getRecipeReg_date() {
		return recipeReg_date;
	}
	public void setRecipeReg_date(String recipeReg_date) {
		this.recipeReg_date = recipeReg_date;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	
}
