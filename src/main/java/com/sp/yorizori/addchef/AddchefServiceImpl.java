package com.sp.yorizori.addchef;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yorizori.common.dao.CommonDAO;
import com.sp.yorizori.addchef.Addchef;

@Service("addchef.addchefService")
public class AddchefServiceImpl implements AddchefService {
	
	@Autowired
	private  CommonDAO dao;
	
	
	@Override
	public void insertAddchef(Addchef dto) throws Exception {
		try {
			// if (dto.getEmail1().length() != 0 && dto.getEmail2().length() != 0) {
			//	dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
			// }

			// if (dto.getTel1().length() != 0 && dto.getTel2().length() != 0 && dto.getTel3().length() != 0) {
			//	dto.setTel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());
			// }
			
			// long memberSeq = dao.selectOne("member.memberSeq");
			
			// dto.setMemberIdx(memberSeq);

			// 회원정보 저장
			dao.insertData("addchef.insertAddchef", dto);

			// dao.insertData("member.insertMember1", dto);
			// dao.insertData("member.insertMember2", dto);
			// dao.updateData("member.insertMember", dto); // member1, member2 테이블 동시에
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public Addchef readAddchef(String userId) {
		Addchef dto = null;

		try {
			dto = dao.selectOne("addchef.readAddchef", userId);

			/* if (dto != null) {
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
			*/
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void updateAcceptance(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("addchef.updateAcceptance", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
