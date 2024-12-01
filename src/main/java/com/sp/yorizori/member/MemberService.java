package com.sp.yorizori.member;

import java.util.Map;

public interface MemberService {
	public Member loginMember(String userId);
	
	public void insertMember(Member dto) throws Exception;
	
	public void updateMember(Member dto) throws Exception;
	public void updateMember(Member dto, String pathname) throws Exception;
	
	public boolean isMemberImage(Map<String, Object> map);
	
	public Member readMember(String userId);
	
	public void deleteMember(String userId) throws Exception;
	
	public void generatePwd(Member dto) throws Exception;
	
	public void updateMemberPhoto(Member dto, String pathname) throws Exception;
	public void insertMemberPhoto(Member dto, String pathname) throws Exception;
	public void deleteMemberPhoto(String userId);
	
}