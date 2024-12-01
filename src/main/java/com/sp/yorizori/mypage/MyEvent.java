package com.sp.yorizori.mypage;

public class MyEvent {
	private int contestNum;
	private String contestSubject;
	private String userId;
	private String reg_date;
	
	private int eventNum;
	private int orderCode;
	private String couponName;
	private String discountPrice;
	private String createTime;
	private String expireTime;
	
	public int getContestNum() {
		return contestNum;
	}
	public void setContestNum(int contestNum) {
		this.contestNum = contestNum;
	}
	public String getContestSubject() {
		return contestSubject;
	}
	public void setContestSubject(String contestSubject) {
		this.contestSubject = contestSubject;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getEventNum() {
		return eventNum;
	}
	public void setEventNum(int eventNum) {
		this.eventNum = eventNum;
	}
	public int getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}
	public String getCouponName() {
		return couponName;
	}
	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	public String getDiscountPrice() {
		return discountPrice;
	}
	public void setDiscountPrice(String discountPrice) {
		this.discountPrice = discountPrice;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getExpireTime() {
		return expireTime;
	}
	public void setExpireTime(String expireTime) {
		this.expireTime = expireTime;
	}
}
