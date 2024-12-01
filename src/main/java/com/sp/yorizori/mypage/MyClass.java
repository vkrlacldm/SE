package com.sp.yorizori.mypage;

public class MyClass {
	private String userId;
	private String nickname;
	private int orderCode;
	private String orderRegDate;
	private int classCode;
	private String classSubject;
	private int price;
	private String classPhotoName;
	private int reviewed;
	
	private String reviewContent;
	private String reviewStar;
	
	private String cancelRegDate;
	
	private int payCount;
	private int totPrice;
	private int totProfit;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}	
	public int getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}
	public String getOrderRegDate() {
		return orderRegDate;
	}
	public void setOrderRegDate(String orderRegDate) {
		this.orderRegDate = orderRegDate;
	}
	public int getClassCode() {
		return classCode;
	}
	public void setClassCode(int classCode) {
		this.classCode = classCode;
	}
	public String getClassSubject() {
		return classSubject;
	}
	public void setClassSubject(String classSubject) {
		this.classSubject = classSubject;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getClassPhotoName() {
		return classPhotoName;
	}
	public void setClassPhotoName(String classPhotoName) {
		this.classPhotoName = classPhotoName;
	}
	public int getReviewed() {
		return reviewed;
	}
	public void setReviewed(int reviewed) {
		this.reviewed = reviewed;
	}
	public String getReviewStar() {
		return reviewStar;
	}
	public void setReviewStar(String reviewStar) {
		this.reviewStar = reviewStar;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getCancelRegDate() {
		return cancelRegDate;
	}
	public void setCancelRegDate(String cancelRegDate) {
		this.cancelRegDate = cancelRegDate;
	}
	public int getPayCount() {
		return payCount;
	}
	public void setPayCount(int payCount) {
		this.payCount = payCount;
	}
	public int getTotPrice() {
		return totPrice;
	}
	public void setTotPrice(int totPrice) {
		this.totPrice = totPrice;
	}
	public int getTotProfit() {
		return totProfit;
	}
	public void setTotProfit(int totProfit) {
		this.totProfit = totProfit;
	}
}
