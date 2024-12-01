package com.sp.yorizori.daily;

import org.springframework.web.multipart.MultipartFile;

public class Daily {
	private int listNum;
	private int dailyNum;
	private String userId;
	private String userName;
	private String nickName;
	private String subject;
	private String dailyContent;
	private int hitCount;
	private String dailyLink;
	
	private int dailyPhotoNum;
	private String dailyPhotoName;
	private MultipartFile selectFile;
	
	private int replyCount;
	private int dailyLikeCount;
	
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
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
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDailyContent() {
		return dailyContent;
	}
	public void setDailyContent(String dailyContent) {
		this.dailyContent = dailyContent;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public String getDailyLink() {
		return dailyLink;
	}
	public void setDailyLink(String dailyLink) {
		this.dailyLink = dailyLink;
	}
	public int getDailyPhotoNum() {
		return dailyPhotoNum;
	}
	public void setDailyPhotoNum(int dailyPhotoNum) {
		this.dailyPhotoNum = dailyPhotoNum;
	}
	public String getDailyPhotoName() {
		return dailyPhotoName;
	}
	public void setDailyPhotoName(String dailyPhotoName) {
		this.dailyPhotoName = dailyPhotoName;
	}
	public MultipartFile getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(MultipartFile selectFile) {
		this.selectFile = selectFile;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public int getDailyLikeCount() {
		return dailyLikeCount;
	}
	public void setDailyLikeCount(int dailyLikeCount) {
		this.dailyLikeCount = dailyLikeCount;
	}
}