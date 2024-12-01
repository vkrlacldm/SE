package com.sp.yorizori.category;

import org.springframework.web.multipart.MultipartFile;

public class Category {
	private int recipeNum;
	private String userId;
	private String userName;
	private String nickName;
	private String recipeSubject;
	private String recipeContent;
	private String recipePhotoName;
	private String recipeReg_date;
	private MultipartFile selectFile;
	private int likeCount;
	private int recipeTime;
	private int caseNum;
	private String recipeLevel;
	private int countryNum;
	private int parent;
	private int ingredientCode;
	private String memberImageName;

	public int getIngredientCode() {
		return ingredientCode;
	}
	public void setIngredientCode(int ingredientCode) {
		this.ingredientCode = ingredientCode;
	}
	public int getCountryNum() {
		return countryNum;
	}
	public void setCountryNum(int countryNum) {
		this.countryNum = countryNum;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public String getRecipeLevel() {
		return recipeLevel;
	}
	public void setRecipeLevel(String recipeLevel) {
		this.recipeLevel = recipeLevel;
	}
	public int getCaseNum() {
		return caseNum;
	}
	public void setCaseNum(int caseNum) {
		this.caseNum = caseNum;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public int getRecipeTime() {
		return recipeTime;
	}
	public void setRecipeTime(int recipeTime) {
		this.recipeTime = recipeTime;
	}
	public int getRecipeNum() {
		return recipeNum;
	}
	public void setRecipeNum(int recipeNum) {
		this.recipeNum = recipeNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRecipeSubject() {
		return recipeSubject;
	}
	public void setRecipeSubject(String recipeSubject) {
		this.recipeSubject = recipeSubject;
	}
	public String getRecipeContent() {
		return recipeContent;
	}
	public void setRecipeContent(String recipeContent) {
		this.recipeContent = recipeContent;
	}
	public String getRecipePhotoName() {
		return recipePhotoName;
	}
	public void setRecipePhotoName(String recipePhotoName) {
		this.recipePhotoName = recipePhotoName;
	}
	public String getRecipeReg_date() {
		return recipeReg_date;
	}
	public void setRecipeReg_date(String recipeReg_date) {
		this.recipeReg_date = recipeReg_date;
	}
	public MultipartFile getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(MultipartFile selectFile) {
		this.selectFile = selectFile;
	}
	public String getMemberImageName() {
		return memberImageName;
	}
	public void setMemberImageName(String memberImageName) {
		this.memberImageName = memberImageName;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	
	

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
    recipeNum NUMBER(3) NOT NULL,
    recipePhotoName VARCHAR2(50) NOT NULL, 
    CONSTRAINT pk_recipePhoto_recipeNum PRIMARY KEY(recipeNum),  
    CONSTRAINT fk_recipePhoto_recipeNum FOREIGN KEY(recipeNum) REFERENCES 
	*/
}
