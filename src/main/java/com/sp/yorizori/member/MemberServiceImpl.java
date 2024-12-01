package com.sp.yorizori.member;

import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yorizori.common.FileManager;
import com.sp.yorizori.common.dao.CommonDAO;
import com.sp.yorizori.mail.Mail;
import com.sp.yorizori.mail.MailSender;


@Service("member.memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private  CommonDAO dao;
	
	@Autowired
	private MailSender mailSender;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public Member loginMember(String userId) {
		Member dto = null;
		
		try {
			dto = dao.selectOne("member.loginMember", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void insertMember(Member dto) throws Exception {
		try {
			if (dto.getEmail1().length() != 0 && dto.getEmail2().length() != 0) {
				dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
			}

			if (dto.getTel1().length() != 0 && dto.getTel2().length() != 0 && dto.getTel3().length() != 0) {
				dto.setTel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());
			}
			
			//long memberSeq = dao.selectOne("member.memberSeq");
			
			// dto.setMemberIdx(memberSeq);

			// 회원정보 저장
			dao.insertData("member.insertMember", dto);

			// dao.insertData("member.insertMember1", dto);
			// dao.insertData("member.insertMember2", dto);
			// dao.updateData("member.insertMember", dto); // member1, member2 테이블 동시에
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Member readMember(String userId) {
		Member dto = null;

		try {
			dto = dao.selectOne("member.readMember", userId);
			
			if (dto != null) {
				if (dto.getEmail() != null) {
					String[] s = dto.getEmail().split("@");
					dto.setEmail1(s[0]);
					dto.setEmail2(s[1]);
				}

				if (dto.getTel() != null) {
					String[] s = dto.getTel().split("-");
					dto.setTel1(s[0]);
					dto.setTel2(s[1]);
					dto.setTel3(s[2]);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void updateMember(Member dto, String pathname) throws Exception {
		String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
		
		try {
			if(saveFilename != null) {
				if(dto.getImageFilename().length() != 0) {
					fileManager.doFileDelete(dto.getImageFilename(), pathname);
				}
				
				dto.setImageFilename(saveFilename);
			}
			
			dao.updateData("member.updateMember", dto);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteMember(String userId) throws Exception {
		try {
			dao.updateData("member.deleteMember", userId);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void generatePwd(Member dto) throws Exception {
		// 10 자리 임시 패스워드 생성
		StringBuilder sb = new StringBuilder();
		String s = "~!@#$%^&*-+=()ABCDEFGHIJKLMNOPQRSTUVWXYZ012345678abcdefghijklmnopqrstuvwxyz";
		Random rd = new Random();
		for(int i = 0; i < 10; i++) {
			int  n = rd.nextInt(s.length());
			sb.append(s.substring(n, n+1));
		}
		
		String result;
		result = dto.getUserId() + "님의 새로 발급된 임시 패스워드는 <b>"
				+ sb.toString()
				+ "</b> 입니다.<br>"
				+ "로그인 후 반드시 패스워드를 변경하시기 바랍니다.";
		
		Mail mail = new Mail();
		mail.setReceiverEmail(dto.getEmail());
		
		mail.setSenderEmail("kimsan4516@naver.com");
		mail.setSenderName("관리자");
		mail.setSubject("임시 패시워드 발급");
		mail.setContent(result);
		
		boolean b = mailSender.mailSend(mail);
		
		if(b) {
			dto.setUserPwd(sb.toString());
			updateMember(dto);
		} else {
			throw new Exception("이메일 전송중 오류가 발생했습니다.");
		}

	}

	@Override
	public boolean isMemberImage(Map<String, Object> map) {
		boolean b = false;
		
		try {
			int result = dao.selectOne("member.isMemberPhoto", map);
			
			if(result > 0) {
				b = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return b;
	}

	@Override
	public void updateMember(Member dto) throws Exception {
		try {
			if (dto.getEmail1().length() != 0 && dto.getEmail2().length() != 0) {
				dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
			}

			if (dto.getTel1().length() != 0 && dto.getTel2().length() != 0 && dto.getTel3().length() != 0) {
				dto.setTel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());
			}
			
			dao.updateData("member.updateMember", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateMemberPhoto(Member dto, String pathname) throws Exception {
		String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
		
		try {
			if(saveFilename != null) {
				
				dto.setImageFilename(saveFilename);
			}
			
			dao.updateData("member.updateMemberPhoto", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertMemberPhoto(Member dto, String pathname) throws Exception {
		String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
		
		try {
			if(saveFilename != null) {
				
				
				dto.setImageFilename(saveFilename);
				
				dao.insertData("member.insertMemberPhoto", dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteMemberPhoto(String userId) {
		try {
			dao.deleteData("member.deleteMemberPhoto", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}