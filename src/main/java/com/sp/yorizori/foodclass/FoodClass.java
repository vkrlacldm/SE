package com.sp.yorizori.foodclass;

import org.springframework.web.multipart.MultipartFile;

public class FoodClass {
	private int rnum;
	private int classCode;
	private int category;
	private int class_Category;
	private String classCname;
	private String classSubject;
	private String classContent;
	private String classReg_date;
	private int classHitcount;
	private int serving;
	private int price;
	private int videoTime;
	private String nickname;
	private String userId;
	private int followCount;

	private MultipartFile imageFile;
	private MultipartFile previewFile;
	private MultipartFile videoFile;
	
	private String memberImageName;
	private String imageFileName;
	private String previewFileName;
	private String videoFileName;
	
	private int classLikeCount;
	
	private int userClassLike;

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getClassCode() {
		return classCode;
	}

	public void setClassCode(int classCode) {
		this.classCode = classCode;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public int getClass_Category() {
		return class_Category;
	}

	public void setClass_Category(int class_Category) {
		this.class_Category = class_Category;
	}

	public String getClassCname() {
		return classCname;
	}

	public void setClassCname(String classCname) {
		this.classCname = classCname;
	}

	public String getClassSubject() {
		return classSubject;
	}

	public void setClassSubject(String classSubject) {
		this.classSubject = classSubject;
	}

	public String getClassContent() {
		return classContent;
	}

	public void setClassContent(String classContent) {
		this.classContent = classContent;
	}

	public String getclassReg_date() {
		return classReg_date;
	}

	public void setclassReg_date(String classReg_date) {
		this.classReg_date = classReg_date;
	}

	public int getClassHitcount() {
		return classHitcount;
	}

	public void setClassHitcount(int classHitcount) {
		this.classHitcount = classHitcount;
	}

	public int getServing() {
		return serving;
	}

	public void setServing(int serving) {
		this.serving = serving;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getVideoTime() {
		return videoTime;
	}

	public void setVideoTime(int videoTime) {
		this.videoTime = videoTime;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getFollowCount() {
		return followCount;
	}

	public void setFollowCount(int followCount) {
		this.followCount = followCount;
	}

	public MultipartFile getImageFile() {
		return imageFile;
	}

	public void setImageFile(MultipartFile imageFile) {
		this.imageFile = imageFile;
	}

	public MultipartFile getPreviewFile() {
		return previewFile;
	}

	public void setPreviewFile(MultipartFile previewFile) {
		this.previewFile = previewFile;
	}

	public MultipartFile getVideoFile() {
		return videoFile;
	}

	public void setVideoFile(MultipartFile videoFile) {
		this.videoFile = videoFile;
	}

	public String getMemberImageName() {
		return memberImageName;
	}

	public void setMemberImageName(String memberImageName) {
		this.memberImageName = memberImageName;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public String getPreviewFileName() {
		return previewFileName;
	}

	public void setPreviewFileName(String previewFileName) {
		this.previewFileName = previewFileName;
	}

	public String getVideoFileName() {
		return videoFileName;
	}

	public void setVideoFileName(String videoFileName) {
		this.videoFileName = videoFileName;
	}

	public int getClassLikeCount() {
		return classLikeCount;
	}

	public void setClassLikeCount(int classLikeCount) {
		this.classLikeCount = classLikeCount;
	}

	public int getUserClassLike() {
		return userClassLike;
	}

	public void setUserClassLike(int userClassLike) {
		this.userClassLike = userClassLike;
	}

}
