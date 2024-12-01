package com.sp.yorizori.user.contest;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Contest {
	private int contestNum;
	private String subject;
	private String contestContent;
	private String posterName;
	private String start_date;
	private String end_date;
	
	private int partNum;
	private String userId;
	private String reg_date;
	private String partContent;
	
	private int partPhotoNum;
	private String partPhotoName;
	
	private List<MultipartFile> selectFile;
	
	private int fileNum;
	private String fileName;
	
	public int getContestNum() {
		return contestNum;
	}
	public void setContestNum(int contestNum) {
		this.contestNum = contestNum;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContestContent() {
		return contestContent;
	}
	public void setContestContent(String contestContent) {
		this.contestContent = contestContent;
	}
	public String getPosterName() {
		return posterName;
	}
	public void setPosterName(String posterName) {
		this.posterName = posterName;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public int getPartNum() {
		return partNum;
	}
	public void setPartNum(int partNum) {
		this.partNum = partNum;
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
	public String getPartContent() {
		return partContent;
	}
	public void setPartContent(String partContent) {
		this.partContent = partContent;
	}
	public int getPartPhotoNum() {
		return partPhotoNum;
	}
	public void setPartPhotoNum(int partPhotoNum) {
		this.partPhotoNum = partPhotoNum;
	}
	public String getPartPhotoName() {
		return partPhotoName;
	}
	public void setPartPhotoName(String partPhotoName) {
		this.partPhotoName = partPhotoName;
	}
	public List<MultipartFile> getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(List<MultipartFile> selectFile) {
		this.selectFile = selectFile;
	}
	public int getFileNum() {
		return fileNum;
	}
	public void setFileNum(int fileNum) {
		this.fileNum = fileNum;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
}
