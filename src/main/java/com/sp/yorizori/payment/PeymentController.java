package com.sp.yorizori.payment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.yorizori.member.SessionInfo;


@Controller("payment.PeymentController")
@RequestMapping("/payment/*")
public class PeymentController {
	
	@Autowired
	private PaymentService service;
	
	@RequestMapping(value = "pay", method = RequestMethod.GET)
	public String payment(
			@RequestParam int classCode,
			HttpSession session, 
			Model model
			) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Payment dto = service.readClass(classCode);
		List<Payment> list = service.listCoupon(info.getUserId());
		
		if(dto == null) {
			return "redirect:/class/list";
		}
		
		model.addAttribute("list", list);
		model.addAttribute("dto", dto);
		
		return ".class.payment";
	}
	
	@RequestMapping(value = "pay", method = RequestMethod.POST)
	public String paymentSubmit(Payment dto, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			service.insertOrder(dto);
		} catch (Exception e) {
		}
		
		return "redirect:/payment/paycheck?orderCode=" + dto.getOrderCode();
	}
	
	@RequestMapping(value = "coupon", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> coupon (
			@RequestParam int eventNum
			) throws Exception {
		
		List<Payment> list = service.coupon(eventNum);
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("list", list);
		
		return model;
	}
	
	@RequestMapping(value = "paycheck")
	public String pay(
			@RequestParam int orderCode,
			HttpSession session, Model model
			) {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Payment dto = service.readOrder(orderCode);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("userId", info.getUserId());
		map.put("orderCode", orderCode);
		
		model.addAttribute("dto", dto);
		
		return ".class.pay";
	}
}
