package com.sp.yorizori.addchef;

import java.util.HashMap;





import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sp.yorizori.member.SessionInfo;





@Controller("addchef.AddChefController")
@RequestMapping(value = "/addchef/*")
public class AddchefController {
	
	@Autowired
	private AddchefService service;
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String addchef(Model model,HttpSession session) {

		SessionInfo info = (SessionInfo)session.getAttribute("member");
		model.addAttribute("mode", "addchef");
		model.addAttribute("id", info.getUserId());
		model.addAttribute("nickname", info.getNickName());
		model.addAttribute("username", info.getUserName());
		
		return ".addchef.write";
	}
	
	@RequestMapping(value = "addchef")
	public String addchefSubmit(Addchef dto,
			final RedirectAttributes reAttr,
			Model model,HttpSession session) {
		
		System.out.println("addchef:"+ dto.getUserId());
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		System.out.println(info.getUserId());
		
		try {
			dto.setUserId(info.getUserId());
			service.insertAddchef(dto);
		} catch (DuplicateKeyException e) {
			// 기본키 중복에 의한 제약 조건 위반
			model.addAttribute("mode", "addchef");
			model.addAttribute("message", "제약 조건 위반으로 신청전송이 실패했습니다");
			return ".addchef.write";
		} catch (DataIntegrityViolationException e) {
			// 데이터형식 오류, 참조키, NOT NULL 등의 제약조건 위반
			model.addAttribute("mode", "addchef");
			model.addAttribute("message", "제약 조건 위반으로 신청전송이 실패했습니다.");
			return ".addchef.write";
		} catch (Exception e) {
			model.addAttribute("mode", "addchef");
			model.addAttribute("message", "신청전송이 실패했습니다.");
			return ".addchef.write";
		}

		StringBuilder sb = new StringBuilder();
		sb.append(dto.getUserId() + "님의 셰프신청이 정상적으로 처리되었습니다.<br>");

		// 리다이렉트된 페이지에 값 넘기기
		reAttr.addFlashAttribute("message", sb.toString());
		reAttr.addFlashAttribute("title", "셰프 신청");

		return "redirect:/addchef/complete";
	}
	
	@RequestMapping(value = "complete")
	public String complete(@ModelAttribute("message") String message) throws Exception {

		// 컴플릿 페이지(complete.jsp)의 출력되는 message와 title는 RedirectAttributes 값이다.
		// F5를 눌러 새로 고침을 하면 null이 된다.

		if (message == null || message.length() == 0) // F5를 누른 경우
			return "redirect:/";

		return ".addchef.complete";
	}
	
	
	
}
