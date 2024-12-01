package com.sp.yorizori.recipe;

public class Notify {
	// 신고
	private int recipeNum;
	private String userId;
	private String reason;
	private String notify_date;
	private int recipeCommentNum;
	private String replyreason;
	
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
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getNotify_date() {
		return notify_date;
	}
	public void setNotify_date(String notify_date) {
		this.notify_date = notify_date;
	}
	public int getRecipeCommentNum() {
		return recipeCommentNum;
	}
	public void setRecipeCommentNum(int recipeCommentNum) {
		this.recipeCommentNum = recipeCommentNum;
	}
	public String getReplyreason() {
		return replyreason;
	}
	public void setReplyreason(String replyreason) {
		this.replyreason = replyreason;
	}
}
