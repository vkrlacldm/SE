package com.sp.yorizori.daily;

public class DailyReply {
	private int replyNum;
	private int dailyNum;
	private String userId;
	private String userName;
	private String replyContent;
	private String reg_date;
	private int parentreplyNum;
	
	private int answerCount;
	private int likeCount;
	private int disLikeCount;
	
	
	public int getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}
	public int getDailyNum() {
		return dailyNum;
	}
	public void setDailyNum(int dailyNum) {
		this.dailyNum = dailyNum;
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
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getAnswerCount() {
		return answerCount;
	}
	public void setAnswerCount(int answerCount) {
		this.answerCount = answerCount;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public int getDisLikeCount() {
		return disLikeCount;
	}
	public void setDisLikeCount(int disLikeCount) {
		this.disLikeCount = disLikeCount;
	}
	public int getParentreplyNum() {
		return parentreplyNum;
	}
	public void setParentreplyNum(int parentreplyNum) {
		this.parentreplyNum = parentreplyNum;
	}
	
	
	
}
