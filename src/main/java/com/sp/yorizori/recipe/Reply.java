package com.sp.yorizori.recipe;

public class Reply {
	private int recipeCommentNum;
	private int recipeNum;
	private int parentCommentNum;
	private String userId;
	private String nickName;
	private String commentContent;
	private String commentReg_date;
	
	private int answerCount;
	
	public int getRecipeCommentNum() {
		return recipeCommentNum;
	}
	public void setRecipeCommentNum(int recipeCommentNum) {
		this.recipeCommentNum = recipeCommentNum;
	}
	public int getRecipeNum() {
		return recipeNum;
	}
	public void setRecipeNum(int recipeNum) {
		this.recipeNum = recipeNum;
	}
	public int getParentCommentNum() {
		return parentCommentNum;
	}
	public void setParentCommentNum(int parentCommentNum) {
		this.parentCommentNum = parentCommentNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getCommentReg_date() {
		return commentReg_date;
	}
	public void setCommentReg_date(String commentReg_date) {
		this.commentReg_date = commentReg_date;
	}
	public int getAnswerCount() {
		return answerCount;
	}
	public void setAnswerCount(int answerCount) {
		this.answerCount = answerCount;
	}
	
}
